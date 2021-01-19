CREATE DATABASE  IF NOT EXISTS `atominge_mmeeting` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `atominge_mmeeting`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: atominge_mmeeting
-- ------------------------------------------------------
-- Server version	5.7.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cimaclientes`
--

DROP TABLE IF EXISTS `cimaclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cimaclientes` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cliente_tipoDoc` char(1) DEFAULT NULL COMMENT 'TIPO_DOC',
  `cliente_nroDoc` varchar(45) DEFAULT NULL COMMENT 'NRO_DOCUMENTO',
  `cliente_nombre` varchar(100) NOT NULL COMMENT 'NOMBRE',
  `cliente_direccion` varchar(45) DEFAULT NULL COMMENT 'DIRECCION',
  `cliente_ciudad` varchar(80) NOT NULL COMMENT 'CIUDAD',
  `cliente_localidad` varchar(80) NOT NULL COMMENT 'LOCALIDAD',
  `cliente_celular` varchar(45) DEFAULT NULL COMMENT 'CELULAR',
  `cliente_telefono` varchar(45) DEFAULT NULL COMMENT 'TELEFONO',
  `cliente_email` varchar(80) NOT NULL COMMENT 'CORREO',
  `cliente_contacto` varchar(80) NOT NULL COMMENT 'CONTACTO',
  `cliente_emailContacto` varchar(80) NOT NULL COMMENT 'CORREO CONTACTO',
  `cliente_teleContacto` varchar(80) NOT NULL COMMENT 'TEL CONTACTO',
  `cliente_fechaCreado` date DEFAULT NULL COMMENT 'FECHA_CREACION',
  `cliente_estado` char(1) DEFAULT NULL COMMENT 'ESTADO',
  `cliente_finalNombre` varchar(100) NOT NULL COMMENT 'CLIENTE FINAL',
  `cliente_finalDireccion` varchar(45) DEFAULT NULL COMMENT 'DIRECCION CNTE FINAL',
  `cliente_usuariouser` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cimaclientes`
--

LOCK TABLES `cimaclientes` WRITE;
/*!40000 ALTER TABLE `cimaclientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cimaclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_accesos`
--

DROP TABLE IF EXISTS `mm_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_accesos` (
  `acceso_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `acceso_empresa` int(11) DEFAULT NULL,
  `acceso_asistenteId` int(11) DEFAULT NULL COMMENT 'ASISTENTE',
  `acceso_comiteId` int(11) DEFAULT NULL COMMENT 'COMITE',
  `acceso_tipoAcceso` char(1) DEFAULT NULL COMMENT 'TIPO_ACCESO',
  PRIMARY KEY (`acceso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='acceso de asistentes a reuniones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_accesos`
--

LOCK TABLES `mm_accesos` WRITE;
/*!40000 ALTER TABLE `mm_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mm_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_agendaanexos`
--

DROP TABLE IF EXISTS `mm_agendaanexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_agendaanexos` (
  `anexos_id` int(11) NOT NULL AUTO_INCREMENT,
  `anexos_empresa` int(11) DEFAULT NULL,
  `anexos_comiteid` int(11) DEFAULT NULL,
  `anexos_agendaid` int(11) DEFAULT NULL,
  `anexos_anexo` varchar(100) DEFAULT NULL,
  `anexos_descripcion` varchar(100) DEFAULT NULL,
  `anexos_ruta` varchar(240) DEFAULT NULL,
  `anexos_usuario` varchar(45) DEFAULT NULL,
  `anexos_fecha` datetime DEFAULT NULL,
  `anexos_anno` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`anexos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_agendaanexos`
--

LOCK TABLES `mm_agendaanexos` WRITE;
/*!40000 ALTER TABLE `mm_agendaanexos` DISABLE KEYS */;
INSERT INTO `mm_agendaanexos` VALUES (1,1,14,61,'4._PRESUPUESTO_2014-2015.pdf','Detalles ','../actas/E00001/2018/comite14/acta61/4._PRESUPUESTO_2014-2015.pdf','317','2018-03-23 11:12:00',NULL),(2,1,14,61,'3._Bance__Resultados_y_Notas_2014 (1).pdf','Otro ejemplo','../actas/E00001/2018/comite14/acta61/3._Bance__Resultados_y_Notas_2014 (1).pdf','317','2018-03-23 11:17:00',NULL),(5,1,14,61,'3._Bance__Resultados_y_Notas_2014 (1).pdf','Otro ejemplo','../actas/E00001/2018/comite14/acta61/3._Bance__Resultados_y_Notas_2014 (1).pdf','317','2018-03-23 11:17:00',NULL),(8,2,12,71,'Declaracion 2018.pdf','Declaracion','../actas/E00002/2020/comite12/acta71/Declaracion 2018.pdf','320','2020-05-13 02:16:00','2020'),(9,2,17,70,'ex14.pdf','Documento Extraño  Volumen14 de junio 12 de 2017','../actas/E00002/2020/comite17/acta70/ex14.pdf','320','2020-05-14 10:17:00','2020'),(10,2,12,76,'ex103.pdf','cotizaciones','../actas/E00002/2020/comite12/acta76/ex103.pdf','320','2020-05-14 03:54:00','2020'),(11,2,18,78,'ex27.pdf','Soporte de las cotizaciiones de matriales','../actas/E00002/2020/comite18/acta78/ex27.pdf','320','2020-05-21 08:35:00','2020'),(12,2,0,0,'ava1.png','Logo o avatar','../actas/../reports/images/ava1.png','320','2020-05-21 08:40:00','2020'),(13,2,0,0,'ava1.png','Logo o avatar','../actas/../reports/images/ava1.png','320','2020-05-21 08:40:00','2020');
/*!40000 ALTER TABLE `mm_agendaanexos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_agendainvitados`
--

DROP TABLE IF EXISTS `mm_agendainvitados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_agendainvitados` (
  `invitado_id` int(11) NOT NULL AUTO_INCREMENT,
  `invitado_agendaId` int(11) DEFAULT NULL,
  `invitado_nombre` varchar(120) DEFAULT NULL,
  `invitado_empresa` varchar(120) DEFAULT NULL,
  `invitado_cargo` varchar(45) DEFAULT NULL,
  `invitado_celuar` varchar(20) DEFAULT NULL,
  `invitado_email` varchar(120) DEFAULT NULL,
  `invitado_asistio` char(1) DEFAULT NULL,
  `invitado_titulo` char(1) DEFAULT NULL,
  `invitado_orden` int(11) DEFAULT NULL,
  `invitado_causa` varchar(45) DEFAULT NULL,
  `invitado_empresaid` int(11) DEFAULT NULL,
  `invitado_comite` int(11) DEFAULT NULL,
  PRIMARY KEY (`invitado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COMMENT='Invitados al comite';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_agendainvitados`
--

LOCK TABLES `mm_agendainvitados` WRITE;
/*!40000 ALTER TABLE `mm_agendainvitados` DISABLE KEYS */;
INSERT INTO `mm_agendainvitados` VALUES (156,47,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com','S','S',0,' ',1,NULL),(157,47,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com','S','P',1,' ',1,NULL),(159,47,'Diana valentina','atom','secretaria','3422','alvaro.oycsoft@gmail.com','S','T',2,'',1,NULL),(160,48,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com','N','P',1,' ',1,NULL),(161,48,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com','N','',8,' ',1,NULL),(163,48,'alvaro Martinez','Atom sas','analista','123123','alvaro.oycsoft@gmail.com','N','S',1,' ',1,NULL),(164,48,'Dora Castellanos','Atom sas','secretraia','456','alvaro.oycsoft@gmail.com','N','T',2,' ',1,NULL),(165,48,'Eduardo ruiz','Atom sas','diseñador','54535','alvaro.oycsoft@gmail.com','N','',3,' ',1,NULL),(166,48,'Maria Eugenia','datos','vendedor','3102525268','alvaro.oycsoft@gmail.com','N','',4,' ',1,NULL),(167,48,'Benjamin Bernal','atom','analista','3104545678','alvarobucaros@hotmail.com','N','',5,'',1,NULL),(174,49,'Jair Roriguez','atom sas','Gerente','4566','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(175,49,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro@com.co','N','',0,'',1,NULL),(176,50,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(177,50,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(179,51,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(180,51,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(182,52,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(183,52,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(185,53,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(186,53,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(188,54,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(189,54,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(191,55,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(192,55,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(194,56,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(195,56,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(197,57,'Jair Roriguez','atom sas','Gerente','4566','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(198,57,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro@com.co','N','',0,'',1,NULL),(200,58,'Juan Camilo','Atom sas','Contador','12345','contador@com.co','N','',0,'',1,NULL),(201,59,'Juan Camilo','Atom sas','Contador','12345','contador@com.co','N','',0,'',1,NULL),(202,60,'Jair Roriguez','atom sas','Gerente','4566','alvaro.oycsoft@gmail.com','N','',0,'',1,NULL),(203,60,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro@com.co','N','',0,'',1,NULL),(205,61,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com','N','P',1,'razoon',1,NULL),(206,61,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com','S','S',2,'',1,NULL),(207,62,'Juan Camilo','Atom sas','Contador','12345','contador@com.co','S','',1,'',1,NULL),(215,67,'\nAlberto O','SOCIEDAD DE AMIGOS SAS','ter','3112540011','aoc@com.co','S','S',1,'',17,2),(216,67,'Pedro Navarro','casa','bebe','0088','alvaro.oycsoft@gmail.com','S','N',2,'',17,2),(218,68,'\nAlberto O','SOCIEDAD DE AMIGOS SAS','ter','3112540011','aoc@com.co','S','S',1,'',17,2),(219,68,'Pedro Navarro','casa','bebe','0088','alvaro.oycsoft@gmail.com','S','N',2,'',17,2),(224,70,'\nAlberto O','SOCIEDAD DE AMIGOS SAS','ter','3112540011','aoc@com.co','S','S',1,'',2,17),(225,70,'Pedro Navarro','casa','bebe','0088','alvaro.oycsoft@gmail.com','S','T',2,'',2,17),(226,70,'Antonio Mejia','Copias','Jefe','465','alvaro.oycsoft@gmail.com','S','P',3,'',2,17),(227,70,'Alvaro','sas','no','2313','alvaro.oycsoft@gmail.com','S','',9,'',2,17),(228,71,'Usuario transcriptor','sas','secre','123','alvaro.oycsoft@gmail.com','N','T',1,'',2,12),(229,71,'Usuario secretario','TOY','Doctor','456','alvaro.oycsoft@gmail.com','S','S',2,'',2,12),(231,71,'Don Alberto','SAS','Contador','789','alvaro.oycsoft@gmail.com','S','P',3,'',2,12),(232,71,'Invitado especial','sua','Jefe','4654','alvarobucaros@hotmail.com','S','',10,'',2,12),(233,71,'Transcriptor emergente','oio','piloto','6846','alvaro.oycsoft@gmail.com','S','T',11,'',2,12),(248,76,'Usuario transcriptor','sas','secre','123','alvaro.oycsoft@gmail.com','S','T',1,'',2,12),(249,76,'Usuario secretario','TOY','Doctor','456','alvaro.oycsoft@gmail.com','S','S',2,'',2,12),(251,76,'Mary','sae','contadora','5656','dg','S','P',3,'',2,12),(252,77,'Usuario transcriptor','sas','secre','123','alvaro.oycsoft@gmail.com','S','T',1,'',2,12),(253,77,'Usuario secretario','TOY','Doctor','456','alvaro.oycsoft@gmail.com','S','S',2,'',2,12),(254,78,'Jaime Salas','SAS','Jefe de Compras','123456','jsalas@sas.com','S','P',1,'',2,18),(255,78,'Juana Castaño','SAS','Secretara','9876','jcastano@sas.com','S','S',2,'',2,18),(257,78,'Roberto alvarez','SAS','Analista de compras','4345','alvaro.oycsoft@gmail.com','S','T',3,'',2,18),(258,78,'Doris Pelaez','SAS','Abogada','556676','alvaro.oycsoft@gmail.com','S','',4,'',2,18),(259,78,'Luis Suárez','SAS','Ingeniero','64565','alvaro.oycsoft@gmail.com','S','N',12,'',2,18);
/*!40000 ALTER TABLE `mm_agendainvitados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_agendamiento`
--

DROP TABLE IF EXISTS `mm_agendamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_agendamiento` (
  `agenda_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `agenda_empresa` int(11) DEFAULT NULL,
  `agenda_salonId` int(11) DEFAULT NULL COMMENT 'SALON',
  `agenda_Descripcion` varchar(500) DEFAULT NULL,
  `agenda_comiteId` int(11) DEFAULT NULL COMMENT 'COMITE',
  `agenda_fechaDesde` datetime DEFAULT NULL COMMENT 'FCH_DESDE',
  `agenda_fechaHasta` datetime DEFAULT NULL COMMENT 'FCH_HASTA',
  `agenda_comiteAnteriorId` int(11) DEFAULT NULL COMMENT 'COMITE_ANTERIOR',
  `agenda_usuario` int(11) DEFAULT NULL,
  `agenda_enFirme` char(1) DEFAULT NULL,
  `agenda_conCitacion` char(1) DEFAULT NULL,
  `agenda_acta` int(11) DEFAULT NULL,
  `agenda_estado` char(1) DEFAULT NULL,
  `agenda_causal` varchar(100) DEFAULT NULL,
  `agenda_ProxCitacion` varchar(100) DEFAULT NULL,
  `agenda_revisa` char(1) DEFAULT NULL,
  `agenda_cierraActa` char(1) DEFAULT NULL,
  PRIMARY KEY (`agenda_id`),
  KEY `agendaSalones_idx` (`agenda_salonId`),
  KEY `agendaComites_idx` (`agenda_comiteId`),
  CONSTRAINT `agendaComite` FOREIGN KEY (`agenda_comiteId`) REFERENCES `mm_comites` (`comite_id`),
  CONSTRAINT `agendaSalones` FOREIGN KEY (`agenda_salonId`) REFERENCES `mm_salones` (`salon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='Ocupacion de los salones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_agendamiento`
--

LOCK TABLES `mm_agendamiento` WRITE;
/*!40000 ALTER TABLE `mm_agendamiento` DISABLE KEYS */;
INSERT INTO `mm_agendamiento` VALUES (46,1,13,'Análisis estados financieros 2017',16,'2018-02-08 08:00:00','2018-02-08 10:00:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(47,1,14,'Revisa pronostico de ventas 1er bimestre 2018',14,'2018-02-07 07:00:00','2018-02-07 07:30:00',0,317,'S','S',0,'A','',NULL,NULL,NULL),(48,1,14,'Reunión del mes de enero de 2018',14,'2018-02-08 08:00:00','2018-02-08 09:00:00',0,317,'S','S',0,'A','',NULL,NULL,NULL),(49,1,13,'reunión mensual febrero 2018',15,'2018-02-20 07:00:00','2018-02-20 09:00:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(50,1,13,'Facturacion del mes',14,'2018-03-09 07:30:00','2018-03-09 09:30:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(51,1,14,'Nuevos tratados',14,'2018-03-09 11:00:00','2018-03-09 12:00:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(52,1,13,'Mas temas comerciales',14,'2018-03-02 07:00:00','2018-03-02 16:00:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(53,1,13,'Mas temas comerciales',14,'2018-03-02 07:00:00','2018-03-02 16:00:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(54,1,13,'Mas temas comerciales',14,'2018-03-02 07:00:00','2018-03-02 16:00:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(55,1,14,'mas comerciales',14,'2018-03-02 09:00:00','2018-03-02 10:00:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(56,1,13,'comerciallll',14,'2018-03-02 08:00:00','2018-03-02 09:30:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(57,1,13,'Casos de gerencia',15,'2018-03-12 15:30:00','2018-03-12 17:00:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(58,1,14,'análisis de resulltados',16,'2018-03-07 08:30:00','2018-03-07 09:30:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(59,1,14,'niifs',16,'2018-03-10 08:00:00','2018-03-10 08:30:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(60,1,13,'bueno',15,'2018-03-16 07:00:00','2018-03-16 10:00:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(61,1,14,'uno bueno y otro malo',14,'2018-03-12 10:00:00','2018-03-12 12:00:00',0,317,'S','S',4,'A','','12 de Abril de 2018 10am.',NULL,NULL),(62,1,14,'balances',16,'2018-05-10 09:00:00','2018-05-10 10:00:00',0,317,'N','N',0,'A','',NULL,NULL,NULL),(70,2,15,'Comite paritario de salud ocupacional del primer trimestre de 2020',17,'2020-05-13 14:00:00','2020-05-13 15:00:00',0,320,'S','S',7,'A','','2020-05-14 - 11:30','0','S'),(71,2,15,'Compra elementos de aseo',12,'2020-05-15 08:00:00','2020-05-15 09:00:00',0,320,'S','S',0,'A','','2020-05-29 - 10:00','1','N'),(76,2,15,'compras cafeteria',12,'2020-05-18 12:00:00','2020-05-18 12:30:00',1,320,'S','S',2,'A','','2020-05-25 - 08:30','0','S'),(77,2,9,'Otra compra',12,'2020-05-25 14:30:00','2020-05-25 16:30:00',2,320,'N','N',0,'A','','','0','N'),(78,2,16,'Comité del mes de mayo',18,'2020-05-26 07:30:00','2020-05-26 08:30:00',0,320,'S','S',1,'A','','2020-06-19 - 07:30','0','S');
/*!40000 ALTER TABLE `mm_agendamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_agendapendientes`
--

DROP TABLE IF EXISTS `mm_agendapendientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_agendapendientes` (
  `pendiente_id` int(11) NOT NULL AUTO_INCREMENT,
  `pendiente_empresa` int(11) DEFAULT NULL,
  `pendiente_comite` int(11) DEFAULT NULL,
  `pendiente_agendaId` int(11) DEFAULT NULL,
  `pendiente_tema` int(11) DEFAULT NULL,
  `pendiente_detalle` varchar(1024) DEFAULT NULL,
  `pendiente_responsable` varchar(128) DEFAULT NULL,
  `pendiente_fecha` date DEFAULT NULL,
  `pendiente_estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`pendiente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Temas pendientes de la reunión';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_agendapendientes`
--

LOCK TABLES `mm_agendapendientes` WRITE;
/*!40000 ALTER TABLE `mm_agendapendientes` DISABLE KEYS */;
INSERT INTO `mm_agendapendientes` VALUES (7,2,12,71,85,'Se esta procesando por ahora','Don Pedro','2020-05-15','P'),(8,2,12,71,85,'Otra anotación antes de terminar','Juancho','2020-05-17','P'),(9,2,12,71,85,'Se cumplio con todo porque ya se hizo lo que faltaba','Juancho','2020-05-18','P'),(10,2,12,71,85,'Final','Juancho','2020-05-18','C'),(11,2,12,71,85,'DD','Don Pedro','2020-05-15','C'),(12,2,12,71,85,'d3','Juancho','2020-05-18','P'),(13,2,18,78,118,'Faltaron los soportes contables para analizar la situación de la empresa,','Jaime','2020-05-29','P');
/*!40000 ALTER TABLE `mm_agendapendientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_agendatemas`
--

DROP TABLE IF EXISTS `mm_agendatemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_agendatemas` (
  `tema_id` int(11) NOT NULL AUTO_INCREMENT,
  `tema_agendaId` int(11) DEFAULT NULL,
  `tema_empresa` int(11) DEFAULT NULL,
  `tema_comite` int(11) DEFAULT NULL,
  `tema_titulo` varchar(128) DEFAULT NULL,
  `tema_detalle` varchar(1024) DEFAULT NULL,
  `tema_tipo` varchar(5) DEFAULT NULL,
  `tema_responsable` varchar(45) DEFAULT NULL,
  `tema_desarrollo` varchar(2048) DEFAULT NULL,
  `tema_fechaAsigna` date DEFAULT NULL,
  `tema_fechaCumple` date DEFAULT NULL,
  `tema_estado` char(1) DEFAULT NULL,
  `tema_orden` int(6) DEFAULT NULL,
  PRIMARY KEY (`tema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='Temas a tratar en la reunión';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_agendatemas`
--

LOCK TABLES `mm_agendatemas` WRITE;
/*!40000 ALTER TABLE `mm_agendatemas` DISABLE KEYS */;
INSERT INTO `mm_agendatemas` VALUES (47,47,1,14,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','Se dió lectura al acta y fué aprobada en su totalidad.','0000-00-00','0000-00-00','A',0),(48,48,1,14,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','','0000-00-00','0000-00-00','A',0),(49,48,1,14,'Ventas','Estado de ventas del periodo','GRAL','','','0000-00-00','0000-00-00','A',0),(50,48,1,14,'Cartera','Estado actual de cartera','GRAL','','','0000-00-00','0000-00-00','A',0),(51,47,1,14,'Proyecto ventas','Análisis del proyecto de ventas del año 2018 propuesto por la Gerencia Comercial','GRAL','Gerente de ventas','El estudio del pryecto conta de tres etaoas, la primera a desarrollar de enero a semana santa y cmprende un total de $45\'000.000, el segundo para desarrollar hasta junio 30 y consnste en promocionar los productos avender y el terecro hasta fin de año y es darle todo para vender los cien millones',NULL,NULL,'A',1),(52,49,1,15,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','','0000-00-00','0000-00-00','A',0),(56,56,1,14,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','','2018-03-02','0000-00-00','A',0),(57,56,1,14,'Ventas','Estado de ventas del periodo','GRAL','','','2018-03-02','0000-00-00','A',0),(58,56,1,14,'Cartera','Estado actual de cartera','GRAL','','','2018-03-02','0000-00-00','A',0),(59,56,1,14,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','','2018-03-02','0000-00-00','A',0),(60,56,1,14,'Ventas','Estado de ventas del periodo','GRAL','','','2018-03-02','0000-00-00','A',0),(61,56,1,14,'Cartera','Estado actual de cartera','GRAL','','','2018-03-02','0000-00-00','A',0),(62,57,1,15,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','','2018-03-12','0000-00-00','A',0),(63,58,1,16,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','','2018-03-07','0000-00-00','A',0),(64,59,1,16,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','','2018-03-10','0000-00-00','A',1),(65,60,1,15,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','','2018-03-16','0000-00-00','A',1),(66,61,1,14,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','Si se dedarrolla','2018-03-12','2018-03-07','A',1),(67,61,1,14,'Ventas','Estado de ventas del periodo','GRAL','','Se vendio bastante','2018-03-12','2018-03-07','A',2),(68,61,1,14,'Cartera','Estado actual de cartera','GRAL','','La cartera se encuentra desocupada..','2018-03-12','2018-03-07','A',3),(70,14,1,14,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','null',NULL,'2018-01-01','0000-00-00','A',1),(71,62,1,16,'Acta anterior','Lectura y aprobación del acta anterior','GRAL','','','2018-05-10','0000-00-00','A',1),(78,70,2,17,'VERIFICA ASISTENCIA','Verifica la asistencia','GRAL','','Todos asistieron, se reunieron y se fueron','2020-05-13','2020-05-11','A',1),(79,70,2,17,'oTRO','Estado actual del copmité','GRAL','pEPE','Este comité está muy bueno si se pude decir esto.','2020-05-11','2020-05-12','A',2),(80,70,2,17,'Nuevo tema','Este es un tema muy importante','GRAL','Luis',' ','2020-05-11',NULL,'A',3),(81,70,2,70,'Adicionado','Celebracion de compleaños','GRAL','','Como es fiesta de cumplaeños se celetró y se cantó','2020-05-11','2020-05-11','A',4),(82,71,2,12,'ACTA ANTERIOR','Lectura del acta anterior y su aprobación','GRAL','Luis Pinto','SE leyo en su totalidad y no quedo nada por leer','2020-05-15','2020-05-15','A',1),(83,71,2,12,'Cotizaciones','Análisis de las cotizaciones','PDNT','Yo soy','Se consiguierpn 33 cotizacines, uf.. que montón.','2020-05-15','2020-05-13','A',2),(84,71,2,12,'Estudio de mercado','Estudio de mercado para la compra','GRAL','Juan','Se estudio el mercado para comprar las cosas','2020-05-15','2020-05-22','A',3),(85,71,2,12,'Ppto','Análisis del presupuesto','GRAL','Don Pedro','Pendiente de consultas','2020-05-15','2020-05-15','A',4),(86,71,2,12,'Nombramiento','Nombrar el supervisor','GRAL','Dn Juan','Se nombre al usuario 1','2020-05-15','2020-05-15','A',5),(87,71,2,71,'tema emergente','Pora probar aplazamuie¿iento','GRAL','','Se deja pendiente','2020-05-13','2020-05-15','A',6),(109,76,2,12,'ACTA ANTERIOR','Lectura del acta anterior y su aprobación','GRAL','','Se leyo y no hubo observaciones pertinentes','2020-05-18','2020-05-18','A',1),(110,76,2,12,'Cotizaciones','Análisis de las cotizaciones','GRAL','','Se presentaron 4 cotizaciones todas aceptables','2020-05-18','2020-05-18','A',2),(111,76,2,12,'Estudio de mercado','Estudio de mercado para la compra','GRAL','Mary','Queda pendiente','2020-05-18','2020-05-18','A',3),(112,76,2,12,'Presupuesto','Analizar ppto de compras','PDNT','mary','No hay recursos para comprar por ahora, esperar hasta la siguiente semana','2020-05-18','2020-05-14','A',4),(113,77,2,12,'ACTA ANTERIOR','Lectura del acta anterior y su aprobación','GRAL','','','2020-05-25',NULL,'A',1),(114,77,2,12,'Cotizaciones','Análisis de las cotizaciones','GRAL','','','2020-05-25',NULL,'A',2),(115,77,2,12,'Estudio de mercado','Estudio de mercado para la compra','GRAL','','','2020-05-25',NULL,'A',3),(116,77,2,12,'Estudio de mercado','Estudio de mercado para la compra','PDNT','Mary','Queda pendiente','2020-05-18','2020-05-18','A',4),(117,78,2,18,'Acta Anterior','Lectura y verificacion del acta anterior','GRAL','Jaime','Se leyó el acta y todos los puntos de ésta están correctos, fue aprobada','2020-05-26','2020-05-21','A',1),(118,78,2,18,'Estado de la empresa','Estado de la empresa ala echa de la reunión','GRAL','','Queda pendiente','2020-05-26','2020-05-21','A',2),(120,78,2,18,'Contratos sin resolver','Analizar los contratos pendientes por ejecutar','GRAL','Doris','Los contratos 45 y 46 se van a ejecutar en su totalidad, ya se consiguieron las cotizaciones de materia prima y el cliente esta esperando los resultados.','2020-05-26','2020-05-21','A',3),(121,78,2,78,'Análisis de presupuesto','Abalizar el presupuesto de la empresa para los contratos pendientes','GRAL','Luis','Se acuerda solicitar un préstamo con banca mia para soportar los costos de personal adicional para desarrollo de los proyectos. Financiera, Juan pelaes,  esta´ra al tanto del monto y del valor a solicitar','2020-05-21','2020-05-21','A',4);
/*!40000 ALTER TABLE `mm_agendatemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_asistentes`
--

DROP TABLE IF EXISTS `mm_asistentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_asistentes` (
  `asistente_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `asistente_comite` varchar(20) DEFAULT NULL COMMENT 'GRUPO',
  `asistente_usuarioId` int(11) DEFAULT NULL COMMENT 'USUARIO_ID',
  `asistente_nombre` varchar(120) DEFAULT NULL COMMENT 'NOMBRE',
  `asistente_empresa` varchar(120) DEFAULT NULL COMMENT 'EMPRESA',
  `asistente_cargo` varchar(45) DEFAULT NULL COMMENT 'CARGO',
  `asistente_celuar` varchar(20) DEFAULT NULL COMMENT 'CELULAR',
  `asistente_email` varchar(120) DEFAULT NULL COMMENT 'E_MAIL',
  `asistente_empresaId` int(11) DEFAULT NULL,
  `asistente_titulo` char(1) DEFAULT NULL,
  PRIMARY KEY (`asistente_id`),
  KEY `fk_asistente_grupo` (`asistente_comite`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='Asistentes a las reun iones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_asistentes`
--

LOCK TABLES `mm_asistentes` WRITE;
/*!40000 ALTER TABLE `mm_asistentes` DISABLE KEYS */;
INSERT INTO `mm_asistentes` VALUES (18,'16',0,'Juan Camilo','Atom sas','Contador','12345','contador@com.co',1,NULL),(19,'14',0,'Clara María','Atom sas','Jefe de compras','34555','alvaro.oycsoft@gmail.com',1,NULL),(21,'15',0,'Jair Roriguez','atom sas','Gerente','4566','alvaro.oycsoft@gmail.com',1,NULL),(25,'14',321,'Alvaro Ortiz C','ATOM INGENIERIA SAS','socio','2200300','alvaro.oycsoft@gmail.com',1,NULL),(27,'17',320,'\nAlberto O','SOCIEDAD DE AMIGOS SAS','ter','3112540011','aoc@com.co',2,'S'),(28,'17',0,'Pedro Navarro','casa','bebe','0088','alvaro.oycsoft@gmail.com',2,'N'),(29,'12',0,'Usuario transcriptor','sas','secre','123','alvaro.oycsoft@gmail.com',2,'T'),(30,'12',0,'Usuario secretario','TOY','Doctor','456','alvaro.oycsoft@gmail.com',2,'S'),(31,'18',0,'Jaime Salas','SAS','Jefe de Compras','123456','jsalas@sas.com',2,'P'),(32,'18',0,'Juana Castaño','SAS','Secretara','9876','jcastano@sas.com',2,'S');
/*!40000 ALTER TABLE `mm_asistentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_cargadocumentos`
--

DROP TABLE IF EXISTS `mm_cargadocumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_cargadocumentos` (
  `carga_id` int(11) NOT NULL AUTO_INCREMENT,
  `carga_empresa` int(11) DEFAULT NULL,
  `carga_comite` int(11) DEFAULT NULL,
  `carga_agendaId` int(11) DEFAULT NULL,
  `carga_titulo` varchar(45) DEFAULT NULL,
  `carga_descripcion` varchar(500) DEFAULT NULL,
  `carga_tipo` varchar(20) DEFAULT NULL,
  `carga_documento` varchar(500) DEFAULT NULL,
  `carga_ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`carga_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_cargadocumentos`
--

LOCK TABLES `mm_cargadocumentos` WRITE;
/*!40000 ALTER TABLE `mm_cargadocumentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mm_cargadocumentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_comites`
--

DROP TABLE IF EXISTS `mm_comites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_comites` (
  `comite_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `comite_empresa` int(11) DEFAULT NULL,
  `comite_nombre` varchar(120) DEFAULT NULL COMMENT 'NOMBRE',
  `comite_descripcion` varchar(512) DEFAULT NULL COMMENT 'DESCRIPCION',
  `comite_activo` char(1) DEFAULT NULL,
  `comite_lider` varchar(100) DEFAULT NULL,
  `comite_email` varchar(100) DEFAULT NULL,
  `comite_consecActa` int(11) DEFAULT NULL,
  PRIMARY KEY (`comite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Lista de comités';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_comites`
--

LOCK TABLES `mm_comites` WRITE;
/*!40000 ALTER TABLE `mm_comites` DISABLE KEYS */;
INSERT INTO `mm_comites` VALUES (12,2,'Compras','Comite de compras','A','Juan David','jd@comercial.com',2),(14,1,'Comercial','Compra y venta de elementos','A','Administrador','admin@com.co',4),(15,1,'Gerencia','Comité semanal de direcciòn','A','Genernte','gerente@com.co',2),(16,1,'Financiero','Seguimiento a operaciones financieras','A','Contador','contador@com.co',2),(17,2,'COPASO','Comité de Salud Ocupacional','A','Recurso Humano','alvaro.oycsoft@gmail.com',7),(18,2,'Asesor','Comité asesor  comercial','A','Gerencia','gerencia@sas.com',1);
/*!40000 ALTER TABLE `mm_comites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_empresa`
--

DROP TABLE IF EXISTS `mm_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_empresa` (
  `empresa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `empresa_nombre` varchar(120) NOT NULL COMMENT 'NOMBRE',
  `empresa_nit` varchar(45) DEFAULT NULL COMMENT 'NIT',
  `empresa_web` varchar(120) DEFAULT NULL COMMENT 'WEB',
  `empresa_direccion` varchar(120) DEFAULT NULL COMMENT 'DIRECCION',
  `empresa_telefonos` varchar(45) DEFAULT NULL COMMENT 'TELEFONOS',
  `empresa_ciudad` varchar(45) DEFAULT NULL COMMENT 'CIUDAD',
  `empresa_logo` varchar(45) DEFAULT NULL COMMENT 'LOGO',
  `empresa_autentica` char(1) DEFAULT NULL,
  `empresa_lenguaje` char(3) DEFAULT NULL,
  `empresa_versionPrd` varchar(100) DEFAULT NULL,
  `empresa_versionBd` varchar(100) DEFAULT NULL,
  `empresa_clave` varchar(50) DEFAULT NULL,
  `empresa_email` varchar(50) DEFAULT NULL,
  `empresa_registrsoXpagina` int(11) DEFAULT NULL,
  `empresa_diasTrabaja` varchar(45) DEFAULT NULL,
  `empresa_horarioInicio` varchar(45) DEFAULT NULL,
  `empresa_horarioTermina` varchar(45) DEFAULT NULL,
  `empresa_intervaloCalendario` char(1) DEFAULT NULL,
  `empresa_FormatoActa` varchar(45) DEFAULT NULL,
  `empresa_cresidencial` char(1) DEFAULT NULL,
  `empresa_ctrl` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Define la empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_empresa`
--

LOCK TABLES `mm_empresa` WRITE;
/*!40000 ALTER TABLE `mm_empresa` DISABLE KEYS */;
INSERT INTO `mm_empresa` VALUES (1,'ATOM INGENIERIA SAS','12345678','http://www.atomingenieria.com.co/','Av. 53 Nr. 54 - 55','3174142133','Bogotá  D.C.','logoEmpresa.png','M','ESP','V1.2 -Mar  08-2018','V1.2 - Mar 08-2018','A00-MZ18','alvarobucaros@hotmail.com',15,'L-M-M-J-V','7:00','18:00','M','Estandard','S',NULL),(2,'SOCIEDAD DE AMIGOS SAS','9800767643','http://www.sociamigosas.com/','Cra 9 · 104-44','3109984545','Bogota ','logoOyC.png','M','ESP',NULL,NULL,'AU3-ENE','alvarobucaros@hotmail.com',12,'L-M-M-J-V','7:30','18:000','M','Estandard','S',NULL);
/*!40000 ALTER TABLE `mm_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_grupos`
--

DROP TABLE IF EXISTS `mm_grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_grupos` (
  `grupo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `grupo_empresa` int(11) DEFAULT NULL,
  `grupo_nombre` varchar(45) DEFAULT NULL COMMENT 'NOMBRE',
  `grupo_detalle` varchar(120) DEFAULT NULL COMMENT 'DETALLE',
  `grupo_comite` int(11) DEFAULT NULL,
  `grupo_activo` char(1) DEFAULT NULL,
  PRIMARY KEY (`grupo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Grupos de asistentes a comites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_grupos`
--

LOCK TABLES `mm_grupos` WRITE;
/*!40000 ALTER TABLE `mm_grupos` DISABLE KEYS */;
INSERT INTO `mm_grupos` VALUES (5,1,'PARITARIO','Salud ocupacional',1,'A'),(6,1,'DEPORTIVO','Comité Deportivo',2,'A'),(9,1,'GERENCIAL','Comite semanal de gerencia',2,'A'),(14,1,'CULTURAL','Comité para actividades de la empresa',11,'A'),(18,1,'COMPRAS','Compras y contrataciones',4,'A');
/*!40000 ALTER TABLE `mm_grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_invitados_comite`
--

DROP TABLE IF EXISTS `mm_invitados_comite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_invitados_comite` (
  `invitado_id` int(11) NOT NULL AUTO_INCREMENT,
  `invitado_agendaId` int(11) DEFAULT NULL,
  `invitado_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`invitado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Personas asistentes al comite';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_invitados_comite`
--

LOCK TABLES `mm_invitados_comite` WRITE;
/*!40000 ALTER TABLE `mm_invitados_comite` DISABLE KEYS */;
/*!40000 ALTER TABLE `mm_invitados_comite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_menu`
--

DROP TABLE IF EXISTS `mm_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_codigo` int(11) DEFAULT NULL,
  `menu_op` varchar(10) DEFAULT NULL,
  `menu_descripcion` varchar(45) DEFAULT NULL,
  `menu_class` varchar(45) DEFAULT NULL,
  `menu_nodo` int(11) DEFAULT NULL,
  `menu_nodoPadre` int(11) DEFAULT NULL,
  `menu_modulo` varchar(45) DEFAULT NULL,
  `menu_orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_menu`
--

LOCK TABLES `mm_menu` WRITE;
/*!40000 ALTER TABLE `mm_menu` DISABLE KEYS */;
INSERT INTO `mm_menu` VALUES (1,2,'comit','Comités','fa-users',1,1,'frmComites',1),(2,4,'salon','Salones','fa-building',2,2,'frmSalones',1),(3,10,'agAsi','Asistentes Rscurrentes','fa-user-plus',3,3,'#',1),(4,12,'agTma','Temas Recurrentes','fa-book',3,3,'frmPendiente',2),(6,6,NULL,'Agenda','fa-commenting',4,4,'#',1),(10,8,'agReu','Agenda Reunión','fa-map-o',4,4,'frmPendiente',5),(11,14,NULL,'Desarrollo de la Reunión','fa-laptop',5,5,'#',1),(12,16,'agSgmnto','Agenda a seguir','fa-circle-o',5,5,'frmPendiente',2),(13,18,'agActas','Acta de reunión','fa-pencil',5,5,'frmPendiente',3),(14,20,'loadActa','Carga documentos','fa-upload',5,5,'frmPendiente',4),(15,22,NULL,'Consultas','fa-edit',6,6,'#',1),(16,24,'consAc','Actas de reunión','fa-folder-o',6,6,'frmPendiente',2),(17,26,'constm','Consulta temática','fa-book',6,6,'frmPendiente',3),(18,28,'segAc','Seguimiento acta','fa-folder-open',6,6,'frmPendiente',4),(19,30,NULL,'Administración','fa-institution',7,7,'#',1),(20,32,'empr','La empresa','fa-crosshairs',7,7,'frmEmpresas',2),(21,34,'perfi','Perfiles','fa-gears',7,7,'frmPerfiles',3),(22,36,'users','Usuarios','fa-user',7,7,'frmUsuarios',4),(23,38,NULL,'Ayudas','fa-coffee',7,7,'frmPendiente',5),(24,40,'docum','Documentación','fa-circle-o text-red',8,8,'frmPendiente',1),(25,42,'versi','Versión','fa-circle-o text-yellow',9,9,'frmVersion',1),(26,44,'contc','Contáctenos','fa-circle-o text-aqua',10,10,'frmComite',1);
/*!40000 ALTER TABLE `mm_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_parametros`
--

DROP TABLE IF EXISTS `mm_parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_parametros` (
  `param_Id` varchar(45) NOT NULL,
  `param_empresaid` int(11) NOT NULL,
  `param_registrsoXpagina` int(11) DEFAULT NULL,
  `param_diasTrabaja` varchar(45) DEFAULT NULL,
  `param_horarioInicio` varchar(45) DEFAULT NULL,
  `param_horarioTermina` varchar(45) DEFAULT NULL,
  `param_intervaloCalendario` char(1) DEFAULT NULL,
  PRIMARY KEY (`param_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_parametros`
--

LOCK TABLES `mm_parametros` WRITE;
/*!40000 ALTER TABLE `mm_parametros` DISABLE KEYS */;
INSERT INTO `mm_parametros` VALUES ('1',1,20,'Lu-Ma-Mi-Ju-Vi','08:00 am','06:00 pm','U');
/*!40000 ALTER TABLE `mm_parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_perfiles`
--

DROP TABLE IF EXISTS `mm_perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_perfiles` (
  `perfil_id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil_empresa` int(11) DEFAULT NULL,
  `perfil_numero` int(11) DEFAULT NULL,
  `perfil_codigo` varchar(10) NOT NULL,
  `perfil_nombre` varchar(45) NOT NULL,
  `perfil_activo` char(1) DEFAULT NULL,
  PRIMARY KEY (`perfil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_perfiles`
--

LOCK TABLES `mm_perfiles` WRITE;
/*!40000 ALTER TABLE `mm_perfiles` DISABLE KEYS */;
INSERT INTO `mm_perfiles` VALUES (1,1,1,'A','Administrador','A'),(2,1,2,'C','Consultores','A'),(3,2,1,'A','Administrador','A'),(4,1,3,'S','Secretarial','A');
/*!40000 ALTER TABLE `mm_perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_popup`
--

DROP TABLE IF EXISTS `mm_popup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_popup` (
  `popup_id` int(11) NOT NULL AUTO_INCREMENT,
  `popup_codigo` varchar(10) DEFAULT NULL,
  `popup_titulo` varchar(45) DEFAULT NULL,
  `popup_comentario` text,
  PRIMARY KEY (`popup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_popup`
--

LOCK TABLES `mm_popup` WRITE;
/*!40000 ALTER TABLE `mm_popup` DISABLE KEYS */;
INSERT INTO `mm_popup` VALUES (1,'comit','COMITE, JUNTA O PROYECTO','Permite definir los diferentes comités o juntas o proyectos, que tiene la empresa. Es toda conjunto de personas que se reunene para toma de deciisiones y que por el efecto producen un acta la cual amerita un seguimiento y/o control'),(2,'salon','SALA DE REUNIONES','El salon es el sitio donde se realiza la reunión, por control se debe definir la cantidad de sillas con que cuenta, que ayudas tiene, como audivisuales, cafeterìa, etc ');
/*!40000 ALTER TABLE `mm_popup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_reservasalon`
--

DROP TABLE IF EXISTS `mm_reservasalon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_reservasalon` (
  `reservaSal_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservaSal_idEmpresa` int(11) DEFAULT NULL,
  `reservaSal_idSalon` int(11) DEFAULT NULL,
  `reservaSal_idComite` int(11) DEFAULT NULL,
  `reservaSal_FechaDesde` datetime DEFAULT NULL,
  `reservaSal_FechaHasta` datetime DEFAULT NULL,
  `reservaSal_reservadoPor` varchar(60) DEFAULT NULL,
  `reservaSal_FechaReserva` datetime DEFAULT NULL,
  `reservaSal_Confirmado` char(1) DEFAULT NULL,
  `reservaSal_Observaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`reservaSal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_reservasalon`
--

LOCK TABLES `mm_reservasalon` WRITE;
/*!40000 ALTER TABLE `mm_reservasalon` DISABLE KEYS */;
INSERT INTO `mm_reservasalon` VALUES (12,1,2,1,'2016-11-08 00:00:00','2016-11-08 00:00:00','aoc','2016-10-08 00:00:00','S','No hay'),(14,1,8,2,'2016-11-12 00:00:00','2016-11-12 00:00:00','eva','2016-10-08 00:00:00','N','No hay'),(24,1,5,3,'2016-11-09 00:00:00','2016-11-09 00:00:00','Hector','2016-10-09 15:26:47','N','No hay'),(25,1,4,3,'2016-11-09 16:00:00','2016-11-09 00:00:00','derly','2016-10-09 15:30:30','N','No hay'),(30,1,5,1,'2016-11-09 16:00:00','2016-11-09 16:00:00','Maria','2016-10-09 15:47:57','N','No hay'),(33,1,2,2,'2016-11-09 09:30:00','2016-11-09 12:30:00','hilda','2016-10-09 15:55:07','S','No hay obervacion'),(34,1,4,4,'2016-11-11 02:30:00','2016-11-11 04:00:00','alvaro','2016-10-11 17:40:41','S','No hay'),(35,1,4,4,'2016-11-11 02:30:00','2016-11-11 04:00:00','alberto','2016-10-11 17:40:41','S','No hay'),(36,0,3,2,'2017-10-30 00:00:00','2017-10-30 00:00:00','Juanca','2017-10-30 00:00:00','s','No hay'),(37,1,3,11,'2017-01-01 00:00:00','2017-01-01 00:00:00','ser','2017-01-01 00:00:00','p','ok'),(38,1,5,4,'2017-11-03 00:00:00','2017-11-02 00:00:00','Alvaro','2017-11-30 00:00:00','S','No hay');
/*!40000 ALTER TABLE `mm_reservasalon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_salones`
--

DROP TABLE IF EXISTS `mm_salones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_salones` (
  `salon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID			',
  `salon_empresa` int(11) DEFAULT NULL,
  `salon_nombre` varchar(50) DEFAULT NULL COMMENT 'NOMBRE',
  `salon_ubicacion` varchar(45) DEFAULT NULL COMMENT 'UBICACION ',
  `salon_capacidad` int(11) DEFAULT NULL COMMENT 'CAPACIDAD',
  `salon_apoyovisual` varchar(120) DEFAULT NULL COMMENT 'APOYOS',
  `salon_responsable` varchar(45) DEFAULT NULL COMMENT 'RESPONSABLE',
  `salon_activo` char(1) DEFAULT NULL COMMENT 'ACTIVO',
  `salon_observaciones` varchar(512) DEFAULT NULL COMMENT 'OBSERVACIONES',
  PRIMARY KEY (`salon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Lista de salones habiles para reuniones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_salones`
--

LOCK TABLES `mm_salones` WRITE;
/*!40000 ALTER TABLE `mm_salones` DISABLE KEYS */;
INSERT INTO `mm_salones` VALUES (9,2,'sala de sistemas','piso quinto',12,'No','Administrativa','A','no hay'),(13,1,'Gerencia','Oficina Gerencia',12,'si','Secretaria','A','No hay'),(14,1,'Ventas','Primer piso',25,'si','Secretaria','A','No hay'),(15,2,'Auditorio','Primer piso',25,'Audivisuales y WiFi','Secretaria','A',''),(16,2,'Juntas Ventas','Oficina 202',30,'WiFi, Audivisuales','Secretaria de ventas','A','');
/*!40000 ALTER TABLE `mm_salones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_temasgrales`
--

DROP TABLE IF EXISTS `mm_temasgrales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_temasgrales` (
  `temasGrales_id` int(11) NOT NULL AUTO_INCREMENT,
  `temasGrales_empresa` int(11) DEFAULT NULL,
  `temasGrales_comiteId` int(11) DEFAULT NULL,
  `temasGrales_titulo` varchar(60) DEFAULT NULL,
  `temasGrales_detalle` varchar(1000) DEFAULT NULL,
  `temasGrales_estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`temasGrales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_temasgrales`
--

LOCK TABLES `mm_temasgrales` WRITE;
/*!40000 ALTER TABLE `mm_temasgrales` DISABLE KEYS */;
INSERT INTO `mm_temasgrales` VALUES (6,1,14,'Acta anterior','Lectura y aprobación del acta anterior','A'),(7,1,16,'Acta anterior','Lectura y aprobación del acta anterior','A'),(8,1,15,'Acta anterior','Lectura y aprobación del acta anterior','A'),(9,1,14,'Ventas','Estado de ventas del periodo','A'),(10,1,14,'Cartera','Estado actual de cartera','A'),(11,2,12,'ACTA ANTERIOR','Lectura del acta anterior y su aprobación','A'),(12,2,17,'VERIFICA ASISTENCIA','Verifica la asistencia','A'),(13,2,12,'Cotizaciones','Análisis de las cotizaciones','A'),(14,2,12,'Estudio de mercado','Estudio de mercado para la compra','A'),(15,2,18,'Acta Anterior','Lectura y verificacion del acta anterior','A'),(16,2,18,'Estado de la empresa','Estado de la empresa ala echa de la reunión','A');
/*!40000 ALTER TABLE `mm_temasgrales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_temp01`
--

DROP TABLE IF EXISTS `mm_temp01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_temp01` (
  `hora` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `detalle` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`hora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_temp01`
--

LOCK TABLES `mm_temp01` WRITE;
/*!40000 ALTER TABLE `mm_temp01` DISABLE KEYS */;
INSERT INTO `mm_temp01` VALUES ('07:30','7:30 am'),('08:00','8:00 am'),('08:30','8:30 am'),('09:00','9:00 am'),('09:30','9:30 am'),('10:00','10:00 am'),('10:30','10:30 am'),('11:00','11:00 am'),('11:30','11:30 am'),('12:00','12:00 pm'),('12:30','12:30 pm'),('13:00','1:00 pm'),('13:30','1:30 pm'),('14:00','2:00 pm'),('14:30','2:30 pm'),('15:00','3:00 pm'),('15:30','3:30 pm'),('16:00','4:00 pm'),('16:30','4:30 pm'),('17:00','5:00 pm'),('17:30','5:30 pm'),('18:00','6:00 pm');
/*!40000 ALTER TABLE `mm_temp01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_tipoacta`
--

DROP TABLE IF EXISTS `mm_tipoacta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_tipoacta` (
  `tipoActa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tipoActa_empresa` int(11) DEFAULT NULL,
  `tipoActa_nombre` varchar(45) DEFAULT NULL COMMENT 'NOMBRE',
  `tipoActa_formato` varchar(100) DEFAULT NULL COMMENT 'FORMATO',
  PRIMARY KEY (`tipoActa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relacion de tipos de acta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_tipoacta`
--

LOCK TABLES `mm_tipoacta` WRITE;
/*!40000 ALTER TABLE `mm_tipoacta` DISABLE KEYS */;
/*!40000 ALTER TABLE `mm_tipoacta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_usuario_comites`
--

DROP TABLE IF EXISTS `mm_usuario_comites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_usuario_comites` (
  `uc_id` int(11) NOT NULL AUTO_INCREMENT,
  `uc_empresa` int(11) DEFAULT NULL,
  `uc_comiteId` int(11) DEFAULT NULL,
  `uc_usuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`uc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_usuario_comites`
--

LOCK TABLES `mm_usuario_comites` WRITE;
/*!40000 ALTER TABLE `mm_usuario_comites` DISABLE KEYS */;
INSERT INTO `mm_usuario_comites` VALUES (1,2,12,317),(15,2,18,320),(16,2,12,320);
/*!40000 ALTER TABLE `mm_usuario_comites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_usuariomenu`
--

DROP TABLE IF EXISTS `mm_usuariomenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_usuariomenu` (
  `usuarioMenu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioMenu_menu` int(11) DEFAULT NULL,
  `usuarioMenu_empresa` int(11) DEFAULT NULL,
  `usuarioMenu_perfil` int(11) DEFAULT NULL,
  PRIMARY KEY (`usuarioMenu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_usuariomenu`
--

LOCK TABLES `mm_usuariomenu` WRITE;
/*!40000 ALTER TABLE `mm_usuariomenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `mm_usuariomenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_usuarios`
--

DROP TABLE IF EXISTS `mm_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `usuario_nombre` varchar(100) NOT NULL COMMENT 'NOMBRE',
  `usuario_empresa` int(11) DEFAULT NULL,
  `usuario_email` varchar(80) NOT NULL COMMENT 'LOGIN',
  `usuario_password` varchar(45) NOT NULL COMMENT 'PASSWORD',
  `usuario_tipo_acceso` char(1) NOT NULL COMMENT 'ACCESO',
  `usuario_fechaCreado` date DEFAULT NULL,
  `usuario_fechaActualizado` date DEFAULT NULL,
  `usuario_estado` char(1) DEFAULT NULL,
  `usuario_perfil` varchar(10) DEFAULT NULL,
  `usuario_avatar` varchar(45) DEFAULT NULL,
  `usuario_user` varchar(20) DEFAULT NULL,
  `usuario_celular` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8 COMMENT='Usuarios del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_usuarios`
--

LOCK TABLES `mm_usuarios` WRITE;
/*!40000 ALTER TABLE `mm_usuarios` DISABLE KEYS */;
INSERT INTO `mm_usuarios` VALUES (317,'Administrador',1,'admin@com.co','0192023a7bbd73250516f069df18b500','A','2016-01-01','2017-12-31','A','A','yo.jpg','admin','3174142133'),(318,'Usuario consultas',1,'aoc@mio.co','202cb962ac59075b964b07152d234b70','C','2016-01-01','2017-01-01','A','C','admin.png','consulta','123'),(320,'Alberto O',2,'aoc@com.co','202cb962ac59075b964b07152d234b70','A','2016-01-01','2017-12-31','A','A','avatar1.png','alvaro','3112540011'),(321,'Alvaro Ortiz C',1,'alvaro@com.co','bc022864f419e5f201abb67179ee4acf','C','2016-10-12','2016-12-31','A','A','avatar2.png','piti','2200300');
/*!40000 ALTER TABLE `mm_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mn_privilegios`
--

DROP TABLE IF EXISTS `mn_privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mn_privilegios` (
  `privilegio_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilegio_perfil` int(11) DEFAULT NULL,
  `privilegio_menu` int(11) DEFAULT NULL,
  PRIMARY KEY (`privilegio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mn_privilegios`
--

LOCK TABLES `mn_privilegios` WRITE;
/*!40000 ALTER TABLE `mn_privilegios` DISABLE KEYS */;
INSERT INTO `mn_privilegios` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(33,2,1),(34,2,2),(35,2,24),(36,2,25);
/*!40000 ALTER TABLE `mn_privilegios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-19 18:36:39
