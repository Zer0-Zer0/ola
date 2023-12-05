<?php 
    include("conexao.php");
    extract($_POST); 
    if (isset($entrar)){

        if(strlen($acesso) == 11){

            $consulta = "SELECT * FROM adm WHERE cod_adm = $acesso AND senha = '$senha'";
            $resultado = banco($server, $user, $password, $db, $consulta); 
                
            $quantidade = $resultado->num_rows;
                
            if($quantidade == 1){
                
                $projeto = $resultado->fetch_assoc();
                            
                if(!isset($_SESSION)){
                    session_start();
                }

                $_SESSION['id'] = $projeto['id'];

                header ('Location: ../administracao/pagina_adm.php');
                exit;
                            
            }
        } elseif(strlen($acesso) == 12){

            $consulta = "SELECT * FROM discente  WHERE  matricula = $acesso AND senha = '$senha'";
            $resultado = banco($server, $user, $password, $db, $consulta); 
                
            $quantidade = $resultado->num_rows;
                
            if($quantidade == 1){
                
                $projeto = $resultado->fetch_assoc();   
                            
                if(!isset($_SESSION)){
                    session_start();
                }

                $_SESSION['id'] = $projeto['id'];
                $_SESSION['nome'] = $projeto['nome'];

                header ('Location: ../discente/pagina_inicial.php/?&id=' . $_SESSION['id'] );
                exit;
                            
            }
        } elseif(strlen($acesso) == 7){
            
            $consulta = "SELECT * FROM coordenacao WHERE cod_siape = '$acesso'";
            $resultado = banco($server, $user, $password, $db, $consulta); 

            if ($resultado && $resultado->num_rows == 1) {
                $projeto = $resultado->fetch_assoc();
                if(!isset($_SESSION)){
                    session_start();
                }
        
                $_SESSION['id'] = $projeto['id'];
                $_SESSION['nome'] = $projeto['nome'];

                $senha_banco = $projeto['senha'];
                
                echo "Senha digitada: " . $senha . "<br>";
                echo "Senha armazenada no banco: " . $projeto['senha'] . "<br>";
    
                $valid_password = password_verify($senha, $senha_banco);
        
                if($valid_password){
                    if($projeto['coordenacao'] == "Coordenação de Registro (CORES)"){
                        header ('Location: ../coordenacao/cores.php');
                        exit;
                    }elseif($projeto['coordenacao']  == "Coordenação de Curso de Informática"){
                        header ('Location: ../coordenacao/coordenador.php/?&ei=' . $ei);
                        exit;
                    }elseif($projeto['coordenacao']  == "Coordenação de Curso de Edificações"){
                        header ('Location: ../coordenacao/coordenador.php/?&ed=' . $ed);
                        exit;
                    }elseif($projeto['coordenacao']  == "Coordenação de Curso de Meio Ambiente"){
                        header ('Location: ../coordenacao/coordenador.php/?&ema=' . $ema);
                        exit;
                    }else{
                        echo "Falha ao logar! Não existe ninguém cadastrado com esses dados";
                    }
                }else{
                    echo "Senha inválida";
                }
            }else{
                echo "Não existe gente aqui";
            }
        }
        else {
            echo "Falha ao logar! Não existe alguém cadastrado com esses dados";
        }   
    }    
   
?>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
     <!-- Guilherme -->
</head>
<body>

     <form action="" method ="post" autocomplete="off">
                Usuário: <input type="text" name="acesso" required><br>
                Senha: <input type="password" name="senha" required><br><br>
                <input type="submit" name="entrar" value="Entrar">
                <a href="busca.php" target> Esqueceu a senha? </a>
                <a href="suporte.php" target> Suporte </a>
                <a href="../discente/cadastro.php" target> Cadastre-se aluno </a>

    </form>
</body>
</html>