<?php 
    include('../login/protecao.php');
    include('../login/conexao.php');    

    extract($_POST);

    $nome_arquivo = '';
    
    $id = $_GET['id'];

    $consulta = "SELECT * FROM discente WHERE id = '$id'";
    $resultado = banco($server, $user, $password, $db, $consulta);
    if($resultado->num_rows > 0){
        while($user_data = mysqli_fetch_assoc($resultado))
        {
            $nome1 = $user_data['nome_aluno'];
            $matricula1 = $user_data['matricula'];
            $email1 = $user_data['email'];  
        }
    }

    if(isset($acao)){
        if (!file_exists('anexos')) {
            mkdir('anexos', 0777, true);
        
            // Verifica se o arquivo foi enviado corretamente
            if(isset($_FILES['file']) && $_FILES['file']['error'] == 0){
                $arquivo = $_FILES['file'];

                // Verifica a extensão do arquivo
                $extensao = pathinfo($arquivo['name'], PATHINFO_EXTENSION);
                if($extensao != 'pdf'){
                    die('Não é possível fazer upload desse formato de arquivo');
                }

                // Move o arquivo para o local desejado
                $nome_arquivo = 'anexos/' . $arquivo['name'];
                move_uploaded_file($arquivo['tmp_name'], $nome_arquivo);
            } else {
                // Não foi enviado um arquivo, defina $nome_arquivo como vazio ou null, dependendo do seu banco de dados
                $nome_arquivo = ''; // Ou null, dependendo do seu banco de dados
            }
        }
        $endereco = $end . ', ' . $bairro . ', ' . $cidade . ' - ' . $uf; 
        $consulta = "SELECT endereco FROM discente WHERE matricula = '$matricula'";
        $resultado = banco($server, $user, $password, $db, $consulta);
        if ($resultado != $endereco){
            $consulta = "UPDATE discente SET endereco = '$endereco' WHERE matricula = '$matricula'";
            $resultado = banco($server, $user, $password, $db, $consulta);
        }
        date_default_timezone_set("America/Sao_Paulo");
        $data_registro = date('y/m/d G:i:s');
        $status = 'Em análise';

        // 1. Inserir na tabela requerimento
        $consulta = "INSERT INTO requerimento(objeto, data_inicial, data_final, `data/hora_regis`, obs, anexos, `status`, turma, discente_matricula, idcurso, email) 
                     VALUES ('$objeto','$data_inicial','$data_final','$data_registro','$obs','$nome_arquivo','$status','$turma','$matricula','$curso','$email')";
        banco($server, $user, $password, $db, $consulta);

        // 2. Recuperar o valor de AUTO_INCREMENT
        $auto_increment_query = "SELECT LAST_INSERT_ID() as id";
        $auto_increment_result = banco($server, $user, $password, $db, $auto_increment_query);
        $auto_increment_value = $auto_increment_result->fetch_assoc()['id'];

        // 3. Inserir na tabela docente usando o valor obtido
        $docente_e = $docente_nome . ',' . $docentes_nomes;
        $docente_n = $docente_email . ',' . $docentes_emails;

        $consultaDocente = "INSERT INTO `docente`(`email`, `nome`, `idrequerimento`) 
                            VALUES ('$docente_e', '$docente_n', '$auto_increment_value')";
        banco($server, $user, $password, $db, $consultaDocente);   
    }
?>
    <!DOCTYPE html>
    <html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/requerimento.css">
        <script src="../js/funcoes.js"></script>
        <title>Documento</title>

    </head>
    <body>
        <h1> Requerimento</h1>
        <form action="" method="post" enctype="multipart/form-data">
            <label>Nome Completo:</label>
            <input type="text" name="nome" value=<?php echo $nome1;?>>

            <label> CEP (opcional): </label> 
            <input type="text" name="cep" id="cep" onchange="buscarEndereco()">

            <label>Endereço: </label>
            <input type="text" name="end" id="end" required>

            <label>Bairro:</label>
            <input type="text" name="bairro" id="bairro" required>

            <label>Cidade:</label>
            <input type="text" name="cidade" id="cidade" required>

            <label> UF: </label>
            <input type="text" name="uf" id="uf" required> 

            <label>Email:</label>
            <input type="text" name="email" value=<?php echo $email1;?>>

            <label>Curso:</label>
            <?php

                $consultaCurso = "SELECT idcurso, nome_curso FROM curso";
                $resultadoCurso = banco("localhost", "root", "", "projeto", $consultaCurso);

                echo "<select name='curso'>";
                while ($linhaCurso = $resultadoCurso->fetch_assoc()) {
                    echo "<option value=" . $linhaCurso["idcurso"] . ">" . $linhaCurso["nome_curso"] . "</option>";
                }
                echo "</select>";
            ?>

            <label>Turma:</label>
            <?php 
                $consultaTurma = "SELECT id_curso, nometurma FROM turma INNER JOIN curso ON idcurso WHERE id_curso = idcurso"; 
                $resultadoTurma = banco("localhost", "root", "", "projeto", $consultaTurma);

                echo "<select name='turma'>";
                while ($linhaTurma = $resultadoTurma->fetch_assoc()) {
                    echo "<option value=" . $linhaTurma["id_curso"] . ">" . $linhaTurma["nometurma"] . "</option>";
                }
                echo "</select>";
            ?>

            <label>Matrícula:</label>
            <input type="text" name="matricula" value=<?php echo $matricula1;?> required>

            <label>Nome do docente: </label>
            <input type="text" name="docente_nome" required>
            
            <label>Adicionar mais docentes: </label>
            <textarea name="docentes_nomes" rows="5"></textarea>
            
            <label>Email do docente: </label>
            <input type="text" name="docente_email" required>
            
            <label>Adicionar emails aos docentes: </label>
            <textarea name="docentes_emails" rows="5"></textarea>

            <label>Data Inicial:</label>
            <input type="date" name = data_inicial required>

            <label>Data Final:</label>
            <input type="date" name = data_final required>

            <label>Objetivo:</label>
            <select name="objeto">
                <option value="Justificativa de Falta"> Justificativa de Falta</option>
                <option value="2° segunda chamada"> 2° segunda chamada</option>
                <option value="2° segunda chamada e Justificativa de Falta"> 2° segunda chamada e Justificativa de Falta</option>
            </select>

            <label>Observação:</label>
            <textarea name="obs" rows="5"></textarea>

            <input type= "file" name="file"/> 
            <input type="submit" value="Prosseguir" name='acao' >
            <a href="pagina_inicial.php">Voltar</a>
        </form>
</body>
</html>