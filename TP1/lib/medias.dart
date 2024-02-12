class Media {
  final String nom;
  final String categorie;
  final String image;
  final String description;
  bool favorite;

  Media({
    required this.nom,
    required this.categorie,
    required this.image,
    required this.description,
    this.favorite = false,
  });
}


final List<Media> medias = [
  Media(
    nom: "Harry Potter 1",
    categorie: 'Film',
    image: 'assets/imgs/harrypotter1.webp',
    description: '''Orphelin, Harry Potter a été recueilli à contrecœur par son oncle Vernon et sa tante Pétunia, aussi cruels que mesquins, qui n'hésitent pas à le faire dormir dans le placard sous l'escalier. Constamment maltraité, il doit en outre supporter les jérémiades de son cousin Dudley, garçon cupide et archi-gâté par ses parents. De leur côté, Vernon et Pétunia détestent leur neveu dont la présence leur rappelle sans cesse le tempérament 'imprévisible' des parents du garçon et leur mort mystérieuse. À l'approche de ses 11 ans, Harry ne s'attend à rien de particulier – ni carte, ni cadeau, ni même un goûter d'anniversaire. Et pourtant, c'est à cette occasion qu'il découvre qu'il est le fils de deux puissants magiciens et qu'il possède lui aussi d'extraordinaires pouvoirs. Quand on lui propose d'intégrer Poudlard, la prestigieuse école de sorcellerie, il trouve enfin le foyer et la famille qui lui ont toujours manqué… et s'engage dans l'aventure de sa vie.'''
  ),
  Media(
    nom: "Harry Potter 2",
    categorie: 'Film',
    image: 'assets/imgs/harrypotter2.jpg',
    description: '''Une rentrée fracassante en voiture volante, une étrange malédiction qui s'abat sur les élèves, cette deuxième année à l'école des sorciers ne s'annonce pas de tout repos ! Entre les cours de potions magiques, les matches de Quidditch et les combats de mauvais sorts, Harry et ses amis Ron et Hermione trouveront-t-ils le temps de percer le mystère de la Chambre des Secrets ?'''
  ),
  Media(
    nom: "Harry Potter 3",
    categorie: 'Film',
    image: 'assets/imgs/harrypotter3.jpg',
    description: '''Après des vacances mouvementées chez les Dursley, Harry Potter retrouve ses deux fidèles amis, Ron et Hermione, pour prendre le train qui les ramène à Poudlard, l'école des sorciers. Aux dernières nouvelles, Sirius Black, un agent de Voldemort, se serait échappé de la prison d'Azkaban.'''
  ),
  Media(
    nom: "Harry Potter 4",
    categorie: 'Film',
    image: 'assets/imgs/harrypotter4.jpeg',
    description: '''Harry Potter a quatorze ans et il entre en quatrième année au collège de Poudlard. Une grande nouvelle attend Harry, Ron et Hermione à leur arrivée : la tenue d'un tournoi de magie exceptionnel entre les plus célèbres écoles de sorcellerie.'''
  ),
  Media(
    nom: "Harry Potter 5",
    categorie: 'Film',
    image: 'assets/imgs/harrypotter5.jpg',
    description: '''Harry Potter rentre en 5e année a poudlard . Une année difficile car voldemort est de retour et tente de reconstituer sa fidèle armée pour pouvoir reprendre le pouvoir . dumbledore de son coter reconstitue son organisation " l'ordre du phénix " pour combatte voldemort . La guerre semble inévitable .'''
  ),
  Media(
    nom: "Harry Potter 6",
    categorie: 'Film',
    image: 'assets/imgs/harrypotter6.jpg',
    description: '''L'étau démoniaque de Voldemort se resserre sur l'univers des Moldus et le monde de la sorcellerie. Poudlard a cessé d'être un havre de paix, le danger rode au coeur du château... Mais Dumbledore est plus décidé que jamais à préparer Harry à son combat final, désormais imminent.'''
  ),
  Media(
    nom: "Harry Potter 7 partie 1",
    categorie: 'Film',
    image: 'assets/imgs/harrypotter7_1.webp',
    description: '''Le pouvoir de Voldemort s'étend. Celui-ci contrôle maintenant le Ministère de la Magie et Poudlard. Harry, Ron et Hermione décident de terminer le travail commencé par Dumbledore, et de retrouver les derniers Horcruxes pour vaincre le Seigneur des Ténèbres.'''
  ),
  Media(
    nom: "Harry Potter 7 partie 2",
    categorie: 'Film',
    image: 'assets/imgs/harrypotter7_2.jpg',
    description: '''Dans la 2e Partie de cet épisode final, le combat entre les puissances du bien et du mal de l'univers des sorciers se transforme en guerre sans merci. Les enjeux n'ont jamais été si considérables et personne n'est en sécurité.'''
  ),
  Media(
    nom: 'Le sang et l`acier',
    categorie: 'Livre',
    image: 'assets/imgs/lesangetlacier.jpg',
    description: '''Althea a un rêve ultime : devenir l'une des guerrières légendaires du royaume de Thezmarr. Pour y parvenir, il ne lui reste que peu de temps car un oracle lui a prédit qu'elle mourrait à l'âge de 27 ans. Déterminée, la jeune femme réussit à se faire engager par la guilde d'élite chargée de la protection du royaume. ..'''
  ),
  Media(
    nom: "Game of Thrones",
    categorie: "Série",
    image: 'assets/imgs/got.jpg',
    description: '''Histoire située sur les continents fictifs de Westeros et Essos, Game Of Thrones est une série télévisée qui ne manque pas d'intrigue. Cette histoire repose sur les relations rocambolesques de nombreuses familles, allant se disputer une place importante : Le Trône de fer.'''
  ),
  Media(
    nom: "Crescent City 1",
    categorie: "Livre",
    image: 'assets/imgs/crescentcity1.jpg',
    description: '''Bryce, une jeune femme mi-fae, mi-humaine, a une vie parfaite : elle travaille la journée chez un marchand d'antiquités qui vend des artefacts magiques et fait la fête toute la nuit avec ses amis en savourant chaque plaisir qu'offre Lunathion – plus connue sous le nom de Crescent City.'''
  ),
  Media(
    nom: "Crescent City 2",
    categorie: "Livre",
    image: 'assets/imgs/crescentcity2.jpg',
    description: '''Après avoir sauvé Crescent City, Bryce et Hunt tentent de revenir à une vie normale. Le temps de se remettre des évènements du printemps et de voir ce que l'avenir leur réserve, ils ont choisi de garder les choses platoniques entre eux... mais pourront-ils résister à la tentation ?'''
  ),
  Media(
    nom: "Crescent City 3",
    categorie: "Livre",
    image: 'assets/imgs/crescentcity3.jpg',
    description: '''Une explosion d'étoiles. Piégée dans un autre monde que le sien, Bryce n'a qu'un seul but : retourner sur Midgard et sauver ceux qu'elle aime. Dans ce nouveau royaume fae, elle va devoir user de toute son intelligence pour percer les mystères qu'il renferme et espérer rentrer chez elle.'''
  ),
  Media(
    nom: "The Witcher 1",
    categorie: "Livre",
    image: 'assets/imgs/thewitcher1.jpg',
    description: '''The story takes place in a medieval fantasy world and follows Geralt of Rivia, one of a few traveling monster hunters who have supernatural powers, known as Witchers. Players can choose one of three fighting styles to use in different situations and against different foes.'''
  ),
  Media(
    nom: "The Witcher 2",
    categorie: "Livre",
    image: 'assets/imgs/thewitcher2.webp',
    description: '''Le joueur prend le rôle de Geralt, un tueur de monstres professionnel qui s'est retrouvé embrigadé dans les troubles politiques du Royaume de Téméria en aidant à écraser la rébellion lancée par l'Ordre de la Rose Ardente, et qui a sauvé la vie du Roi en le protégeant d'un assassin aux allures de sorceleur.'''
  ),
  Media(
    nom: "The Witcher 3",
    categorie: "Livre",
    image: 'assets/imgs/thewitcher3.jpg',
    description: '''Visitez la ville luxueuse et corrompue de Novigrad, affrontez le froid glacial de l'archipel venteux de Skellige et défiez les forces obscures qui rôdent dans les Terres désolées, une région désolée et ravagée.'''
  ),
  Media(
    nom: "The Witcher 4",
    categorie: "Livre",
    image: 'assets/imgs/thewitcher4.jpg',
    description: '''Le sorceleur Geralt, un chasseur de monstres mutant, se bat pour trouver sa place dans un monde où les humains se révèlent souvent plus vicieux que les bêtes. Après avoir abandonné son impartialité, le héros partira en saison 4 à la recherche de sa fille adoptive, Ciri, qu’il pense avoir été capturée par les Nilfgaardiens. En réalité, l'apprenti sorceleuse a traversé un portail et s’est retrouvé dans un désert où elle a failli trouver la mort… Les deux personnages devront retrouver leur chemin l’un vers l’autre.'''
  ),
  Media(
    nom: "The Witcher 5",
    categorie: "Livre",
    image: 'assets/imgs/thewitcher5.jpg',
    description: '''La saga qui a inspiré le jeu vidéo et la série Netflix The Witcher !La jeune Ciri a été enlevée et est contrainte d'épouser l'empereur de Nilfgaard. Geralt de Riv se rue à son secours sans une seconde d'hésitation, malgré ses blessures. Dans son dangereux périple, il sera accompagné par Jaskier, son fidèle ami barde, et d'autres compagnons de fortune. Ils ne seront pas de trop, car la guerre sévit de tous côtés, et les magiciennes rescapées tentent de sauvegarder l'avenir de la magie..'''
  ),
  Media(
    nom: "The Witcher 6",
    categorie: "Livre",
    image: 'assets/imgs/thewitcher6.jpg',
    description: '''Sorceleur (Witcher), T6 : La Tour de l'Hirondelle. Convaincu que Ciri s'apprête à épouser l'empereur de Nilfgaard, le sorceleur poursuit sa route vers le sud. Mais ce périple est long et dangereux, car de nombreux ennemis se dressent devant lui.'''
  ),
  Media(
    nom: "The Witcher 7",
    categorie: "Livre",
    image: 'assets/imgs/thewitcher7.jpg',
    description: '''Sorceleur (Witcher), T6 : La Tour de l'Hirondelle. Convaincu que Ciri s'apprête à épouser l'empereur de Nilfgaard, le sorceleur poursuit sa route vers le sud. Mais ce périple est long et dangereux, car de nombreux ennemis se dressent devant lui.'''
  ),
  Media(
    nom: "Breaking Bad",
    categorie: "Série",
    image: 'assets/imgs/breaking_bad.webp',
    description: '''La série se concentre sur Walter White, un professeur de chimie surqualifié et père de famille, qui, ayant appris qu'il est atteint d'un cancer du poumon en phase terminale, sombre dans le crime pour assurer l'avenir financier de sa famille.'''
  ),
  Media(
    nom: "Twin Peaks",
    categorie: "Série",
    image: 'assets/imgs/twin_peaks.jpg',
    description: '''Un meurtre a été commis à Twin Peaks, une petite bourgade de l'Etat de Washington en apparence tranquille. La jeune Laura Palmer est retrouvée morte nue au bord d'un lac, enveloppée dans du plastique. L'agent spécial du FBI, Dale Cooper, envoyé sur place pour démasquer le coupable, mène l'enquête avec le soutien du shérif local, Harry Truman. Ces investigations les amènent à révéler au grand jour les sombres secrets des uns et des autres. Pendant ce temps, d'inquiétants phénomènes se produisent...'''
  ),
  Media(
    nom: "Kaamelott",
    categorie: "Série",
    image: 'assets/imgs/kaamelott.jpg',
    description: '''Le quotidien banal et burlesque du roi Arthur et des chevaliers de la Table ronde : quête du Graal, repas en famille et stratégie militaire.'''
  ),
  Media(
    nom: "Dexter",
    categorie: "Série",
    image: 'assets/imgs/dexter.jpg',
    description: '''Brillant expert scientifique du service médico-légal de la police de Miami, Dexter Morgan est spécialisé dans l'analyse de prélèvements sanguins. Mais voilà, Dexter cache un terrible secret : il est également tueur en série. Un serial killer pas comme les autres, avec sa propre vision de la justice.'''
  ),
  Media(
    nom: "Friends",
    categorie: "Série",
    image: 'assets/imgs/friends.png',
    description: '''L'histoire raconte les péripéties de trois jeunes femmes et trois jeunes hommes new-yorkais liés par une profonde amitié. Entre amour, travail, famille, ils partagent leurs bonheurs et leurs soucis au Central Perk, leur café favori.'''
  ),
  Media(
    nom: "The Walking Dead",
    categorie: "Série",
    image: 'assets/imgs/the_walking_dead.jpg',
    description: '''L'histoire suit le personnage de Rick Grimes (interprété par Andrew Lincoln), adjoint du shérif du comté de Kings (en Géorgie). Il se réveille d'un coma de plusieurs semaines pour découvrir que la population a été ravagée par une épidémie inconnue qui transforme les êtres humains en morts-vivants, appelés « rôdeurs ».'''
  ),
  Media(
    nom: "Black Mirror",
    categorie: "Série",
    image: 'assets/imgs/black_mirror.webp',
    description: '''Sous un angle noir et souvent satirique, la série envisage un futur proche, voire immédiat. Elle interroge les conséquences inattendues que pourraient avoir les nouvelles technologies, et comment ces dernières influent sur la nature humaine de ses utilisateurs et inversement.'''
  ),
  Media(
    nom: "Doctor Who",
    categorie: "Série",
    image: 'assets/imgs/doctor_who.jpg',
    description: '''Extraterrestre de 900 ans, le Docteur est un aventurier qui voyage à travers le temps et l'espace à l'aide de son vaisseau, le TARDIS (Time And Relative Dimension In Space), qui, pour mieux s'adapter à l'environnement, a l'apparence d'une cabine téléphonique. Le Docteur voyage en compagnie d'une jeune fille.'''
  ),
  Media(
    nom: "The Big Bang Theory",
    categorie: "Série",
    image: 'assets/imgs/the_big_bang_theory.jpg',
    description: '''La série suit la vie fictive de deux scientifiques du California Institute of Technology (Caltech) à Pasadena en Californie : le physicien expérimental Leonard Hofstadter et le physicien théoricien Sheldon Cooper. Ils vivent en colocation dans cette ville de la banlieue de Los Angeles, au 2311 North Los Robles Avenue.'''
  ),
  Media(
    nom: "Peaky Blinders",
    categorie: "Série",
    image: 'assets/imgs/peaky_blinders.webp',
    description: '''En 1919, à Birmingham, soldats, révolutionnaires politiques et criminels combattent pour se faire une place dans le paysage industriel de l'après-Guerre. Le Parlement s'attend à une violente révolte, et Winston Churchill mobilise des forces spéciales pour contenir les menaces.'''
  ),
  Media(
    nom: "Dr House",
    categorie: "Série",
    image: 'assets/imgs/dr_house.webp',
    description: '''House est un personnage arrogant, cynique, anticonformiste et asocial. Il souffre d'une claudication provenant d'une douleur chronique à la jambe droite due à un infarctus du muscle de la cuisse. Il marche avec une canne et abuse de Vicodin, un analgésique opiacé, pour soulager sa douleur.'''
  ),
  Media(
    nom: "Stranger Things",
    categorie: "Série",
    image: 'assets/imgs/stranger_things.webp',
    description: '''A Hawkins, en 1983 dans l'Indiana. Lorsque Will Byers disparaît de son domicile, ses amis se lancent dans une recherche semée d'embûches pour le retrouver. Dans leur quête de réponses, les garçons rencontrent une étrange jeune fille en fuite.'''
  ),
  Media(
    nom: "Better Call Saul",
    categorie: "Série",
    image: 'assets/imgs/better_call_saul.webp',
    description: '''Six ans avant de croiser le chemin de Walter White, Saul Goodman, connu sous le nom de Jimmy McGill, est un avocat qui peine à joindre les deux bouts, à Albuquerque, au Nouveau-Mexique. Pour boucler ses fins de mois, il n'aura d'autres choix que se livrer à quelques petites escroqueries.'''
  ),
  Media(
    nom: "The Boys",
    categorie: "Série",
    image: 'assets/imgs/the_boys.webp',
    description: '''Dans un monde fictif où les super-héros se sont laissés corrompre par la célébrité et la gloire et ont peu à peu révélé la part sombre de leur personnalité, une équipe de justiciers qui se fait appeler "The Boys" décide de passer à l'action et d'abattre ces super-héros autrefois appréciés de tous.'''
  ),
  Media(
    nom: "Seigneur des anneaux 1",
    categorie: "Film",
    image: 'assets/imgs/seigneurdesanneaux1.jpg',
    description: '''Dans ce chapitre de la trilogie, le jeune et timide Hobbit, Frodon Sacquet, hérite d'un anneau. Bien loin d'être une simple babiole, il s'agit de l'Anneau Unique, un instrument de pouvoir absolu qui permettrait à Sauron, le Seigneur des ténèbres, de régner sur la Terre du Milieu et de réduire en esclavage ses peuples. À moins que Frodon, aidé d'une Compagnie constituée de Hobbits, d'Hommes, d'un Magicien, d'un Nain, et d'un Elfe, ne parvienne à emporter l'Anneau à travers la Terre du Milieu jusqu'à la Crevasse du Destin, lieu où il a été forgé, et à le détruire pour toujours. Un tel périple signifie s'aventurer très loin en Mordor, les terres du Seigneur des ténèbres, où est rassemblée son armée d'Orques maléfiques... La Compagnie doit non seulement combattre les forces extérieures du mal mais aussi les dissensions internes et l'influence corruptrice qu'exerce l'Anneau lui-même.'''
  ),
  Media(
    nom: "Seigneur des anneaux 2",
    categorie: "Film",
    image: 'assets/imgs/seigneurdesanneaux2.jpg',
    description: '''Après la mort de Boromir et la disparition de Gandalf, la Communauté s'est scindée en trois. Perdus dans les collines d'Emyn Muil, Frodon et Sam découvrent qu'ils sont suivis par Gollum, une créature versatile corrompue par l'Anneau. Celui-ci promet de conduire les Hobbits jusqu'à la Porte Noire du Mordor.'''
  ),
  Media(
    nom: "Seigneur des anneaux 3",
    categorie: "Film",
    image: 'assets/imgs/seigneurdesanneaux3.jpg',
    description: '''Les armées de Sauron ont attaqué Minas Tirith, la capitale de Gondor. Jamais ce royaume autrefois puissant n'a eu autant besoin de son roi. Mais Aragorn trouvera-t-il en lui la volonté d'accomplir sa destinée ?'''
  ),
  Media(
    nom: "Inception",
    categorie: "Film",
    image: 'assets/imgs/inception.jpg',
    description: '''L' « inception » consiste à implanter une idée dans les rêves d'un homme. C'est la spécialité de Cobb, qui doit pénétrer dans le subconscient de Robert Fischer, afin de le persuader de démanteler l'empire industriel dont il va hériter.'''
  ),
  Media(
    nom: "Le parrain",
    categorie: "Film",
    image: 'assets/imgs/le_parrain.webp',
    description: '''Don "Vito" Corleone est le parrain de l'une des cinq familles qui contrôlent New-York en 1945. Alors qu'il reçoit une proposition des Tattaglia pour entrer dans le trafic de drogue, il choisit de décliner l'offre, tandis que Sonny, l'un de ses fils, y est favorable.'''
  ),
  Media(
    nom: "Forrest Gump",
    categorie: "Film",
    image: 'assets/imgs/forrest_gump.webp',
    description: '''Ce film raconte l'histoire d'un jeune garçon en situation de handicap qui va réussir sa vie. Forrest Gump est un enfant qui a un handicap moteur (ses jambes ne fonctionnent pas correctement, il doit porter des attelles) et qui souffre de troubles autistiques.'''
  ),
  Media(
    nom: "Django Unchained",
    categorie: "Film",
    image: 'assets/imgs/django_unchained.jpg',
    description: '''Deux ans avant la Guerre civile, dans le sud des États-Unis, un ancien dentiste devenu chasseur de primes, le Dr Schultz, libère un esclave noir nommé Django afin de pourchasser et d'abattre trois frères recherchés par les autorités. Sous les conseils du docteur, Django devient un habile chasseur de primes.'''
  ),
  Media(
    nom: "Reservoir Dogs",
    categorie: "Film",
    image: 'assets/imgs/reservoir_dogs.webp',
    description: '''Six truands désignés par des noms de code entreprennent de dévaliser une importante bijouterie sous la direction du tyrannique Joe Cabot et de son fils Nice Guy Eddie. L'opération échoue malencontreusement et se solde par un bain de sang. Les malfrats se réfugient alors dans un entrepôt sordide'''
  ),
  Media(
    nom: "Pulp Fiction",
    categorie: "Film",
    image: 'assets/imgs/pulp_fiction.jpg',
    description: '''Deux tueurs à gage philosophes, un dangereux gangster mariée à une séduisante toxicomane, un boxeur sur le retour, un caïd élégant, deux tourtereaux à la gâchette facile vont voir leur destin se croiser au cours d'une odyssée sanglante dans la jungle de Los Angeles.'''
  ),
  Media(
    nom: "Le Grand Bleu",
    categorie: "Film",
    image: 'assets/imgs/le_grand_bleu.webp',
    description: ''' La rivalité de deux enfants, dans la mer, en Grèce, qui se poursuit lorsqu'ils sont adultes. Lequel des deux plongera le plus loin et le plus profond ? Leurs amours, leurs amitiés, avec les humains et avec les dauphins, à la poursuite d'un rêve inaccessible.'''
  ),
  Media(
    nom: "Fight Club",
    categorie: "Film",
    image: 'assets/imgs/fight_club.jpg',
    description: '''Ce film décrit le parcours d'un homme d'une trentaine d'années qui bouleverse sa vie monotone de cadre et de consommateur lorsqu'il fait la connaissance de Tyler Durden, un homme marginal, enclin à la violence, avec qui il créera un club de combat underground, le Fight Club.'''
  ),
  Media(
    nom: "La ligne verte",
    categorie: "Film",
    image: 'assets/imgs/la_ligne_verte.jpg',
    description: '''Paul Edgecomb, pensionnaire centenaire d'une maison de retraite, est hanté par ses souvenirs. Gardien-chef du pénitencier de Cold Mountain en 1935, il était chargé de veiller au bon déroulement des exécutions capitales en s'efforçant d'adoucir les derniers moments des condamnés.'''
  ),
  Media(
    nom: "Gladiator",
    categorie: "Film",
    image: 'assets/imgs/gladiator.jpg',
    description: '''Homme qui, chez les Romains, combattait dans l'arène contre d'autres hommes ou contre des bêtes féroces.'''
  ),
  Media(
    nom: "1984",
    categorie: "Livre",
    image: 'assets/imgs/1984.webp',
    description: '''Il décrit une Grande-Bretagne trente ans après une guerre nucléaire entre l'Est et l'Ouest censée avoir eu lieu dans les années 1950 et où s'est instauré un régime totalitaire fortement inspiré à la fois de certains éléments du stalinisme et du nazisme.'''
  ),
  Media(
    nom: "Le Petit Prince",
    categorie: "Livre",
    image: 'assets/imgs/le_petit_prince.jpg',
    description: '''Le petit prince est un mystérieux enfant venant d'une planète « à peine plus grande qu'une maison » qu'il a quittée en raison des exigences de sa rose à qui il accorde pourtant toute son attention en se pliant à ses moindres caprices.'''
  ),
  Media(
    nom: "Dune",
    categorie: "Livre",
    image: 'assets/imgs/dune.webp',
    description: '''C’est la troisième adaptation du roman Dune de Frank Herbert paru en 1965, après le film Dune (1984) de David Lynch et la minisérie en trois épisodes Dune (2000) de John Harrison — sans compter l’adaptation avortée d’Alejandro Jodorowsky dans les années 1970.'''
  ),
  Media(
    nom: "Le Parfum",
    categorie: "Livre",
    image: 'assets/imgs/le_parfum.jpg',
    description: '''Histoire d'un meurtrier (Das Parfüm – Die Geschichte eines Mörders dans son titre original) se déroule en France au XVIIIe siècle. Le roman de Patrick Süskind raconte la vie d'un orphelin à l'odorat exceptionnel, qui, à force de vouloir créer un parfum au pouvoir irrésistible, devient tueur en série'''
  ),
  Media(
    nom: "Cyrano de Bergerac",
    categorie: "Livre",
    image: 'assets/imgs/cyrano_de_bergerac.webp',
    description: '''Cyrano est un personnage qui attache de l'importance à des qualités héroïques comme la loyauté, l'amour et l'honneur. Il est brave et rejette toute forme de lâcheté. Il vit un amour platonique pour sa cousine, un amour idéal.'''
  ),
  Media(
    nom: "Le Meilleur des Mondes",
    categorie: "Livre",
    image: 'assets/imgs/le_meilleur_des_mondes.webp',
    description: '''Écrit en 1931 par Aldous Huxley, « Le meilleur des mondes » nous décrit une société dystopique où les maladies ont été éradiquées, les effets de la vieillesse arrêtés, les naissances sont totalement contrôlées et les enfants se voient formater, très tôt, pour leur futur rôle social par l'hypnopédie.'''
  ),
  Media(
    nom: "Des souris et des hommes",
    categorie: "Livre",
    image: 'assets/imgs/des_souris_et_des_hommes.jpg',
    description: '''Ce roman, publié en 1937, raconte la vie de deux journaliers agricoles californiens : George et Lennie vont de ferme en ferme chercher du travail et ne restent jamais bien longtemps au même endroit parce que Lennie, un colosse dur au travail, est un peu simple d'esprit et a l'art de s'attirer des ennuis.'''
  ),
  Media(
    nom: "Bilbo le Hobbit",
    categorie: "Livre",
    image: 'assets/imgs/bilbo_le_hobbit.jpg',
    description: '''Bilbo, comme tous les hobbits, est un petit être paisible qui n'aime pas être dérangé quand il est à table. L'aventure lui tombe dessus comme la foudre, quand le magicien Gandalf et treize nains barbus viennent lui parler de trésor, d'expédition et du dragon Smaug... qu'il va affronter. Car Bilbo doit partir avec eux!'''
  ),
  Media(
    nom: "Fahrenheit 451",
    categorie: "Livre",
    image: 'assets/imgs/fahrenheit_451.png',
    description: '''Montag, le pompier pyromane, se met pourtant à rêver d'un monde différent, qui ne bannirait pas la littérature et l'imaginaire au profit d'un bonheur immédiatement consommable. Il devient dès lors un dangereux criminel, impitoyablement poursuivi par une société qui désavoue son passé.'''
  ),
  Media(
    nom: "Hypérion",
    categorie: "Livre",
    image: 'assets/imgs/hyperion.jpg',
    description: '''L'ouvrage Hypérion paraît aux États-Unis en 1989, suivi de La Chute d'Hypérion en 1990 ; Endymion paraît en 1996, puis L'éveil d'Endymion en 1997. La nouvelle Les orphelins de l'hélice est publiée après les quatre romans, auxquels elle fait suite.'''
  ),
  Media(
    nom: "Antigone",
    categorie: "Livre",
    image: 'assets/imgs/antigone.webp',
    description: '''Antigone est l'histoire tragique d'une jeune fille qui souhaite rendre hommage à son frère et qui mourra pour cela. 📜 "Antigone" est une tragédie de Sophocle qui se déroule à Thèbes. Œdipe, l'ancien roi, a maudit ses deux fils, Étéocle et Polynice, qui se sont entretués lors d'une guerre pour le trône.'''
  ),
  Media(
    nom: "Dracula",
    categorie: "Livre",
    image: 'assets/imgs/dracula.jpg',
    description: '''Dans les films produits par Universal Pictures puis par la Hammer, le comte Dracula (interprété par Bela Lugosi puis par Christopher Lee) est représenté comme un aristocrate dans la force de l'âge, grand et svelte, avec des traits fins, le teint pâle et les cheveux noirs.'''
  ),
  Media(
    nom: "La Constance du prédateur",
    categorie: "Livre",
    image: 'assets/imgs/la_constance_du_predateur.jpeg',
    description: '''La profiler Ludivine Vancker enquête dans une mine abandonnée du nord-est de la France, où des cadavres vieux de plusieurs dizaines d'années ont été découverts. Pourtant, l'ADN du meurtrier potentiel découvert sur place est identique à celui d'une affaire récente.'''
  ),
  Media(
    nom: "Le Signal",
    categorie: "Livre",
    image: 'assets/imgs/le_signal.jpeg',
    description: '''Paru le 24 octobre 2018, Le Signal de Maxime Chattam raconte l'histoire des Spencer, une famille new-yorkaise venue s'installer à Mahingan Falls. Ils pensent alors emménager dans une petite ville sans histoires, lorsqu'ils sont confrontés à des phénomènes de plus en plus étranges et inexplicables.'''
  ),
  Media(
    nom: "Prédateurs",
    categorie: "Livre",
    image: 'assets/imgs/predateurs.jpg',
    description: '''Miriam, une vampire âgée de trois mille ans, a offert l'immortalité à son compagnon. Mais il est frappé de vieillissement accéléré, et contacte la spécialiste Sarah Roberts pour enrayer le processus. Miriam tombe sous le charme de la jeune doctoresse.'''
  ),
  Media(
    nom: "Léviatemps",
    categorie: "Livre",
    image: 'assets/imgs/leviatemps.jpg',
    description: '''À trop désirer la mort, on y brûle son âme. Paris, 1900. Prisonnier de son succès, un écrivain décide de tout quitter pour entrer au plus profond de ses cauchemars, de ses abysses, explorer ce qu'il y a de pire en lui. Dans ce terreau de peurs se cache la matrice des monstres enfouis en chacun de nous.'''
  )
];