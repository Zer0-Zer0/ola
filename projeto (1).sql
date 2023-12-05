-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/12/2023 às 17:29
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `adm`
--

CREATE TABLE `adm` (
  `id` int(11) NOT NULL,
  `cod_adm` bigint(11) NOT NULL,
  `senha` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `adm`
--

INSERT INTO `adm` (`id`, `cod_adm`, `senha`) VALUES
(1, 15042005181, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `coordenacao`
--

CREATE TABLE `coordenacao` (
  `identificador` varchar(6) NOT NULL,
  `cod_siape` bigint(7) NOT NULL,
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `coordenacao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `coordenacao`
--

INSERT INTO `coordenacao` (`identificador`, `cod_siape`, `id`, `nome`, `email`, `senha`, `coordenacao`) VALUES
('461429', 1234567, 13, 'GuiBorges', '1234567@ifba.edu.br', '$2y$10$ntUQrAbQ5Pn.KgUP89a2.OcZG5moIxRwvDQEdhMIJeGt8BmgLgcMG', 'Coordenação de Registro (CORES) '),
('fc4041', 2221110, 14, 'Gui', '2221110@ifba.edu.br', '$2y$10$tdrUaehbGLWQTCRAVCwM6uduXUuBOJbUQ78apEcb9UMY4cx1UoV2q', 'Coordenação de Registro (CORES) ');

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL,
  `nome_curso` varchar(50) NOT NULL,
  `discente_matricula` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `curso`
--

INSERT INTO `curso` (`idcurso`, `nome_curso`, `discente_matricula`) VALUES
(1, 'Informática ', 202013600016);

-- --------------------------------------------------------

--
-- Estrutura para tabela `discente`
--

CREATE TABLE `discente` (
  `id` int(11) NOT NULL,
  `matricula` bigint(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `nome_aluno` varchar(100) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `identificador` varchar(6) NOT NULL,
  `curso` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `discente`
--

INSERT INTO `discente` (`id`, `matricula`, `email`, `senha`, `nome_aluno`, `endereco`, `identificador`, `curso`) VALUES
(1, 202013600016, '202013600016@ifba.edu.br', '202032', 'Guilherme', 'Rua Salvador, Vivendas Costa Azul, Eunápolis - BA', '776506', 'Informática'),
(2, 202013608817, '202013608817@ifba.edu.br', '$2y$10$6tfqmT6.2NJY5', 'Guilherme', 'Rua Salvador, Vivendas Costa Azul, Eunápolis - BA', '22bcd1', 'Edificações');

-- --------------------------------------------------------

--
-- Estrutura para tabela `docente`
--

CREATE TABLE `docente` (
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idrequerimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagens`
--

CREATE TABLE `imagens` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `path` varchar(100) NOT NULL DEFAULT current_timestamp(),
  `data_upload` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `imagens`
--

INSERT INTO `imagens` (`id`, `nome`, `path`, `data_upload`) VALUES
(11, 'Logon.jpg', 'upload/6556d7a83dd7f.jpg', '0000-00-00 00:00:00'),
(12, 'Logon.jpg', 'upload/6556d86609af7.jpg', '0000-00-00 00:00:00'),
(13, 'Logon.jpg', 'upload/6556d88711fec.jpg', '0000-00-00 00:00:00'),
(14, 'Logon.jpg', 'upload/6556d88e2c902.jpg', '0000-00-00 00:00:00'),
(15, 'Logon.jpg', 'upload/6556d8ac600c6.jpg', '0000-00-00 00:00:00'),
(16, 'Logon.jpg', 'upload/6556d8b07d744.jpg', '0000-00-00 00:00:00'),
(17, 'Logon.jpg', 'upload/6556d9370aa89.jpg', '0000-00-00 00:00:00'),
(18, 'Logon.jpg', 'upload/6556d9377195c.jpg', '0000-00-00 00:00:00'),
(19, 'Logon.jpg', 'upload/6556d937a22dd.jpg', '0000-00-00 00:00:00'),
(20, 'Logon.jpg', 'upload/6556d937cdbad.jpg', '0000-00-00 00:00:00'),
(21, 'Logon.jpg', 'upload/6556d93803a81.jpg', '0000-00-00 00:00:00'),
(22, 'Logon.jpg', 'upload/6556d93d276e0.jpg', '0000-00-00 00:00:00'),
(23, 'Logon.jpg', 'upload/6556d9448113d.jpg', '0000-00-00 00:00:00'),
(24, 'Logon.jpg', 'upload/6556d944cf436.jpg', '0000-00-00 00:00:00'),
(25, 'Logon.jpg', 'upload/6556d94502ae0.jpg', '0000-00-00 00:00:00'),
(26, 'Logon.jpg', 'upload/6556d9475365f.jpg', '0000-00-00 00:00:00'),
(27, 'Logon.jpg', 'upload/6556d9478a39d.jpg', '0000-00-00 00:00:00'),
(28, 'Logon.jpg', 'upload/6556d947b49e7.jpg', '0000-00-00 00:00:00'),
(29, 'Logon.jpg', 'upload/6556d947dd842.jpg', '0000-00-00 00:00:00'),
(30, 'Logon.jpg', 'upload/6556d94f9bc5e.jpg', '0000-00-00 00:00:00'),
(31, 'Logon.jpg', 'upload/6556d97071dce.jpg', '0000-00-00 00:00:00'),
(32, 'Logon.jpg', 'upload/6556d9711b0ea.jpg', '0000-00-00 00:00:00'),
(33, 'Logon.jpg', 'upload/6556d9714a3fb.jpg', '0000-00-00 00:00:00'),
(34, 'Logon.jpg', 'upload/6556d9717a642.jpg', '0000-00-00 00:00:00'),
(35, 'Logon.jpg', 'upload/6556d97ba97ad.jpg', '0000-00-00 00:00:00'),
(36, 'Logon.jpg', 'upload/6556d97bd8026.jpg', '0000-00-00 00:00:00'),
(37, 'Logon.jpg', 'upload/6556d97c11c63.jpg', '0000-00-00 00:00:00'),
(38, 'Logon.jpg', 'upload/6556d97c3e375.jpg', '0000-00-00 00:00:00'),
(39, 'Logon.jpg', 'upload/6556d985b8082.jpg', '0000-00-00 00:00:00'),
(40, 'Logon.jpg', 'upload/6556d98620335.jpg', '0000-00-00 00:00:00'),
(41, 'Logon.jpg', 'upload/6556d986496e0.jpg', '0000-00-00 00:00:00'),
(42, 'Logon.jpg', 'upload/6556d9867279e.jpg', '0000-00-00 00:00:00'),
(43, 'Logon.jpg', 'upload/6556d9aab5af6.jpg', '0000-00-00 00:00:00'),
(44, 'Logon.jpg', 'upload/6556d9b8f1a21.jpg', '0000-00-00 00:00:00'),
(45, 'Logon.jpg', 'upload/6556d9fed18ba.jpg', '0000-00-00 00:00:00'),
(46, 'Logon.jpg', 'upload/6556d9ff0955d.jpg', '0000-00-00 00:00:00'),
(47, 'Logon.jpg', 'upload/6556da0f1fdbb.jpg', '0000-00-00 00:00:00'),
(48, 'Logon.jpg', 'upload/6556da0f94066.jpg', '0000-00-00 00:00:00'),
(49, 'Logon.jpg', 'upload/6556da0fce619.jpg', '0000-00-00 00:00:00'),
(50, 'Logon.jpg', 'upload/6556da715de13.jpg', '0000-00-00 00:00:00'),
(51, 'Logon.jpg', 'upload/6556da71f292d.jpg', '0000-00-00 00:00:00'),
(52, 'Logon.jpg', 'upload/6556dad57c7da.jpg', '0000-00-00 00:00:00'),
(53, 'Logon.jpg', 'upload/6556dad603d9e.jpg', '0000-00-00 00:00:00'),
(54, 'Logon.jpg', 'upload/6556dad631f34.jpg', '0000-00-00 00:00:00'),
(55, 'Logon.jpg', 'upload/6556dad65b45a.jpg', '0000-00-00 00:00:00'),
(56, 'Logon.jpg', 'upload/6556daeb5f362.jpg', '0000-00-00 00:00:00'),
(57, 'Logon.jpg', 'upload/6556db1725be3.jpg', '0000-00-00 00:00:00'),
(58, 'Logon.jpg', 'upload/6556db17ab7c9.jpg', '0000-00-00 00:00:00'),
(59, 'Logon.jpg', 'upload/6556db17dd50b.jpg', '0000-00-00 00:00:00'),
(60, 'Logon.jpg', 'upload/6556db1da2112.jpg', '0000-00-00 00:00:00'),
(61, 'Logon.jpg', 'upload/6556db1dd58eb.jpg', '0000-00-00 00:00:00'),
(62, 'Logon.jpg', 'upload/6556db1e11d1d.jpg', '0000-00-00 00:00:00'),
(63, 'Logon.jpg', 'upload/6556db1e40ab6.jpg', '0000-00-00 00:00:00'),
(64, 'Logon.jpg', 'upload/6556db1e70863.jpg', '0000-00-00 00:00:00'),
(65, 'Logon.jpg', 'upload/6556db84b1443.jpg', '0000-00-00 00:00:00'),
(66, 'Logon.jpg', 'upload/6556db853cff9.jpg', '0000-00-00 00:00:00'),
(67, 'Logon.jpg', 'upload/6556db856e468.jpg', '0000-00-00 00:00:00'),
(68, 'Logon.jpg', 'upload/6556db859ccd2.jpg', '0000-00-00 00:00:00'),
(69, 'Logon.jpg', 'upload/6556db85c64e9.jpg', '0000-00-00 00:00:00'),
(70, 'Logon.jpg', 'upload/6556db86020df.jpg', '0000-00-00 00:00:00'),
(71, 'Logon.jpg', 'upload/6556db8630389.jpg', '0000-00-00 00:00:00'),
(72, 'Logon.jpg', 'upload/6556db865d1c8.jpg', '0000-00-00 00:00:00'),
(73, 'Logon.jpg', 'upload/6556db8691407.jpg', '0000-00-00 00:00:00'),
(74, 'Logon.jpg', 'upload/6556dbb086c7d.jpg', '0000-00-00 00:00:00'),
(75, 'Logon.jpg', 'upload/6556dbb0d5308.jpg', '0000-00-00 00:00:00'),
(76, 'Logon.jpg', 'upload/6556dbb1156d6.jpg', '0000-00-00 00:00:00'),
(77, 'Logon.jpg', 'upload/6556dbd78d38e.jpg', '0000-00-00 00:00:00'),
(78, 'Logon.jpg', 'upload/6556dbd7ee702.jpg', '0000-00-00 00:00:00'),
(79, 'Logon.jpg', 'upload/6556dbdc04fd9.jpg', '0000-00-00 00:00:00'),
(80, 'Logon.jpg', 'upload/6556dd099b504.jpg', '0000-00-00 00:00:00'),
(81, 'Logon.jpg', 'upload/6556dd0eadd30.jpg', '0000-00-00 00:00:00'),
(82, 'ei31 (2).jpg', 'upload/6556dd164528e.jpg', '0000-00-00 00:00:00'),
(83, 'ei31 (2).jpg', 'upload/6556dd22e58b4.jpg', '0000-00-00 00:00:00'),
(84, 'ei31 (2).jpg', 'upload/6556dd2454f37.jpg', '0000-00-00 00:00:00'),
(85, 'Logon.jpg', 'upload/6556dd2db3956.jpg', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `requerimento`
--

CREATE TABLE `requerimento` (
  `idrequerimento` int(11) NOT NULL,
  `objeto` varchar(200) NOT NULL,
  `data_inicial` date NOT NULL,
  `data_final` date NOT NULL,
  `data/hora_regis` datetime(6) NOT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `anexos` varchar(255) NOT NULL,
  `status` varchar(45) NOT NULL,
  `turma` varchar(10) NOT NULL,
  `discente_matricula` bigint(15) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `requerimento`
--

INSERT INTO `requerimento` (`idrequerimento`, `objeto`, `data_inicial`, `data_final`, `data/hora_regis`, `obs`, `anexos`, `status`, `turma`, `discente_matricula`, `idcurso`, `email`) VALUES
(14, '2° segunda chamada e Justificativa de Falta', '2023-11-22', '0000-00-00', '2023-11-26 18:23:56.000000', 'asdasdasd', '', 'Recusado', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(15, 'Justificativa de Falta', '2023-11-01', '0000-00-00', '2023-11-26 18:31:45.000000', 'asdasdasd', 'anexos/RELATÓRIO ACADÊMICO - Guilherme Rocha.pdf', 'Em Verificação', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(16, 'Justificativa de Falta', '2023-11-02', '2023-11-25', '2023-11-26 18:42:06.000000', 'asdas', '', 'Em Verificação', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(17, 'Justificativa de Falta', '2023-11-09', '2023-11-01', '2023-11-26 18:43:12.000000', 'asd', '', 'Em Verificação', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(18, 'Justificativa de Falta', '2023-11-01', '0000-00-00', '2023-11-26 18:47:09.000000', 'asd', 'anexos/RELATÓRIO ACADÊMICO - Guilherme Rocha.pdf', 'Enviado para o coordenador', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(19, 'Justificativa de Falta', '2023-12-01', '0000-00-00', '2023-11-26 18:47:56.000000', 'asdasd', '', 'Em Verificação', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(20, 'Justificativa de Falta', '2023-11-15', '0000-00-00', '2023-11-26 18:48:25.000000', 'asfdasf', '', 'Em Verificação', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(21, 'Justificativa de Falta', '2023-11-01', '0000-00-00', '2023-11-26 18:49:01.000000', 'asfdas', '', 'Em Verificação', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(22, 'Justificativa de Falta', '2023-11-23', '0000-00-00', '2023-11-26 18:50:15.000000', 'sasfd', '', 'Em Verificação', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(23, 'Justificativa de Falta', '2023-11-01', '0000-00-00', '2023-11-26 18:51:24.000000', 'asasf', '', 'Em Verificação', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(24, 'Justificativa de Falta', '2023-11-01', '2023-11-30', '2023-11-26 18:54:08.000000', 'asdasddasd', '', 'Recusado', 'EI-41', 202013600016, 1, '202013600016@ifba.edu.br'),
(25, 'Justificativa de Falta', '2023-12-30', '2023-12-31', '2023-12-01 20:08:44.000000', 'asdasd', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(26, 'Justificativa de Falta', '2023-12-30', '2023-12-31', '2023-12-01 20:12:53.000000', 'asdasd', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(27, 'Justificativa de Falta', '2023-12-30', '2023-12-31', '2023-12-01 20:12:57.000000', 'asdasd', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(28, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 20:59:51.000000', 'Nenhuma', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(29, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:00:34.000000', 'Nenhuma', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(30, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:00:34.000000', 'Nenhuma', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(31, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:00:39.000000', 'Nenhuma', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(32, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:00:39.000000', 'Nenhuma', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(33, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:00:49.000000', 'Nenhuma', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(34, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:00:49.000000', 'Nenhuma', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(35, 'Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:01:07.000000', 'ffd', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(36, 'Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:01:07.000000', 'ffd', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(37, 'Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:04:40.000000', 'ffd', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(38, 'Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:04:40.000000', 'ffd', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(39, 'Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:12:10.000000', 'ffd', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(40, 'Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-01 21:12:10.000000', 'ffd', '', 'Em Verificação', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(41, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-29', '2023-12-02 08:21:33.000000', 'asdasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(42, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-29', '2023-12-02 08:22:56.000000', 'asdasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(43, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-29', '2023-12-02 08:30:27.000000', 'asdasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(44, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-29', '2023-12-02 08:30:44.000000', 'asdasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(45, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:30:58.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(46, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:37:29.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(47, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:41:29.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(48, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:41:46.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(49, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:48:28.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(50, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:49:49.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(51, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:50:28.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(52, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:50:50.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(53, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:54:42.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(54, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:55:29.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(55, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:55:54.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(56, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:56:22.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(57, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 08:56:31.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(58, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 09:11:30.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(59, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 09:12:04.000000', 'sdafasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(60, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 09:12:20.000000', 'asdasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(61, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 09:12:54.000000', 'asdasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(62, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-03', '2023-12-02 09:12:54.000000', 'asdasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(63, '2° segunda chamada', '2023-12-01', '2023-12-03', '2023-12-02 09:13:09.000000', 'sadasdas', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(64, '2° segunda chamada', '2023-12-01', '2023-12-03', '2023-12-02 09:13:09.000000', 'sadasdas', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(65, '2° segunda chamada', '2023-12-01', '2023-12-05', '2023-12-02 09:13:52.000000', 'asdsdasd', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(66, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-10', '2023-12-02 09:43:03.000000', 'asdas', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(67, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-10', '2023-12-02 09:43:47.000000', 'asdas', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(68, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-10', '2023-12-02 09:43:50.000000', 'asdas', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(69, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-10', '2023-12-02 09:44:06.000000', 'asdas', '', 'Em analise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(70, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-10', '2023-12-02 09:46:40.000000', 'asdas', '', 'Em análise', '1', 202013600016, 1, '202013600016@ifba.edu.br'),
(71, '2° segunda chamada e Justificativa de Falta', '2023-12-01', '2023-12-10', '2023-12-02 09:46:43.000000', 'asdas', '', 'Em análise', '1', 202013600016, 1, '202013600016@ifba.edu.br');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma`
--

CREATE TABLE `turma` (
  `idturma` int(11) NOT NULL,
  `nometurma` varchar(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `turma`
--

INSERT INTO `turma` (`idturma`, `nometurma`, `id_curso`) VALUES
(1, 'EI-31', 1),
(2, 'EI-41', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `adm`
--
ALTER TABLE `adm`
  ADD PRIMARY KEY (`cod_adm`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `coordenacao`
--
ALTER TABLE `coordenacao`
  ADD PRIMARY KEY (`cod_siape`),
  ADD UNIQUE KEY `id_coordenacao_UNIQUE` (`id`),
  ADD UNIQUE KEY `identificador` (`identificador`);

--
-- Índices de tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idcurso`),
  ADD KEY `fk_curso_discente1_idx` (`discente_matricula`);

--
-- Índices de tabela `discente`
--
ALTER TABLE `discente`
  ADD PRIMARY KEY (`matricula`),
  ADD UNIQUE KEY `identificador` (`identificador`),
  ADD KEY `id` (`id`);

--
-- Índices de tabela `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`idrequerimento`);

--
-- Índices de tabela `imagens`
--
ALTER TABLE `imagens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `requerimento`
--
ALTER TABLE `requerimento`
  ADD PRIMARY KEY (`idrequerimento`),
  ADD KEY `fk_requerimento_discente1_idx` (`discente_matricula`),
  ADD KEY `fk_requerimento_curso1_idx` (`idcurso`);

--
-- Índices de tabela `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`idturma`),
  ADD KEY `id_curso` (`id_curso`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `coordenacao`
--
ALTER TABLE `coordenacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `discente`
--
ALTER TABLE `discente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `imagens`
--
ALTER TABLE `imagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de tabela `requerimento`
--
ALTER TABLE `requerimento`
  MODIFY `idrequerimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `turma`
--
ALTER TABLE `turma`
  MODIFY `idturma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`discente_matricula`) REFERENCES `discente` (`matricula`);

--
-- Restrições para tabelas `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `fk_docente_requerimento1` FOREIGN KEY (`idrequerimento`) REFERENCES `requerimento` (`idrequerimento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `requerimento`
--
ALTER TABLE `requerimento`
  ADD CONSTRAINT `fk_requerimento_curso1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_requerimento_discente1` FOREIGN KEY (`discente_matricula`) REFERENCES `discente` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`idcurso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
