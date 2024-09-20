-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE `auteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cv` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `auteur` (`id`, `surname`, `name`, `cv`) VALUES
(1,	'Faye',	'Gaël',	'Auteur compositeur interprète, Gaël Faye est l’auteur du premier roman phénomène Petit pays (Grasset 2016, prix Goncourt des lycéens) ainsi que de plusieurs albums, de Pili pili sur un croissant au beurre (2013), à Mauve Jacaranda (2022). Il était la Révélation scène de l’année des Victoires de la musique 2018.'),
(2,	'Norek',	'Olivier',	' Olivier Norek est l\'auteur des romans policiers Code 93, Territoires, Surtensions, Surface, Dans les brumes de Capelans, qui ont reçu de nombreux prix littéraires et ont été traduits dans le monde entier.\r\nSon passé de logisticien humanitaire (Guyane, ex-Yougoslavie...) et sa volonté d\'engagement le conduisent aussi à explorer des sujets de société majeurs tels que la crise migratoire et écologique à travers les romans Entre deux mondes et Impact.\r\nAvec Les Guerriers de l\'Hiver, il nous raconte l\'épopée héroïque de ces soldats oubliés de l\'Histoire, dont le sacrifice résonne avec notre actualité.'),
(3,	'Daoud',	'Kamel',	' Kamel Daoud, écrivain et journaliste, est notamment l\'auteur de Meursault, contre-enquête (2014, Goncourt du premier roman).'),
(4,	'Jaenada',	'Philippe',	'Philippe Jaenada, né le 25 mai 1964 à Saint-Germain-en-Laye, est un écrivain français. '),
(5,	'Orengo',	'Jean-Noël',	'Jean-Noël Orengo est chroniqueur de films pour le magazine Transfuge. Il est l\'auteur d\'un essai sur l\'art, Vivre en peinture, paru aux éditions Les Cahiers dessinés en 2023. Tous ses romans sont publiés aux éditions Grasset.'),
(6,	'de Kerangal',	'Maylis',	'Maylis de Kerangal est l\'autrice de sept fictions aux Éditions Verticales, dont Corniche Kennedy (2008), Naissance d\'un pont (2010, prix Médicis, prix Franz-Hessel), Réparer les vivants (2014, dix prix Littéraires), Un monde à portée de main (2018) et Canoës, ainsi que de trois récits dans la collection « Minimales » : Ni fleurs ni couronnes (2006), Tangente vers l\'est (2012, prix Landerneau) et À ce stade de la nuit (2015).'),
(7,	'Collette',	'Sandrine',	'Sandrine Collette vit dans le Morvan. Elle est notamment l\'auteure de Et toujours les Forêts, Grand prix RTL Lire, prix du Livre France Bleu - PAGE des libraires, prix de La Closerie des Lilas, ainsi que de On était des loups, prix Renaudot des Lycéens et prix Giono 2022.'),
(8,	'Martinez',	'Carole',	'Carole Martinez, née en 1966, est romancière et professeure de français. Son premier roman, \"Le cœur cousu\", a été récompensé par quinze prix littéraires, dont le prix Renaudot des lycéens en 2007. Son deuxième roman, \"Du domaine des murmures\", a lui aussi été acclamé par la critique. Publié en 2011, il a notamment reçu le prix Goncourt des lycéens. En 2016, Carole Martinez a publié \"La Terre qui penche\", qui témoigne a nouveau de son immense talent, de cet univers si singulier, entre magie et songe, sensualité et violence, petite et grande Histoire.'),
(9,	'Lighieri',	'Rebecca',	'Emmanuelle Bayamack-Tam, née Garino le 16 mars 1966 à Marseille, est une écrivaine française1. Elle écrit également sous le pseudonyme de Rebecca Lighieri. '),
(10,	'Taïa',	'Abdellah',	'Abdellah Taïa est né à Rabat (Maroc) en 1973. Il a publié aux Éditions du Seuil plusieurs romans, traduits dans de nombreuses langues, notamment Une mélancolie arabe, Le Jour du roi (Prix de Flore 2010) et Vivre à ta lumière. Le Bastion des Larmes est son premier livre aux Éditions Julliard.'),
(11,	'de Montaigu',	'Thibault',	'Thibault de Montaigu a publié sept romans et essais, dont Un jeune homme triste, Les anges brûlent, Les Grands Gestes la nuit, Zanzibar et, en 2020, La Grâce, qui a reçu le prix de Flore.'),
(12,	'Clerc',	'Thomas',	'Thomas Clerc, né en 1965 à Neuilly-sur-Seine, est un romancier, essayiste, poète et universitaire français. '),
(13,	'Lambert',	'Emmanuelle',	'Emmanuelle Lambert est l\'autrice de romans et d\'essais, parmi lesquels Giono, furioso (Stock, 2019 ; prix Femina essai), Le Garçon de mon père (Stock, 2021) et Sidonie Gabrielle Colette (Gallimard, 2022).'),
(14,	'Kern',	'Etienne',	' Étienne Kern vit et enseigne à Lyon. Il est l\'auteur aux Éditions Gallimard d\'un roman, Les envolés, couronné en 2022 du Goncourt du premier roman et traduit dans plusieurs langues.'),
(15,	'Gaudy',	'Hélène',	'Née en 1979 à Paris, Hélène Gaudy a étudié à l\'École supérieure des arts décoratifs de Strasbourg. Autrice de plusieurs romans, elle a également publié des ouvrages pour la jeunesse et des livres d\'art.'),
(16,	'Barrouk',	'Ruben',	'Ruben Barrouk est né en 1997 à Paris. En 2022, il retourne sur les traces de sa famille séfarade à Marrakech, où vit sa grand-mère, personnage principal de ce premier roman.')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `surname` = VALUES(`surname`), `name` = VALUES(`name`), `cv` = VALUES(`cv`);

DROP TABLE IF EXISTS `editor`;
CREATE TABLE `editor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `editor` (`id`, `nom`) VALUES
(1,	'Grasset'),
(2,	'Michel Lafon'),
(3,	'Gallimard'),
(4,	'Mialet-Barrault'),
(5,	'JC Lattès'),
(6,	'P.O.L'),
(7,	'Julliard'),
(8,	'Albin Michel'),
(9,	'Les éditions de minuit'),
(10,	'Stock'),
(11,	'Editions de l\'Olivier'),
(13,	'Verticales')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nom` = VALUES(`nom`);

DROP TABLE IF EXISTS `Livre`;
CREATE TABLE `Livre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `digest` longtext,
  `editor_id` int(11) NOT NULL,
  `parution` date NOT NULL,
  `nb_pages` int(11) NOT NULL,
  `ISBN` bigint(20) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_auteur` (`id_auteur`),
  KEY `editor_id` (`editor_id`),
  CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`id_auteur`) REFERENCES `auteur` (`id`),
  CONSTRAINT `livre_ibfk_2` FOREIGN KEY (`editor_id`) REFERENCES `editor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Livre` (`id`, `titre`, `id_auteur`, `digest`, `editor_id`, `parution`, `nb_pages`, `ISBN`, `prix`) VALUES
(1,	'Jacaranda',	1,	'Quels secrets cache l’ombre du jacaranda, l’arbre fétiche de Stella  ? Il faudra à son ami Milan des années pour le découvrir. Des années pour percer les silences du Rwanda, dévasté après le génocide des Tutsi. En rendant leur parole aux disparus, les jeunes gens échapperont à la solitude. Et trouveront la paix près des rivages magnifiques du lac Kivu.\r\nSur quatre générations, avec sa douceur unique, Gaël Faye nous raconte l’histoire terrible d’un pays qui s’essaie malgré tout au dialogue et au pardon. Comme un arbre se dresse entre ténèbres et lumière, Jacaranda célèbre l’humanité, paradoxale, aimante, vivante.',	1,	'2024-09-19',	281,	9782246831457,	20.9),
(2,	'Les guerriers de l\'hiver',	2,	'Le nouveau roman événement d\'Olivier Norek.\r\n\r\n\" Je suis certain que nous avons réveillé leur satané Sisu.\r\n– Je ne parle pas leur langue, camarade.\r\n– Et je ne pourrais te traduire ce mot, car il n\'a d\'équivalent nulle part ailleurs. Le Sisu est l\'âme de la Finlande. Il dit le courage, la force intérieure, la ténacité, la résistance, la détermination... Une vie austère, dans un environnement hostile, a forgé leur mental d\'un acier qui nous résiste aujourd\'hui. \"\r\n\r\nImaginez un pays minuscule.\r\nImaginez-en un autre, gigantesque.\r\nImaginez maintenant qu\'ils s\'affrontent.\r\n\r\nAu cœur du plus mordant de ses hivers, au cœur de la guerre la plus meurtrière de son histoire, un peuple se dresse contre l\'ennemi, et parmi ses soldats naît une légende. La légende de Simo, la Mort Blanche.',	2,	'2024-08-29',	446,	9782749947204,	21.95),
(3,	'Houris',	3,	'« Je suis la véritable trace, le plus solide des indices attestant de tout ce que nous avons vécu en dix ans en Algérie. Je cache l\'histoire d\'une guerre entière, inscrite sur ma peau depuis que je suis enfant. »\r\n\r\nAube est une jeune Algérienne qui doit se souvenir de la guerre d\'indépendance, qu\'elle n\'a pas vécue, et oublier la guerre civile des années 1990, qu\'elle a elle-même traversée. Sa tragédie est marquée sur son corps : une cicatrice au cou et des cordes vocales détruites. Muette, elle rêve de retrouver sa voix.\r\n\r\nSon histoire, elle ne peut la raconter qu\'à la fille qu\'elle porte dans son ventre. Mais a-t-elle le droit de garder cette enfant ? Peut-on donner la vie quand on vous l\'a presque arrachée ? Dans un pays qui a voté des lois pour punir quiconque évoque la guerre civile, Aube décide de se rendre dans son village natal, où tout a débuté, et où les morts lui répondront peut-être.',	3,	'2024-08-15',	411,	9782072999994,	23),
(4,	'La désinvolture est une bien belle chose',	4,	'Pourquoi, un matin d\'automne, une si jolie jeune femme, intelligente et libre, entourée d\'amis, admirée, une fille que la vie semblait amuser, amoureuse d\'un beau soldat américain qui l\'aimait aussi, s\'est-elle jetée à l\'aube par la fenêtre d\'une chambre d\'hôtel, à vingt ans ? J\'aimerais savoir, comprendre.',	4,	'2024-08-21',	486,	9782080427298,	22),
(5,	'Vous êtes l\'amour malheureux du Führer',	5,	'1969 : Albert Speer, architecte favori et ministre de l\'Armement d\'Hitler, publie ses Mémoires. Revisitant son passé, de ses mises en scène des congrès nazis à la chute du Reich, il parachève l\'ultime métamorphose qui a sauvé sa tête au procès de Nuremberg et va faire de lui la star de la culpabilité allemande. Affirmant n\'avoir rien su de la Solution finale, il se déclare « responsable, mais pas coupable ». Les historiens auront beau démontrer qu\'il a menti, sa version de lui-même s\'imposera toujours.\r\n\r\nComment écrire sur un homme qui a rendu la fiction plus séduisante que la vérité ?\r\n\r\nÀ l\'heure des fake news et de la guerre des récits, voici le roman d\'un des plus grands mensonges de l\'Histoire. Traquant les scènes de la vie de Speer, s\'interrogeant sur leur vraisemblance, éclairant certains aspects, allant là où il s\'arrête en convoquant les acteurs capitaux d\'après-guerre, notamment l\'historienne Gitta Sereny, l\'auteur propose une lecture vertigineuse de celui à qui l\'un de ses collaborateurs affirmait : « Savez-vous ce que vous êtes ? Vous êtes l\'amour malheureux du Führer. »',	1,	'2024-08-28',	263,	9782246831372,	20.9),
(6,	'Jour de ressac',	6,	'« Finalement, il vous dit quelque chose, notre homme ? Nous arrivions à hauteur de Gonfreville-l\'Orcher, la raffinerie sortait de terre, indéchiffrable et nébuleuse, façon Gotham City, une autre ville derrière la ville, j\'ai baissé ma vitre et inhalé longuement, le nez orienté vers les tours de distillation, vers ce Meccano démentiel. L\'étrange puanteur s\'engouffrait dans la voiture, mélange d\'hydrocarbures, de sel et de poudre. Il m\'a intimé de refermer avant de m\'interroger de nouveau, pourquoi avais-je finalement demandé à voir le corps ? C\'est que vous y avez repensé, c\'est que quelque chose a dû vous revenir.\r\n\r\nOui, j\'y avais repensé. Qu\'est-ce qu\'il s\'imaginait. Je n\'avais pratiquement fait que penser à ça depuis ce matin, mais y penser avait fini par prendre la forme d\'une ville, d\'un premier amour, la forme d\'un porte-conteneurs.\r\n\r\n »\r\n',	13,	'2024-08-15',	241,	9782073054975,	21),
(7,	'Madelaine avant l\'aube',	7,	'C’est un endroit à l’abri du temps. Ce minuscule hameau, qu’on appelle Les Montées, est un pays à lui seul pour les jumelles Ambre et Aelis, et la vieille Rose.\r\nIci, l’existence n’a jamais été douce. Les familles travaillent une terre avare qui appartient à d’autres, endurent en serrant les dents l’injustice. Mais c’est ainsi depuis toujours.\r\nJusqu’au jour où surgit Madelaine. Une fillette affamée et sauvage, sortie des forêts. Adoptée par Les Montées, Madelaine les ravit, passionnée, courageuse, si vivante. Pourtant, il reste dans ses yeux cette petite flamme pas tout à fait droite. Une petite flamme qui fera un jour brûler le monde.\r\n\r\nAvec Madelaine avant l’aube, Sandrine Collette questionne l’ordre des choses, sonde l’instinct de révolte, et nous offre, servie par une écriture éblouissante, une ode aux liens familiaux.',	5,	'2024-08-21',	247,	9782709674539,	20.9),
(8,	'Dors ton sommeil de brute',	8,	'« Un long hurlement, celui d’une foule d’enfants, secoue la planète. Dans les villes, le Cri passe à travers les murs, se faufile dans les canalisations, jaillit sous les planchers, court dans les couloirs des tours où les familles dorment les unes au-dessus des autres, le Cri se répand dans les rues. »\r\n\r\nUn rêve collectif court à la vitesse de la rotation terrestre. Il touche tous les enfants du monde à mesure que la nuit avance.\r\nLes nuits de la planète seront désormais marquées par l’apparition de désordres nouveaux, comme si les esprits de la nature tentaient de communiquer avec l’humanité à travers les songes des enfants.\r\nEva a fui son mari et s’est coupée du monde. Dans l’espace sauvage où elle s’est réfugiée avec sa fille Lucie, elle est déterminée à se battre contre ce qui menace son enfant durant son sommeil sur une Terre qui semble basculer.\r\nComment lutter contre la nuit et les cauchemars d’une fillette ?\r\n',	3,	'2024-08-15',	400,	9782072929861,	22),
(9,	'Le club des enfants perdus',	9,	'À vingt-sept ans, Miranda semble appartenir à un drôle de club : celui des enfants qui n\'ont manqué de rien sauf de cette joie pure, essentielle, que certains ressentent du seul fait d\'être en vie.',	6,	'2024-08-22',	515,	9782818061435,	22),
(10,	'Le bastion des larmes',	10,	'À la mort de sa mère, Youssef, un professeur marocain exilé en France depuis un quart de siècle, revient à Salé, sa ville natale, à la demande de ses sœurs, pour liquider l\'héritage familial. En lui, c\'est tout un passé qui ressurgit, où se mêlent inextricablement souffrances et bonheur de vivre.\r\nÀ travers lui, les voix du passé résonnent et l\'interpellent, dont celle de Najib, son ami et amant de jeunesse au destin tragique, happé par le trafic de drogue et la corruption d\'un colonel de l\'armée du roi Hassan II. À mesure que Youssef s\'enfonce dans les ruelles de la ville actuelle, un monde perdu reprend forme, guetté par la misère et la violence, où la différence, sexuelle, sociale, se paie au prix fort. Frontière ultime de ce roman splendide, le Bastion des Larmes, nom donné aux remparts de la vieille ville, à l\'ombre desquels Youssef a jadis fait une promesse à Najib. \" Notre passé... notre grande fiction \", médite Youssef, tandis qu\'il s\'apprête à entrer pleinement dans son héritage, celui d\'une enfance terrible, d\'un amour absolu, aussi, pour ses sœurs magnifiques et sa mère disparue.\r\n\r\n',	7,	'2024-08-22',	212,	9782260056515,	21),
(11,	'Cœur',	11,	'Première sélection - Prix Goncourt 2024\r\n\r\nPremière sélection - Prix Goncourt des Lycéens 2024\r\n\r\nPremière sélection - Prix Renaudot 2024\r\n\r\nPremière sélection du Prix Jean Giono 2024\r\n\r\nSélection Transfuge des 20 meilleurs livres de la rentrée littéraire\r\n\r\n« Coeur est à offrir à tous ceux qui en ont encore un ». L\'Express\r\n\r\n\" C\'est sans conteste l\'un des meilleurs romans de cette rentrée.\" Le Figaro Magazine\r\n\r\n« Je croyais écrire cette histoire pour mon père, alors que c\'était l\'inverse : cette histoire, il me l\'avait offerte. Et chaque fois que j\'ouvrirai ces pages, je le retrouverai comme si je tenais son coeur vivant entre mes mains. »\r\n\r\nQuand son père malade le presse d\'écrire sur son ancêtre Louis, capitaine des hussards fauché en 1914 dans une charge de cavalerie, Thibault de Montaigu ne sait pas encore quel secret de famille cache cette mort héroïque. Ni pourquoi elle résonne étrangement avec le destin de son propre père qui décline de jour en jour. La course contre la montre qu\'il engage alors pour remonter le passé se mue en une enquête bouleversante où se succèdent personnages proustiens et veuves de guerre, amants flamboyants et épouses délaissées.\r\n\r\nThibault de Montaigu nous raconte une lignée hantée par la gloire et l\'honneur. Mais aussi ce qu\'il reste d\'amour et de courage dissimulés dans le coeur des hommes.',	8,	'2024-08-21',	327,	9782226493217,	21.9),
(12,	'Paris, musée du XXIe siècle : le 18e',	12,	'Le 18e arrondissement compte 425 rues, squares, places, avenues, cités, jardins, villas, boulevards, impasses et passages que Thomas Clerc a entrepris d’arpenter depuis qu’il y a emménagé récemment. Description totale, née de ses déambulations, dérives et notations, ce livre n’omet rien de ce que la ville laisse voir, entendre et ressentir.\r\nDe Montmartre aux abords du périphérique, des habitants de ses quartiers aux touristes égarés, des cafés aux darks stores, de la nuit au jour, l’ancien faubourg de Paris, insurgé sous la Commune, ne cesse de changer d’apparence, quand ce n’est l’auteur lui-même qui le refaçonne au gré de son périple. Le 18e se déroule comme une toile géante où chaque rue est un tableau vivant.',	9,	'2024-08-29',	624,	9782707355362,	25),
(13,	'Aucun respect',	13,	'Une jeune femme idéaliste comme on peut l\'être à vingt ans arrive à Paris à la fin des années 1990. On la suit dans sa découverte d\'un milieu intellectuel qui a tout d\'une caste d\'hommes.\r\n\r\nElle y rencontre l\'écrivain Alain Robbe-Grillet, imposant « Pape du Nouveau Roman », et son épouse Catherine, maîtresse-star de cérémonies sadomasochistes. Ils incarnent une certaine idée de la littérature et de la liberté sexuelle. Toutes choses auxquelles l\'héroïne s\'affronte tant bien que mal.\r\n\r\nRaconté avec impertinence depuis aujourd\'hui, son apprentissage, d\'une drôlerie irrésistible, est un conte contemporain. Sa leçon est que la liberté s\'exerce dans le jeu avec les autorités établies. Et sa morale, qu\'il ne faut jamais sous-estimer les jeunes femmes.',	10,	'2024-08-21',	224,	9782234093829,	20),
(14,	'La vie meilleure',	14,	'« Nous sommes la somme de nos amours. Et c\'est la seule chose qui restera de nous. »\r\n\r\nOn l\'a comparé à Gandhi, à Einstein, à Lénine. Des foules l\'ont acclamé. Des milliardaires lui ont tapé sur l\'épaule. Les damnés de la terre l\'ont imploré. Aujourd\'hui, son nom nous fait sourire, tout comme son invention : la méthode Coué.\r\n\r\nSingulier destin que celui d\'Émile Coué, obscur pharmacien français devenu célébrité mondiale, tour à tour adulé et moqué. La vie meilleure retrace l\'histoire de ce précurseur du développement personnel qui, au début du XXe siècle, pensait avoir découvert les clés de la santé et du bonheur. Un homme sincère jusque dans sa roublardise, qui croyait plus que tout au pouvoir des mots et de l\'imagination.\r\n\r\nAvec ce roman lumineux aux accents intimes, Étienne Kern rend hommage à ceux qui cherchent coûte que coûte une place pour la joie.',	3,	'2024-08-22',	187,	9782073075833,	19.5),
(15,	'Archipels',	15,	'«?Aux confins de la Louisiane, une île porte le prénom de mon père.\r\n\r\nChaque jour, elle s’enfonce un peu plus sous les eaux.?»\r\n\r\nIl a fallu que son esprit vogue jusqu’à l’Isle de Jean-Charles pour qu’elle se retrouve enfin face à son père. Qui est cet homme à la présence tranquille, à la parole rare, qui se dit sans mémoire?? Pour le découvrir elle se lance dans un projet singulier : lui rendre ses souvenirs, les faire resurgir des objets et des paysages.\r\n\r\nLe premier lieu à arpenter est l’atelier où il a amassé toutes sortes de curiosités, autant de traces qui nourrissent l’enquête sur ce mystère de proximité : le temps qui passe et ces grands inconnus que demeurent souvent nos parents. Derrière l’accumulateur compulsif, l’archiviste des vies des autres, se révèlent l’homme enfant marqué par la guerre, l’artiste engagé et secret. Peu à peu leur relation change, leurs écritures se mêlent et ravivent les hantises et les rêves de toute une époque.\r\n\r\nÀ travers cette géographie intime, Hélène Gaudy explore ce qui se transmet en silence, offrant à son père l’espoir d’un lieu insubmersible – et aux lecteurs, un texte sensible d’une grande beauté.',	11,	'2024-08-19',	285,	9782823621150,	21),
(16,	'Tout le bruit du Guéliz',	16,	'Sélection Prix Stanislas du premier roman\r\n\r\n« Le bruit condamne l\'Homme à l\'oubli. Mais parfois il arrive qu\'il le sauve de l\'oubli. Il ne tient qu\'à nous de l\'entendre. »\r\n\r\nDans le quartier du Guéliz à Marrakech, un mystérieux bruit hante et tourmente, nuit et jour, une vieille dame. Inquiets, sa fille et son petit-fils quittent Paris pour mener l\'enquête. Sur place, ils guettent, épient, espèrent, mais aucun bruit ne se fait entendre...\r\n\r\nTout le bruit du Guéliz ne nous livre pas une mais mille histoires : celles des exodes, des traditions, des liens qui se font et se défont, des origines perdues.\r\n\r\nÀ la violence et au vacarme assourdissant de notre époque, ce premier roman aux allures de conte, à la fois tendre, drôle et bouleversant, oppose un bruit. Le bruit du Guéliz. Celui d\'un temps révolu, où l\'on vivait ensemble.',	8,	'2024-08-21',	213,	9782226496058,	19.9)
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `titre` = VALUES(`titre`), `id_auteur` = VALUES(`id_auteur`), `digest` = VALUES(`digest`), `editor_id` = VALUES(`editor_id`), `parution` = VALUES(`parution`), `nb_pages` = VALUES(`nb_pages`), `ISBN` = VALUES(`ISBN`), `prix` = VALUES(`prix`);

DROP TABLE IF EXISTS `main_characters`;
CREATE TABLE `main_characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_livre` int(11) NOT NULL,
  `personnage` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_livre` (`id_livre`),
  CONSTRAINT `main_characters_ibfk_1` FOREIGN KEY (`id_livre`) REFERENCES `Livre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `main_characters` (`id`, `id_livre`, `personnage`) VALUES
(1,	12,	'Le 18e arondissement de Paris'),
(2,	1,	'Milan'),
(3,	1,	'Stella'),
(4,	3,	'Aube')
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `id_livre` = VALUES(`id_livre`), `personnage` = VALUES(`personnage`);

DROP TABLE IF EXISTS `selection`;
CREATE TABLE `selection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stage` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `selection_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Livre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vote';

INSERT INTO `selection` (`id`, `stage`, `book_id`, `vote`) VALUES
(1,	1,	1,	0),
(2,	1,	2,	0),
(3,	1,	3,	0),
(4,	1,	4,	0),
(5,	1,	5,	0),
(6,	1,	6,	0),
(7,	1,	7,	0),
(8,	1,	8,	0),
(9,	1,	9,	0),
(10,	1,	10,	0),
(11,	1,	11,	0),
(12,	1,	12,	0),
(13,	1,	13,	0),
(14,	1,	14,	0),
(15,	1,	15,	0),
(16,	1,	16,	0)
ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `stage` = VALUES(`stage`), `book_id` = VALUES(`book_id`), `vote` = VALUES(`vote`);

-- 2024-09-20 14:02:35
