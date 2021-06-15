-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Jun-2021 às 19:31
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `kubi`
--
CREATE DATABASE IF NOT EXISTS `kubi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `kubi`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `codaluno` int(40) NOT NULL,
  `nomealuno` varchar(80) NOT NULL,
  `email` double NOT NULL,
  `telefone` int(10) NOT NULL,
  `codturma` int(40) NOT NULL,
  `matricula` int(20) NOT NULL,
  PRIMARY KEY (`codaluno`),
  KEY `cod` (`codturma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `banca`
--

DROP TABLE IF EXISTS `banca`;
CREATE TABLE IF NOT EXISTS `banca` (
  `codprof` int(40) NOT NULL,
  `codprojeto` int(40) NOT NULL,
  KEY `cod` (`codprof`),
  KEY `codpro` (`codprojeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `codcurso` int(40) NOT NULL,
  `nomecurso` varchar(80) NOT NULL,
  `codturma` int(40) NOT NULL,
  `ano` date NOT NULL,
  `instituicao` varchar(80) NOT NULL,
  PRIMARY KEY (`codcurso`),
  KEY `cod` (`codturma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `codprof` int(80) NOT NULL,
  `nomeprof` varchar(80) NOT NULL,
  `email` double NOT NULL,
  `telefone` int(10) NOT NULL,
  PRIMARY KEY (`codprof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

DROP TABLE IF EXISTS `projeto`;
CREATE TABLE IF NOT EXISTS `projeto` (
  `codprojeto` int(40) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `nomeprojeto` varchar(80) NOT NULL,
  `codaluno` int(40) NOT NULL,
  `codprof` int(80) NOT NULL,
  `nomealuno` varchar(80) NOT NULL,
  `nomeprof` varchar(80) NOT NULL,
  PRIMARY KEY (`codprojeto`),
  KEY `cod` (`codaluno`),
  KEY `codp` (`codprof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatoria`
--

DROP TABLE IF EXISTS `relatoria`;
CREATE TABLE IF NOT EXISTS `relatoria` (
  `nomeprojeto` varchar(40) NOT NULL,
  `nomealuno` varchar(40) NOT NULL,
  `nota` int(5) NOT NULL,
  `observacao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `codturma` double NOT NULL,
  `nomealuno` varchar(80) NOT NULL,
  `nomecurso` varchar(80) NOT NULL,
  `turno` varchar(80) NOT NULL,
  `ano` varchar(4) NOT NULL,
  PRIMARY KEY (`codturma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `banca`
--
ALTER TABLE `banca`
  ADD CONSTRAINT `fk_codprof` FOREIGN KEY (`codprof`) REFERENCES `professor` (`codprof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_codprojeto` FOREIGN KEY (`codprojeto`) REFERENCES `projeto` (`codprojeto`);

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `fk_codaluno` FOREIGN KEY (`codaluno`) REFERENCES `aluno` (`codaluno`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
