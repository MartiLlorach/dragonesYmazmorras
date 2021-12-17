-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-12-2021 a las 14:45:11
-- Versión del servidor: 8.0.27-0ubuntu0.20.04.1
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dragonesymazmorras`
--
CREATE DATABASE IF NOT EXISTS `dragonesymazmorras` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dragonesymazmorras`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armadurasyescudos`
--

CREATE TABLE `armadurasyescudos` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clase_de_armadura` int DEFAULT NULL,
  `clase_de_armadura_bonus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `clase_de_armadura_bonus_max` int DEFAULT NULL,
  `peso` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `armadurasyescudos`
--

INSERT INTO `armadurasyescudos` VALUES(9, 'Armadura de cuero', 'Armadura ligera', 11, 'destreza', NULL, 10);
INSERT INTO `armadurasyescudos` VALUES(10, 'Armadura acolchada', 'Armadura ligera', 11, 'destreza', NULL, 8);
INSERT INTO `armadurasyescudos` VALUES(11, 'Armadura de pieles', 'Armadura media', 12, 'destreza', 2, 12);
INSERT INTO `armadurasyescudos` VALUES(12, 'Camisote de mallas', 'Armadura media', 13, 'destreza', 2, 20);
INSERT INTO `armadurasyescudos` VALUES(13, 'Coraza', 'Armadura media', 14, 'destreza', 2, 20);
INSERT INTO `armadurasyescudos` VALUES(14, 'Cota de anillas', 'Armadura pesada', 14, NULL, NULL, 40);
INSERT INTO `armadurasyescudos` VALUES(15, 'Cota de mallas', 'Armadura pesada', 16, NULL, NULL, 55);
INSERT INTO `armadurasyescudos` VALUES(16, 'Escudo', 'Escudo', NULL, '2', NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

CREATE TABLE `armas` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `daño` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `daño_tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `peso` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `armas`
--

INSERT INTO `armas` VALUES(1, 'Maza', '1d6', 'contundente', 4);
INSERT INTO `armas` VALUES(2, 'Gran hacha', '1d12', 'cortante', 7);
INSERT INTO `armas` VALUES(3, 'Bastón', '1d6', 'contundente', 4);
INSERT INTO `armas` VALUES(4, 'Estoque', '1d8', 'perforante', 2);
INSERT INTO `armas` VALUES(5, 'Espada corta', '1d6', 'cortande', 2);
INSERT INTO `armas` VALUES(6, 'Arco largo', '1d8', 'perforante', 2);
INSERT INTO `armas` VALUES(7, 'Alabarda', '1d10', 'cortante', 6);
INSERT INTO `armas` VALUES(8, 'daga', '1d4', 'perforante', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dado_de_golpe` varchar(50) NOT NULL,
  `idiomas_elegir` int NOT NULL,
  `riqueza_inicial` int DEFAULT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` VALUES(4, 'Bárbaro', '1d12', 0, NULL, 'La Furia es lo que define al Bárbaro. Una ira desenfrenada, insaciable e irreflexiva. No se trata de una simple emoción, pues esta ira es similar a la ferocidad del depredador acorralado, el asalto implacable de la tormenta o la agitada confusión del mar.');
INSERT INTO `clases` VALUES(5, 'Bardo', '1d8', 0, NULL, 'Un Bardo, ya sea este un erudito, un escaldo o un bribón, es capaz de tejer magia a través de sus palabras y su música, inspirando a sus aliados, desmoralizando a sus enemigos, manipulando mentes, creando ilusiones e incluso sanando heridas.');
INSERT INTO `clases` VALUES(6, 'Paladín', '1d10', 0, NULL, 'Independientemente de su origen o misión, los paladines están unidos por su juramento, que les lleva a enfrentarse a las fuerzas del mal.\r\n\r\nYa lo hayan pronunciado ante el altar de un dios y con un sacerdote como testigo, en un claro sagrado frente a espíritus de la naturaleza y seres feéricos o en un momento de desesperación y pena con los difuntos como únicos testigos, el juramento de un paladín es un vínculo muy poderoso. Es la fuente del poder que transforma a un combatiente devoto en un campeón bendito.');
INSERT INTO `clases` VALUES(7, 'Mago', '1d6', 0, NULL, 'Más allá del velo de lo mundano se ocultan los secretos del poder absoluto. Las obras de seres más allá de los mortales, las leyendas de reinos donde los dioses y espíritus flotan, el conocer de creaciones tanto maravillosas como terribles--tales misterios llaman a aquellos con la ambición y el intelecto para elevarse por encima de la gente común, y capturar cierto poderio.');
INSERT INTO `clases` VALUES(8, 'Pícaro', '1d8', 0, NULL, 'Los pícaros confían sus habilidades, el sigilo y las vulne-rabilidades  de  sus  oponentes  para  lograr  sacar  ventaja  en  cualquier situación. Tienen un don para encontrar la solución a  prácticamente  cualquier  problema,  demostrando  un  inge-nio y versatilidad, que es la piedra angular de cualquier buen grupo de aventureros.');
INSERT INTO `clases` VALUES(10, 'Hechicero', '1d6', 0, NULL, 'Vastagos de linajes mágicos, elegidos de las deidades, engendros de monstruos, peones de la suerte y el destino, o simplemente casualidades de la magia salvaje; los hechiceros miran en sus adentros para sacar el poderío arcano que pocos mortales pueden si acaso imaginar.');
INSERT INTO `clases` VALUES(11, 'Clérigo', '1d8', 0, NULL, 'La magia divina, como su nombre sugiere, es el poder de los dioses, que fluye de ellos hacia el mundo. Los clérigos son el conducto de dicho poder, que se manifiesta como efectos milagrosos. Los dioses no conceden este poder a cualquiera que lo busca, sino únicamente a aquellos escogidos para cumplir un propósito superior.');
INSERT INTO `clases` VALUES(12, 'Explorador', '1d10', 0, NULL, 'Guerreros de las tierras salvajes, los exploradores se especializan en cazar a los monstruos que acechan en los límites de la civilización (saqueadores humanoides, bestias enfurecidas y monstruosidades, terribles gigantes, y dragones mortales). Aprenden a rastrear a sus presas como un depredador, moviéndose furtivamente a través de los bosques y escondiéndose entre la maleza y las ruinas. ');
INSERT INTO `clases` VALUES(13, 'Guerrero', '1d10', 0, NULL, 'Los guerreros aprenden los principios de todos los estilos de combate. Cualquier guerrero puede usar un hacha, esgrimir una espada ropera, portar una espada larga o espadón, usar un arco, o incluso atrapar enemigos con una red con un poco de habilidad. Del mismo modo, un guerrero es un experto con los escudos y con cualquier tipo de armadura.');
INSERT INTO `clases` VALUES(14, 'Monje', '1d8', 0, NULL, 'Los monjes realizan un estudio detallado de una energía mágica a la que la mayoría de sus tradiciones monásticas llaman ki. Esta energía es un elemento de la magia que cubre al multiverso, más específicamente, el elemento que fluye a través de todas las criaturas vivas. Los monjes utilizan esta energía dentro de sí mismos para crear efectos mágicos, exceder las capacidades físicas de sus cuerpos y realizar ataques especiales que entorpecen el flujo de ki en el cuerpo de sus adversarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasclase`
--

CREATE TABLE `competenciasclase` (
  `id_clase` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciaselegirclase`
--

CREATE TABLE `competenciaselegirclase` (
  `id` int NOT NULL,
  `id_clase` int NOT NULL,
  `numero` int NOT NULL,
  `opciones` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciaselegirraza`
--

CREATE TABLE `competenciaselegirraza` (
  `id` int NOT NULL,
  `id_raza` int NOT NULL,
  `numero` int NOT NULL,
  `opciones` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciaselegirtrasfondo`
--

CREATE TABLE `competenciaselegirtrasfondo` (
  `id` int NOT NULL,
  `id_trasfondo` int NOT NULL,
  `numero` int NOT NULL,
  `opciones` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasopciones`
--

CREATE TABLE `competenciasopciones` (
  `id` int NOT NULL,
  `id_competencia` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciaspersonaje`
--

CREATE TABLE `competenciaspersonaje` (
  `id_personaje` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasraza`
--

CREATE TABLE `competenciasraza` (
  `id_raza` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciastrasfondo`
--

CREATE TABLE `competenciastrasfondo` (
  `id_trasfondo` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjuros`
--

CREATE TABLE `conjuros` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nivel` int NOT NULL,
  `descripcion` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `conjuros`
--

INSERT INTO `conjuros` VALUES(1, 'Llama sagrada', 0, 'Un resplandor parecido a una llama desciende sobre una criatura que puedas ver y esté dentro del alance. \r\nEl objetivo debe superar una tirada de salvación de Destreza o sufrir 1d8 puntos de daño radiante. \r\nEl objetivo no gana ningún beneficio por cobertura para esta tirada de salvación. \r\nEl daño de este conjuro se incrementa en 1d8 cuando alcanzas el nivel 5 (2d8), el nivel 11 (3d8) y el nivel 17 (4d8).');
INSERT INTO `conjuros` VALUES(2, 'Bendecir', 1, 'Bendices hasta a tres criaturas de tu elección dentro del alcance del conjuro. \r\nSiempre que el objetivo realice una tirada de ataque o una tirada de salvación antes de que finalice el conjuro, el objetivo puede tirar un d4 y añadir el resultado obtenido a la tirada de ataque o tirada de salvación.');
INSERT INTO `conjuros` VALUES(3, 'Amigos', 0, 'Durante la duración de este conjuro, posees ventaja en todas las pruebas de Carisma dirigidas a una criatura de tu elección que no sea hostil hacia ti. Cuando el conjuro finaliza, la criatura se percata que se ha usado magia para influenciar su humor y se vuelve hostil hacia ti. Una criatura propensa a la violencia podría atacarte. Otra criatura podría buscar alguna otra manera de retribución (a la discreción del DM), dependiendo de la naturaleza de tu interacción con él.');
INSERT INTO `conjuros` VALUES(4, 'Caída de pluma', 1, 'Elige hasta a 5 criaturas que estén cayendo dentro del alcance. La velocidad de descenso de una criatura cayendo se reduce a 60 pies (12 casillas, 18 m) por asalto hasta que el conjuro finalice. Si la criatura aterriza antes de que el conjuro finalice, no sufre daño de caída y puede aterrizar de pie, y el conjuro finaliza para dicha criatura.');
INSERT INTO `conjuros` VALUES(5, 'Luz', 0, 'Tocas un objeto que no mida más de 10 pies (2 casillas, 3 m) en cualquier dimensión. Hasta que finalice el conjuro, el objeto desprende una luz brillante en un radio de 20 pies (4 casillas, 6 m) y luz tenue para 20 pies (4 casillas, 6 m) adicionales. La luz puede tener el color que quieras. Cubrir completamente el objeto con algo opaco bloquea la luz. El conjuro finaliza si lo lanzas de nuevo o lo disipas como una acción.');
INSERT INTO `conjuros` VALUES(6, 'Armadura de mago', 1, 'Tocas a una criatura voluntaria, que no esté portando una armadura, y una fuerza mágica protectora la rodea hasta el fin de la duración del conjuro. La CA base del objetivo se vuelve 13 + su modificador de Destreza. El conjuro finaliza si el receptor se pone una armadura o si tú cancelas el conjuro como una acción.');
INSERT INTO `conjuros` VALUES(7, 'Ilusión menor', 0, 'Creas un sonido o una imagen de un objeto dentro del alcance que permanece mientras dura el conjuro. La ilusión también finaliza si la disipas como una acción o lanzas de nuevo este conjuro.');
INSERT INTO `conjuros` VALUES(8, 'Proyectil mágico', 1, 'Creas tres dardos brillantes de fuerza mágica. Cada dardo impacta a una criatura de tu elección que puedas ver dentro del alcance. Un dardo inflige 1d4 + 1 puntos de daño por fuerza a su objetivo. Todos los dardos impactan a la vez, y los puedes dirigir para que impacten a una criatura o a varias.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosclase`
--

CREATE TABLE `conjurosclase` (
  `id_clase` int NOT NULL,
  `id_conjuro` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `conjurosclase`
--

INSERT INTO `conjurosclase` VALUES(11, 2);
INSERT INTO `conjurosclase` VALUES(11, 1);
INSERT INTO `conjurosclase` VALUES(5, 3);
INSERT INTO `conjurosclase` VALUES(5, 4);
INSERT INTO `conjurosclase` VALUES(10, 6);
INSERT INTO `conjurosclase` VALUES(10, 5);
INSERT INTO `conjurosclase` VALUES(7, 8);
INSERT INTO `conjurosclase` VALUES(7, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosespacios`
--

CREATE TABLE `conjurosespacios` (
  `id_clase` int NOT NULL,
  `0` int NOT NULL,
  `1` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosmaximos`
--

CREATE TABLE `conjurosmaximos` (
  `id_clase` int NOT NULL,
  `0` int NOT NULL,
  `1` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurospersonaje`
--

CREATE TABLE `conjurospersonaje` (
  `id_personaje` int NOT NULL,
  `id_conjuro` int NOT NULL,
  `preparado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientoclase`
--

CREATE TABLE `equipamientoclase` (
  `id_clase` int NOT NULL,
  `id_arma` int DEFAULT NULL,
  `id_objeto` int DEFAULT NULL,
  `id_armaduraOEscudo` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `equipamientoclase`
--

INSERT INTO `equipamientoclase` VALUES(4, 2, NULL, NULL);
INSERT INTO `equipamientoclase` VALUES(5, 4, 1, NULL);
INSERT INTO `equipamientoclase` VALUES(11, 1, NULL, 15);
INSERT INTO `equipamientoclase` VALUES(12, 6, 2, NULL);
INSERT INTO `equipamientoclase` VALUES(13, 7, 2, 15);
INSERT INTO `equipamientoclase` VALUES(10, 8, 2, NULL);
INSERT INTO `equipamientoclase` VALUES(7, 3, 3, NULL);
INSERT INTO `equipamientoclase` VALUES(14, 5, 2, NULL);
INSERT INTO `equipamientoclase` VALUES(6, 7, NULL, 15);
INSERT INTO `equipamientoclase` VALUES(8, 4, 2, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientopersonaje`
--

CREATE TABLE `equipamientopersonaje` (
  `id_personaje` int NOT NULL,
  `id_arma` int NOT NULL,
  `id_objeto` int NOT NULL,
  `id_armaduraOEscudo` int NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadespersonaje`
--

CREATE TABLE `habilidadespersonaje` (
  `id_personaje` int NOT NULL,
  `fuerza` int NOT NULL,
  `destreza` int NOT NULL,
  `constitucion` int NOT NULL,
  `inteligencia` int NOT NULL,
  `sabiduria` int NOT NULL,
  `carisma` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadesraza`
--

CREATE TABLE `habilidadesraza` (
  `id_raza` int NOT NULL,
  `fuerza` int NOT NULL,
  `destreza` int NOT NULL,
  `constitucion` int NOT NULL,
  `inteligencia` int NOT NULL,
  `sabiduria` int NOT NULL,
  `carisma` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `escritura` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` VALUES(1, 'Común', 'Comun');
INSERT INTO `idiomas` VALUES(2, 'Enano', 'Enano');
INSERT INTO `idiomas` VALUES(3, 'Elfico', 'Elfico');
INSERT INTO `idiomas` VALUES(4, 'Gigante', 'Enano');
INSERT INTO `idiomas` VALUES(5, 'Gnomico', 'Enano');
INSERT INTO `idiomas` VALUES(6, 'Goblin', 'Enano');
INSERT INTO `idiomas` VALUES(7, 'Mediano', 'Comun');
INSERT INTO `idiomas` VALUES(8, 'Orco', 'Enano');
INSERT INTO `idiomas` VALUES(9, 'Abisal', 'Infernal');
INSERT INTO `idiomas` VALUES(10, 'Celestial', 'Celestial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasclase`
--

CREATE TABLE `idiomasclase` (
  `id_idioma` int NOT NULL,
  `id_clase` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasclaseelegir`
--

CREATE TABLE `idiomasclaseelegir` (
  `id_idioma` int NOT NULL,
  `id_clase` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomaspersonaje`
--

CREATE TABLE `idiomaspersonaje` (
  `id_idioma` int NOT NULL,
  `id_personaje` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasraza`
--

CREATE TABLE `idiomasraza` (
  `id_idioma` int NOT NULL,
  `id_raza` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `idiomasraza`
--

INSERT INTO `idiomasraza` VALUES(1, 2);
INSERT INTO `idiomasraza` VALUES(1, 3);
INSERT INTO `idiomasraza` VALUES(3, 3);
INSERT INTO `idiomasraza` VALUES(1, 3);
INSERT INTO `idiomasraza` VALUES(3, 3);
INSERT INTO `idiomasraza` VALUES(1, 4);
INSERT INTO `idiomasraza` VALUES(8, 4);
INSERT INTO `idiomasraza` VALUES(1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasrazaelegir`
--

CREATE TABLE `idiomasrazaelegir` (
  `id_idioma` int NOT NULL,
  `id_raza` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomastrasfondoelegir`
--

CREATE TABLE `idiomastrasfondoelegir` (
  `id_idioma` int NOT NULL,
  `id_trasfondo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedaspersonaje`
--

CREATE TABLE `monedaspersonaje` (
  `id_personaje` int NOT NULL,
  `pc` int NOT NULL,
  `pp` int NOT NULL,
  `pe` int NOT NULL,
  `po` int NOT NULL,
  `ppt` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

CREATE TABLE `objetos` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `peso` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `objetos`
--

INSERT INTO `objetos` VALUES(1, 'Lira', 'Una lira', 3);
INSERT INTO `objetos` VALUES(2, 'Equipo de Explorador', 'Incluye una mochila, un saco de dormir, un Equipo de cocina, un yesquero, 10 antorchas, raciones para 10 días y un odre. El paquete también cuenta con 50 pies de cuerda de cáñamo atada al lado de la misma.', 40);
INSERT INTO `objetos` VALUES(3, 'Libro de conjuros', 'Un libro de conjuros', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jugador` int NOT NULL,
  `raza` int NOT NULL,
  `clase` int NOT NULL,
  `trasfondo` int NOT NULL,
  `xp` int DEFAULT NULL,
  `bonus_competencia` int DEFAULT NULL,
  `modificador_de_tiradas_de_salvacion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tiradas_de_salvacion_cd` int DEFAULT NULL,
  `iniciativa` int DEFAULT NULL,
  `clase_de_armadura` int DEFAULT NULL,
  `defensas` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inspiracion` int DEFAULT NULL,
  `velocidad` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dado_de_golpe` int DEFAULT NULL,
  `vida_maxima` int DEFAULT NULL,
  `vida_currente` int DEFAULT NULL,
  `sentidos` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `genero` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `alineamiento` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fe` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `piel` varchar(50) DEFAULT NULL,
  `ojos` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pelo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apariencia` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `aliados_y_organizaciones` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `personalidad` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ideales` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `vinculos` varchar(1000) DEFAULT NULL,
  `defectos` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `historia` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `notas_adicionales` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `habilidad_de_conjuros` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salvacion_conjuro` int DEFAULT NULL,
  `bonus_ataque_conjuro` int DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` VALUES(1, 'pepe', 1, 2, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `personajes` VALUES(2, 'manolo', 1, 5, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `personajes` VALUES(3, 'mariela', 1, 4, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgos`
--

CREATE TABLE `rasgos` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rasgos`
--

INSERT INTO `rasgos` VALUES(1, 'Visión en la Oscuridad', 'Tienes una visión superior en la oscuridad y la luz tenue. Puedes ver en luz tenue hasta los 60 (18 m) pies como si fuera a plena luz, y en la oscuridad como si fuera en luz tenue. No puedes distinguir colores en la oscuridad, sólo tonos de gris');
INSERT INTO `rasgos` VALUES(2, 'Ascendencia Feérica', 'Tienes ventaja en las tiradas de salvación contra Encantamiento, y no puedes ser dormido mediante la magia');
INSERT INTO `rasgos` VALUES(3, 'Versatilidad con Habilidades', 'Ganas competencia en dos habilidades a tu elección');
INSERT INTO `rasgos` VALUES(4, 'Amenazante', 'Ganas competencia en la habilidad Intimidar');
INSERT INTO `rasgos` VALUES(5, 'Resistencia Incansable', 'Cuando te ves reducido a 0 Puntos de Golpe pero no estás totalmente muerto, puedes volver a tener 1 punto de golpe en su lugar. No puedes volver usar este rasgo hasta que no hayas completado un descanso prolongado');
INSERT INTO `rasgos` VALUES(6, 'Ataques Salvajes', 'Cuando saques un impacto crítico con un ataque con arma cuerpo a cuerpo, puedes tirar otra vez uno de los dados de daño del arma y añadirlo al daño extra por el impacto crítico');
INSERT INTO `rasgos` VALUES(13, 'Incremento de Puntuación Humano', 'Todas tus puntuaciones de característica mejoran en 1');
INSERT INTO `rasgos` VALUES(14, 'Incremento de Puntuación Semielfo', 'Tu puntuación de Carisma aumenta en 2 y otras dos puntuaciones a tu elección aumentan en 1');
INSERT INTO `rasgos` VALUES(16, 'Incremento de Puntuación Tiflin', 'Tu puntuación de Inteligencia se incrementa en 1, y tu puntuación de Carisma se incrementa en 2');
INSERT INTO `rasgos` VALUES(17, 'Incremento de Puntuación Elfo', 'Tu puntuación de Destreza aumenta en 2.');
INSERT INTO `rasgos` VALUES(18, 'Incremento de Puntuación Alto Elfo', 'Tu puntuación de Inteligencia aumenta en 1.');
INSERT INTO `rasgos` VALUES(19, 'Incremento de Puntuación Semiorco', 'Tu puntuación de Fuerza se incrementa en 2 y tu puntuación de Constitución se incrementa en 1');
INSERT INTO `rasgos` VALUES(20, 'Sentidos Agudos', 'Eres competente con la habilidad de Percepción');
INSERT INTO `rasgos` VALUES(21, 'Entrenamiento en Armas Élficas', 'Eres competente con la espada larga, espada corta, arco largo y arco corto');
INSERT INTO `rasgos` VALUES(22, 'Legado Infernal', 'Conoces el truco taumaturgia. Una vez alcances el nivel 3, puedes conjurar el truco reprensión infernal una vez al día como si fuese un conjuro de nivel 2. Una vez alcances el nivel 5, puedes lanzar también el conjuro oscuridad una vez al día. El Carisma es tu característica de lanzamiento para estos conjuros');
INSERT INTO `rasgos` VALUES(23, 'Furia', 'En combate, luchas con una ferocidad primitiva. En tu turno, \r\npuedes entrar en furia como acción adicional');
INSERT INTO `rasgos` VALUES(24, 'Inspiración de bardo', 'Puedes inspirar a otros a través de palabras estimulantes o de la música. Para hacerlo, usas una acción adicional en tu \r\nturno para elegir una criatura distinta de ti mismo dentro de un rango de 60 pies (18 metros) y que pueda escucharte. Esa criatura gana un dado de Inspiración de Bardo, un d6');
INSERT INTO `rasgos` VALUES(25, 'Sentido divino', 'Tus sentidos captan la presencia de un terrible mal como un nauseabundo olor, y un bien poderoso resuena en tus oídos como música celestial. Como acción, puedes expandir tus sentidos para detectar esas fuerzas. Hasta el final de tu siguiente turno, conoces la localización de cualquier ser celestial, demoníaco o muerto viviente en un rango de 60 pies (18 metros) o menos que no esté tras una cobertura total');
INSERT INTO `rasgos` VALUES(26, 'Competencia con Habilidades Artista', 'Acrobacias, Interpretación');
INSERT INTO `rasgos` VALUES(27, 'Competencia con Herramientas Artista', 'Kit de disfraz, un tipo de instrumento musical');
INSERT INTO `rasgos` VALUES(28, 'Competencia con Habilidad Criminal', 'Engañar, Sigilo');
INSERT INTO `rasgos` VALUES(29, 'Competencia con Herramientas Criminal', 'Set de juego (dados de hueso o cartas), herramientas de ladrón');
INSERT INTO `rasgos` VALUES(30, 'Competencia con habilidades Soldado', 'Atletismo, Intimidación');
INSERT INTO `rasgos` VALUES(31, 'Competencia con herramientas Soldado', 'Un tipo de set de juego, vehículos (terrestres).');
INSERT INTO `rasgos` VALUES(32, 'Rango militar', 'Tienes un rango militar de tu carrera como soldado. Aquellos leales a tu antigua organización militar aún reconocen tu autoridad e influencia, y se dirigirán a ti con respeto si son de un rango inferior. Puedes invocar tu rango para ejercer influencia sobre los demás soldados y requisar equipo simple o caballos para un uso temporal. Generalmente también puedes tener acceso a los campamentos y fortalezas amistosas en las que se reconozca tu rango militar.');
INSERT INTO `rasgos` VALUES(33, 'Conjuros de Dominio', 'Cada dominio tiene una lista de conjuros propia, que obtienes según alcanzas niveles de clérigo. Cuando ganas un conjuro de dominio siempre lo tienes preparado, y no cuenta para el número de conjuros que puedes preparar cada día.');
INSERT INTO `rasgos` VALUES(34, 'Estilo de Combate a Distancia', 'Ganas un bonificador de +2 a las tiradas de ataque que hagas con armas a distancia.');
INSERT INTO `rasgos` VALUES(35, 'Nuevas Energías', 'Tienes una limitada capacidad de aguante que puedes usar para protegerte del peligro. En tu turno, puedes usar una acción adicional para ganar una cantidad de Puntos de Golpe igual a 1d10 + tu nivel de guerrero. Una vez que hayas usado este rasgo, debes hacer un descanso corto o prolongado antes de poder volver a usarlo.');
INSERT INTO `rasgos` VALUES(36, 'Foco Arcano', 'Puedes usar un foco arcano (se encuentra en el Capítulo 5) como foco de lanzamiento de conjuros para tus conjuros de hechicero');
INSERT INTO `rasgos` VALUES(37, 'Libro de Conjuros', 'A nivel 1 tienes un libro de conjuros que contiene seis conjuros de tu elección de nivel 1 de la lista de conjuros del mago.');
INSERT INTO `rasgos` VALUES(38, 'Ki', 'Comenzando en el nivel 2 tu entrenamiento te permite utilizar la mística energía del ki. Tu acceso a esta energía está representado por un número de puntos ki. Tu nivel de monje determina la cantidad de puntos de ki que tienes, tal como se muestra en la columna Puntos Ki en la tabla Monje. Puedes gastar estos puntos para utilizar varios rasgos. Comienzas conociendo tres: Ráfaga de Golpes, Defensa Paciente y Andar del Viento. Aprendes más rasgos al progresar niveles en esta clase. Cuando gastas un punto ki, no podrás volver a usarlo hasta que termine un descanso corto o prolongado, después del cual recuperas todos los puntos ki que hayas gastado. Debes pasar al menos 30 minutos del descanso en meditación para poder recuperar tus puntos ki.');
INSERT INTO `rasgos` VALUES(39, 'Jerga de Ladrones', 'Durante tu entrenamiento de pícaro aprendiste la jerga de los ladrones, una mezcla secreta de dialectos, argot y código que te permite esconder mensajes en lo que aparentemente sería una conversación normal. Solo otra criatura que conozca la jerga de los ladrones puede entender esos mensajes. Requiere cuatro veces más tiempo transmitir un mensaje de esta forma que hacerlo de manera convencional.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosclase`
--

CREATE TABLE `rasgosclase` (
  `id_rasgo` int NOT NULL,
  `id_clase` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rasgosclase`
--

INSERT INTO `rasgosclase` VALUES(25, 6);
INSERT INTO `rasgosclase` VALUES(24, 5);
INSERT INTO `rasgosclase` VALUES(23, 4);
INSERT INTO `rasgosclase` VALUES(37, 7);
INSERT INTO `rasgosclase` VALUES(39, 8);
INSERT INTO `rasgosclase` VALUES(36, 10);
INSERT INTO `rasgosclase` VALUES(33, 11);
INSERT INTO `rasgosclase` VALUES(34, 12);
INSERT INTO `rasgosclase` VALUES(35, 13);
INSERT INTO `rasgosclase` VALUES(38, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosraza`
--

CREATE TABLE `rasgosraza` (
  `id_rasgo` int NOT NULL,
  `id_raza` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rasgosraza`
--

INSERT INTO `rasgosraza` VALUES(13, 2);
INSERT INTO `rasgosraza` VALUES(17, 6);
INSERT INTO `rasgosraza` VALUES(1, 6);
INSERT INTO `rasgosraza` VALUES(20, 6);
INSERT INTO `rasgosraza` VALUES(2, 6);
INSERT INTO `rasgosraza` VALUES(21, 7);
INSERT INTO `rasgosraza` VALUES(18, 7);
INSERT INTO `rasgosraza` VALUES(19, 4);
INSERT INTO `rasgosraza` VALUES(1, 4);
INSERT INTO `rasgosraza` VALUES(4, 4);
INSERT INTO `rasgosraza` VALUES(6, 4);
INSERT INTO `rasgosraza` VALUES(5, 4);
INSERT INTO `rasgosraza` VALUES(14, 3);
INSERT INTO `rasgosraza` VALUES(2, 3);
INSERT INTO `rasgosraza` VALUES(3, 3);
INSERT INTO `rasgosraza` VALUES(1, 3);
INSERT INTO `rasgosraza` VALUES(1, 5);
INSERT INTO `rasgosraza` VALUES(16, 5);
INSERT INTO `rasgosraza` VALUES(22, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgostrasfondo`
--

CREATE TABLE `rasgostrasfondo` (
  `id_rasgo` int NOT NULL,
  `id_trasfondo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rasgostrasfondo`
--

INSERT INTO `rasgostrasfondo` VALUES(26, 1);
INSERT INTO `rasgostrasfondo` VALUES(27, 1);
INSERT INTO `rasgostrasfondo` VALUES(28, 2);
INSERT INTO `rasgostrasfondo` VALUES(29, 2);
INSERT INTO `rasgostrasfondo` VALUES(31, 3);
INSERT INTO `rasgostrasfondo` VALUES(30, 3);
INSERT INTO `rasgostrasfondo` VALUES(32, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

CREATE TABLE `razas` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `edad` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `alineamiento` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tamaño` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `velocidad` int DEFAULT NULL,
  `idiomas_elegir` int NOT NULL,
  `id_padre` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `razas`
--

INSERT INTO `razas` VALUES(2, 'Humano', 'En el cómputo de la mayoría de los mundos, los humanos son la más joven de las razas comunes, con una llegada tardía al\r\nmundo y una vida corta en comparación con los enanos, elfos, y dragones. Quizás es por su corta vida que se esfuerzan en conseguir tanto como pueden en los años que se les han dado. O quizás sienten que tienen algo que demostrar a las razas más antiguas, y es por eso que construyen poderosos imperios basados en la conquista y el comercio. Sea lo que sea lo que les motiva, los humanos son los innovadores, los pioneros y los triunfadores de los mundos.', 'Los humanos alcanzan la madurez cerca de la veintena y rara vez llegan a vivir un siglo completo.', 'Los humanos tienen a no tener un alineamiento concreto. En ellos se puede encontrar tanto lo mejor como lo peor.', ' Mediano(1,5 m — 1,8 m)', 30, 1, NULL);
INSERT INTO `razas` VALUES(3, 'Semielfo', 'Caminando entre dos mundos pero sin pertenecer realmente a ninguno de los dos, los semielfos combinan lo que algunos dicen ser las mejores cualidades de sus progenitores humanos y elfos: la curiosidad, inventiva y ambición humana templada por los sentidos refinados, el amor por el arte y la naturaleza de los elfos. \r\nAlgunos semielfos viven entre los humanos, separados por sus diferencias emocionales y físicas, viendo a amigos y seres queridos envejecer mientras el tiempo no les toca a ellos. Otros viven entre los elfos, aumentando su inquietud conforme se acercan a la edad adulta en los intemporales reinos élficos, mientras sus compañeros continúan viviendo como niños. \r\nMuchos semielfos, incapaces de encajar en ninguna sociedad, eligen una vida errante en solitario o uniéndose a otros inadaptados y marginados en la vida aventurera.', 'Los semielfos maduran a la misma velocidad que\r\nlos humanos y alcanzan la adultez alrededor de los 20 años.\r\nViven, sin embargo, mucho más que los humanos, excediendo a menudo los 180 años.', 'Los semielfos comparten la inclinación caótica de su herencia élfica. Valoran tanto la libertad personal como la expresión creativa, no demostrando amor por los líderes ni deseo de seguidores. Les fastidian las reglas, molestándose con las demandas de los demás, y en ocasiones se muestran poco fiables o por lo menos impredecibles.', ' Mediano(1,5 m — 1,8 m)', 30, 1, NULL);
INSERT INTO `razas` VALUES(4, 'Semiorco', 'Ya sean unidos bajo el liderazgo de un poderoso brujo o luchando para resistir tras años de conflicto, las tribus humanas y orcas a veces forman alianzas, uniendo sus fuerzas en una horda mayor para el terror de las tierras civilizadas cercanas. Cuando esas alianzas se sellan con matrimonios, nacen los semiorcos. Algunos semiorcos crecen para convertirse en jefes orgullosos de tribus orcas, con su sangre humana proveyéndoles de ventaja sobre sus rivales orcos purasangres. Algunos se aventuran en el mundo para probar su valía ante los humanos y otras razas más civilizadas. Muchos de estos se convierten en aventureros, cosechando grandeza por sus grandes hazañas y notoriedad por sus costumbres bárbaras y su furia salvaje.', 'Los semiorcos maduran un poco más rápido que\r\nlos humanos, alcanzando la adultez alrededor de los 14. Envejecen notablemente más rápido y raramente viven más de 75 años', 'Los semiorcos heredan una tendencia hacia el caos de sus padres orcos y no están muy inclinados hacia el bien. Los semiorcos criados entre orcos y dispuestos a pasar sus vidas entre ellos son usualmente malvados', ' Mediano(1,6 m — 1,9 m)', 30, 0, NULL);
INSERT INTO `razas` VALUES(5, 'Tiflin', 'Ser recibido con miradas y susurros, sufrir violencia e insultos en la calle, ver la desconfianza y el miedo en todos los ojos: este es el destino de los tiflin. Y para retorcer el puñal, los tiflin saben que esto es a causa de un pacto sellado hace generaciones que infundió la esencia de Asmodeo —señor supremo de los Nueve Infiernos— en su linaje. Su apariencia y su naturaleza no tienen más culpa que el resultado de un antiguo pecado, por el que ellos y sus hijos, y los hijos de sus hijos, siempre se considerarán responsables.', 'Los tiflin maduran a la misma velocidad que los humanos pero viven unos pocos años más.', 'Los tiflin no tienen una tendencia innata hacia el mal, pero muchos de ellos acaban allí. Malvados o no, su naturaleza independiente inclina a muchos tiflin hacia un alineamiento caótico.', ' Mediano(1,5 m — 1,8 m)', 30, 0, NULL);
INSERT INTO `razas` VALUES(6, 'Elfo', 'Los elfos son un pueblo mágico de gracia sobrenatural, viviendo en el mundo sin ser del todo parte de él. Viven en lugares de etérea belleza, en medio de antiguos bosques o en plateados minaretes que resplandecen con luz feérica, donde una suave música flota en el aire y delicadas fragancias son transportadas por la brisa. Los elfos aman la naturaleza y la magia, el arte y la maestría, la música y la poesía, y las cosas buenas del mundo', 'Aunque los elfos alcanzan la madurez física más o menos a la misma edad que los humanos, la comprensión élfica de la madurez va más allá del crecimiento físico y abarca la experiencia del mundo. Un elfo típicamente reclama la edad adulta y un nombre adulto alrededor de los 100 años y puede vivir hasta los 750', 'Los elfos aman la libertad, la variedad y la autoexpresión, así que se inclinan fuertemente hacia los aspectos más gentiles del caos. Valoran y protegen la libertad de los demás al igual que la suya propia, y son más a menudo de alineamiento bueno que de cualquier otro. Los drow son la excepción; su exilio en el inframundo los ha hecho viciosos y peligrosos. Los drow son regularmente más malvados que otra cosa', 'Mediano(1,5 m — 1,8 m)', 30, 0, NULL);
INSERT INTO `razas` VALUES(7, 'Alto Elfo', NULL, NULL, NULL, NULL, NULL, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiradassalvacion`
--

CREATE TABLE `tiradassalvacion` (
  `id_personaje` int NOT NULL,
  `fuerza` int NOT NULL,
  `destreza` int NOT NULL,
  `constitucion` int NOT NULL,
  `inteligencia` int NOT NULL,
  `sabiduria` int NOT NULL,
  `carisma` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasfondos`
--

CREATE TABLE `trasfondos` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idiomas_elegir` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `trasfondos`
--

INSERT INTO `trasfondos` VALUES(1, 'Artista', 'Te creces frente a una audiencia. Sabes cómo deleitarlos, entretenerlos e incluso cómo inspirarlos. Tu poesía puede agitar los corazones de los que te escuchan, despertar el dolor o la alegría, la risa o la ira. Tu música eleva sus espíritus o captura su dolor. Tus pasos de danza cautivan, tu humor es hiriente. Sea cual sea la técnica que utilizas, tu arte es tu vida', 0);
INSERT INTO `trasfondos` VALUES(2, 'Criminal', 'Eres un criminal experimentado con un historial delictivo. Has pasado mucho tiempo entre criminales y todavía tienes contactos dentro del mundo criminal. Estas mucho más cerca que la mayoría de la gente del mundo del asesinato, el robo y la violencia que prevalece en los barrios bajos de la civilización y has sobrevivido hasta ahora gracias a burlarte de las reglas y reglamentos de la sociedad', 0);
INSERT INTO `trasfondos` VALUES(3, 'Soldado', 'La guerra ha sido tu vida desde que puedes recordar. Fuiste entrenado en tu juventud en el estudio del uso de las armas y armaduras y aprendido las técnicas básicas de supervivencia, incluida la forma de mantenerte con vida en el campo de batalla. Es posible que hayas sido parte de un ejército nacional permanente o de una compañía de mercenarios, o tal vez miembro de una milicia local que saltó a la fama durante una guerra reciente.', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `contrasena` varchar(300) NOT NULL,
  `fecha` date DEFAULT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` VALUES(1, 'test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08', '2021-12-01', 'test@test.com');
INSERT INTO `usuarios` VALUES(5, 'Natroks', 'b84f6c6f0217a6c47f52b5fbe90f16ddf1a267fb8426aadb65ce6592c8a9177a', '2000-08-07', 'natroksyt@gmail.com');
INSERT INTO `usuarios` VALUES(6, 'Marti', 'adefb68926ebe4e68ee4fb19feb31fdeb301bfe3b1d41cd814182864f6561196', '2021-12-18', 'asdads@a.com');
INSERT INTO `usuarios` VALUES(9, 'pepe', '7c9e7c1494b2684ab7c19d6aff737e460fa9e98d5a234da1310c97ddf5691834', '2021-12-08', 'pepe@pepe.pepe');
INSERT INTO `usuarios` VALUES(15, 'manoli', 'd8a503bbeace390b73180d76929c4d9777a494a8183cdac345ba47db364c1fc8', '1975-01-01', 'emieza@xtec.cat');
INSERT INTO `usuarios` VALUES(29, 'bigCockMan', '9390298f3fb0c5b160498935d79cb139aef28e1c47358b4bbba61862b9c26e59', '2021-12-03', 'enVerdaEsPequinyo@small.dick');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `armadurasyescudos`
--
ALTER TABLE `armadurasyescudos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `armas`
--
ALTER TABLE `armas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conjuros`
--
ALTER TABLE `conjuros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `conjurosclase`
--
ALTER TABLE `conjurosclase`
  ADD KEY `fk_conjurosclase-clase` (`id_clase`),
  ADD KEY `fk_conjurosclase-conjuro` (`id_conjuro`);

--
-- Indices de la tabla `equipamientoclase`
--
ALTER TABLE `equipamientoclase`
  ADD KEY `fk_equipamientoOpciones-arma` (`id_arma`),
  ADD KEY `fk_equipamientoOpciones-armaduraOEscudo` (`id_armaduraOEscudo`),
  ADD KEY `fk_equipamientoOpciones-objeto` (`id_objeto`),
  ADD KEY `fk_equipamientoclase` (`id_clase`);

--
-- Indices de la tabla `habilidadespersonaje`
--
ALTER TABLE `habilidadespersonaje`
  ADD KEY `fk_habilidadesPersonaje-personaje` (`id_personaje`);

--
-- Indices de la tabla `habilidadesraza`
--
ALTER TABLE `habilidadesraza`
  ADD KEY `fk_habilidadesRaza-raza` (`id_raza`);

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `idiomasclase`
--
ALTER TABLE `idiomasclase`
  ADD KEY `fk_idiomasClase-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasClase-clase` (`id_clase`);

--
-- Indices de la tabla `idiomasclaseelegir`
--
ALTER TABLE `idiomasclaseelegir`
  ADD KEY `fk_idiomaClaseElegir-clase` (`id_clase`),
  ADD KEY `fk_idiomaClaseElegir-idioma` (`id_idioma`);

--
-- Indices de la tabla `idiomaspersonaje`
--
ALTER TABLE `idiomaspersonaje`
  ADD KEY `fk_idiomasPersonaje-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasPersonaje-personaje` (`id_personaje`);

--
-- Indices de la tabla `idiomasraza`
--
ALTER TABLE `idiomasraza`
  ADD KEY `fk_idiomaRaza-idioma` (`id_idioma`),
  ADD KEY `fk_idiomaRaza-raza` (`id_raza`);

--
-- Indices de la tabla `idiomasrazaelegir`
--
ALTER TABLE `idiomasrazaelegir`
  ADD KEY `fk_idiomasRazaElegir-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasRazaElegir-raza` (`id_raza`);

--
-- Indices de la tabla `idiomastrasfondoelegir`
--
ALTER TABLE `idiomastrasfondoelegir`
  ADD KEY `fk_idiomasTrasfondoElegir-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasTrasfondoElegir-trasfondo` (`id_trasfondo`);

--
-- Indices de la tabla `monedaspersonaje`
--
ALTER TABLE `monedaspersonaje`
  ADD KEY `fk_monedasPersonaje-personaje` (`id_personaje`);

--
-- Indices de la tabla `objetos`
--
ALTER TABLE `objetos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_personajes-clase` (`clase`),
  ADD KEY `fk_personajes-jugador` (`jugador`),
  ADD KEY `fk_personajes-raza` (`raza`),
  ADD KEY `fk_personajes-trasfondo` (`trasfondo`);

--
-- Indices de la tabla `rasgos`
--
ALTER TABLE `rasgos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `rasgosclase`
--
ALTER TABLE `rasgosclase`
  ADD KEY `fk_rasgosClase-clase` (`id_clase`),
  ADD KEY `fk_rasgosClase-rasgo` (`id_rasgo`);

--
-- Indices de la tabla `rasgosraza`
--
ALTER TABLE `rasgosraza`
  ADD KEY `fk_rasgoRaza-rasgo` (`id_rasgo`),
  ADD KEY `fk_rasgoRaza-raza` (`id_raza`);

--
-- Indices de la tabla `rasgostrasfondo`
--
ALTER TABLE `rasgostrasfondo`
  ADD KEY `fk_rasgosTrasfondo-rasgo` (`id_rasgo`),
  ADD KEY `fk_rasgosTrasfondo-trasfondo` (`id_trasfondo`);

--
-- Indices de la tabla `razas`
--
ALTER TABLE `razas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `fk_razas-padre` (`id_padre`);

--
-- Indices de la tabla `tiradassalvacion`
--
ALTER TABLE `tiradassalvacion`
  ADD KEY `fk_tiradasSalvacion-personaje` (`id_personaje`);

--
-- Indices de la tabla `trasfondos`
--
ALTER TABLE `trasfondos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `armadurasyescudos`
--
ALTER TABLE `armadurasyescudos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `armas`
--
ALTER TABLE `armas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `conjuros`
--
ALTER TABLE `conjuros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `objetos`
--
ALTER TABLE `objetos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rasgos`
--
ALTER TABLE `rasgos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `razas`
--
ALTER TABLE `razas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `trasfondos`
--
ALTER TABLE `trasfondos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conjurosclase`
--
ALTER TABLE `conjurosclase`
  ADD CONSTRAINT `fk_conjurosclase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conjurosclase-conjuro` FOREIGN KEY (`id_conjuro`) REFERENCES `conjuros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipamientoclase`
--
ALTER TABLE `equipamientoclase`
  ADD CONSTRAINT `fk_equipamientoclase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoOpciones-arma` FOREIGN KEY (`id_arma`) REFERENCES `armas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoOpciones-armaduraOEscudo` FOREIGN KEY (`id_armaduraOEscudo`) REFERENCES `armadurasyescudos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoOpciones-objeto` FOREIGN KEY (`id_objeto`) REFERENCES `objetos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habilidadespersonaje`
--
ALTER TABLE `habilidadespersonaje`
  ADD CONSTRAINT `fk_habilidadesPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habilidadesraza`
--
ALTER TABLE `habilidadesraza`
  ADD CONSTRAINT `fk_habilidadesRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasclase`
--
ALTER TABLE `idiomasclase`
  ADD CONSTRAINT `fk_idiomasClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasClase-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasclaseelegir`
--
ALTER TABLE `idiomasclaseelegir`
  ADD CONSTRAINT `fk_idiomaClaseElegir-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomaClaseElegir-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomaspersonaje`
--
ALTER TABLE `idiomaspersonaje`
  ADD CONSTRAINT `fk_idiomasPersonaje-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasraza`
--
ALTER TABLE `idiomasraza`
  ADD CONSTRAINT `fk_idiomaRaza-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomaRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasrazaelegir`
--
ALTER TABLE `idiomasrazaelegir`
  ADD CONSTRAINT `fk_idiomasRazaElegir-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasRazaElegir-raza` FOREIGN KEY (`id_raza`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomastrasfondoelegir`
--
ALTER TABLE `idiomastrasfondoelegir`
  ADD CONSTRAINT `fk_idiomasTrasfondoElegir-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasTrasfondoElegir-trasfondo` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `monedaspersonaje`
--
ALTER TABLE `monedaspersonaje`
  ADD CONSTRAINT `fk_monedasPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD CONSTRAINT `fk_personajes-clase` FOREIGN KEY (`clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personajes-jugador` FOREIGN KEY (`jugador`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personajes-raza` FOREIGN KEY (`raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personajes-trasfondo` FOREIGN KEY (`trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rasgosclase`
--
ALTER TABLE `rasgosclase`
  ADD CONSTRAINT `fk_rasgosClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rasgosClase-rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rasgosraza`
--
ALTER TABLE `rasgosraza`
  ADD CONSTRAINT `fk_rasgoRaza-rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rasgoRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rasgostrasfondo`
--
ALTER TABLE `rasgostrasfondo`
  ADD CONSTRAINT `fk_rasgosTrasfondo-rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rasgosTrasfondo-trasfondo` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `razas`
--
ALTER TABLE `razas`
  ADD CONSTRAINT `fk_razas-padre` FOREIGN KEY (`id_padre`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tiradassalvacion`
--
ALTER TABLE `tiradassalvacion`
  ADD CONSTRAINT `fk_tiradasSalvacion-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
