-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projeto_sistema
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `mensagem_usuario` text NOT NULL,
  `resposta_bot` text DEFAULT NULL,
  `data_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `mensagem_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagem`
--

LOCK TABLES `mensagem` WRITE;
/*!40000 ALTER TABLE `mensagem` DISABLE KEYS */;
INSERT INTO `mensagem` VALUES (1,3,'Olá professor, estou testando meu sistema.',NULL,'2026-06-17 23:23:05'),(2,3,'oiiiiiiiiiiiiiiiiiiii',NULL,'2026-06-17 23:26:50'),(3,8,'Quero fazer um pedido de pizza','Claro! Entendido! Você quer pedir uma pizza.\n\nComo uma inteligência artificial, eu não consigo **fazer o pedido diretamente** para uma pizzaria real, processar pagamentos ou fazer entregas.\n\n**MAS posso te ajudar de outras formas:**\n\n1.  **Podemos simular o pedido aqui:** Você me diz o que quer e eu te \"pergunto\" os detalhes, como se você estivesse conversando com uma atendente.\n2.  **Posso te ajudar a decidir:** Se você não sabe o que pedir, posso sugerir sabores, tamanhos, etc.\n3.  **Posso te indicar onde pedir de verdade:** Se você me disser sua localização, posso sugerir aplicativos ou sites populares de delivery de pizza na sua região (como iFood, Uber Eats, Rappi ou os sites das próprias pizzarias).\n\nO que você prefere? Se quiser que a gente simule, me diga:\n\n*   **Qual o sabor da pizza que você gostaria?**\n*   **Qual o tamanho (broto, média, grande, gigante)?**\n*   **Quer borda recheada? Com qual recheio?**\n*   **Alguma bebida ou acompanhamento?**\n\nVamos lá, me conte o que você está com vontade! ?','2026-06-23 23:57:39'),(4,9,'salve pai','Salve! Tudo bem por aí? Em que posso ajudar? ?','2026-06-23 23:58:48'),(5,8,'ola','Olá! Como vai?\n\nHello! How are you doing? ?','2026-06-24 00:06:59'),(6,9,'ola','Olá! Como posso ajudar?','2026-06-24 00:07:09'),(7,9,'ola','Olá! Como posso ajudar?','2026-06-24 00:07:10'),(8,9,'ola','Olá! Como posso ajudar?','2026-06-24 00:07:41'),(9,8,'ola','Olá! Bem-vindo(a) ao BeautyAI! ?\n\nEu sou a sua assistente virtual e estou aqui para ajudar com qualquer dúvida sobre nossos serviços, horários, agendamentos ou outras informações do salão.\n\nComo posso ajudar você hoje?','2026-06-24 00:09:29'),(10,9,'Gostaria de agendar um horário','Olá! Bem-vindo(a) ao DUVISUAL! Que ótimo que você quer agendar um horário conosco. Fico feliz em te ajudar com isso!\n\nPara que eu possa te auxiliar da melhor forma possível, por favor, me diga:\n\n1.  **Qual serviço você gostaria de agendar?** (Por exemplo: corte, coloração, manicure, pedicure, hidratação, etc.)\n2.  **Qual dia e faixa de horário seriam ideais para você?**\n\nCom essas informações, consigo verificar a disponibilidade e te guiar para confirmar seu agendamento. Estou à disposição!','2026-06-24 00:20:31'),(11,10,'quero agendar cabelo corte navalhado qual é o preco','Olá! Seja bem-vindo(a) ao OS DUVISUAL! ?\n\nQue ótimo que você deseja agendar um corte navalhado! É uma excelente escolha.\n\nPara te informar o preço aproximado e verificar a disponibilidade em nossa agenda, preciso de algumas informações. Nossos valores podem ter pequenas variações dependendo de detalhes específicos do serviço ou do profissional.\n\n**Para o corte navalhado, qual dia e horário você teria em mente? Assim, já verifico a agenda e te informo o valor aproximado para você. ?**','2026-06-24 00:54:54'),(12,10,'ola','Olá! Seja muito bem-vindo(a) ao OS DUVISUAL.\n\nEu sou a sua assistente virtual e estou aqui para ajudar com o que precisar sobre o nosso salão.\n\nComo posso te ajudar hoje? Posso informar sobre nossos serviços, preços aproximados, horários de atendimento, agendamentos ou o funcionamento geral do salão. Fique à vontade para perguntar! ?','2026-06-24 00:57:41'),(13,10,'quero ir terca feira e fazer um corte navalhado','Olá! Que ótimo que você quer nos visitar na terça-feira para um corte navalhado aqui no OS DUVISUAL!\n\nO corte navalhado é um dos nossos serviços mais pedidos e fica incrível!\n\nPara te ajudar com o agendamento na terça-feira, qual seria o horário de sua preferência? Assim, posso verificar a disponibilidade para você. E claro, posso te informar sobre o preço aproximado do corte navalhado também, se desejar.\n\nEstou aqui para ajudar!','2026-06-24 00:58:01'),(14,10,'as 12:00 qual seria o valor','Olá! Bem-vinda(o) ao OS DUVISUAL!\n\nPara que eu possa te informar o valor, por favor, me diga qual serviço você gostaria de fazer às 12:00. Assim consigo te dar a informação correta! ?','2026-06-24 00:58:20'),(15,10,'coorte navalhado','Olá! Bem-vindo(a) ao OS DUVISUAL!\n\nPercebo que você está interessado(a) no **corte navalhado**. É um dos nossos serviços e podemos, com certeza, ajudar você a alcançar o visual que deseja!\n\nO corte navalhado é uma técnica excelente para dar leveza, movimento e textura aos cabelos.\n\nPara o **corte navalhado**, o preço aproximado no nosso salão varia entre R$ 80,00 e R$ 120,00, e já inclui lavagem e finalização. O tempo de duração médio para este serviço é de 45 a 60 minutos.\n\nGostaria de agendar um horário ou tem mais alguma dúvida sobre este ou outros serviços? Estou à disposição para ajudar!','2026-06-24 00:58:38');
/*!40000 ALTER TABLE `mensagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Carlos','carlos@email.com','$2b$10$o5gd0RPB6kPuQ6UABQBmw.aPDAvPEnsxvgFiyMugbcB6KL5cQ1VNC'),(2,'Daniel','daniel@email.com','$2b$10$/iB1h1ds646qqZuGTYGrSurV22XJMk3M0DYj4d3evd.yRe.XnveKi'),(3,'joao','jopaoo@email.com','$2b$10$zq4ekvVGyh9TsLCPb13LD.F/QJfggL4C620VEetrTuNDYgQvRscmi'),(4,'','','$2b$10$KQiGHZ4ZjEUF9MiBBW4HoO2XLas2jM06x96jGFuvJAkbc.Db0HMX6'),(5,'aaaaa','aaaaaaa@aaaaaaaa','$2b$10$lyOarfyuaZANwqHMSn4f0uWKbXLJ4Pa2MmPk7YclXJg4KCe3LLeVC'),(6,'bia','bia@gmail.com','$2b$10$5XoQjcbdTKj7wqjC573Qg.vg.6RYerZ9CqZ5Un4ttBjWTC.8XToAK'),(7,'maira','maira@gmail.com','$2b$10$mAc6ddsQzohwJfJ8.vuFz.Xc34fBO/yUvnt3Ec6K96w.OqJFWKlQe'),(8,'Gustavo Moraes','gustavo.teste@gmail.com','$2b$10$NtchGM9esY6JPIrLOGoY4OtoeZYqSK9XyFm8Uo87Uavc.yVizh9jS'),(9,'testeee','teste@teste','$2b$10$EBCP5V6hWewZLYtLmplxme9qaUblXzKwyoY6kmbtYBKxaet5L20iu'),(10,'admin','admin@gmail.com','$2b$10$7zx9tbPyQ1NnvzITPZFuKuKNuEkuxPR3iXYnoCdsxW24C7nWWWf3e');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-23 22:27:03
