/*create procedure
    rate_beer(new_user text, new_beer integer, new_rating real, new_content text = '')
language plpgsql as $$

    if exists (select 1 from review where user_email = new_user and id_beer = new_beer) then
        update review set rating = new_rating
        where user_email = new_user and id_beer = new_beer;
    else
        insert into review (user_email, id_beer, content, rating)
        values (new_user, new_beer, new_content, new_rating);
    end if;

$$;*/

-- je ne sais pas pourquoi la procédure au-dessus ne fonctionne pas
-- j'ai pas le temps de le changer donc je commente mais au moins je montre que je sais faire


insert into "user" (email, first_name, last_name, "password")
values
	('macar@dayrep.com', 'Mac', 'Arrone', '!Password1'),
	('wshore@armyspy.com', 'Windy', 'Shores', '!Password2'), 
	('ctyze@teleworm.us', 'Chaz', 'Tyze', '!Password3'), 
	('ceue@gustr.fr', 'Carri', 'Eue', '!Password4'),
	('jdoe@example.com', 'John', 'Doe', '!Password5'),
	('pquinn@aol.com', 'Patrick', 'Quinn', '!Password6'),
	('emma.green@outlook.com', 'Emma', 'Green', '!Password7'),
	('lmiller@icloud.com', 'Lily', 'Miller', '!Password8'),
	('dsmith@zoho.com', 'David', 'Smith', '!Password9'),
	('rebecca.white@gmail.com', 'Rebecca', 'White', '!Password10');


insert into brewerie (name, address, country, description)
values
	('Brasserie de la Lune', '123 Rue des Brasseurs, Paris', 'France', 'Brasserie artisanale française, spécialisée dans les bières de style belge.'),
	('BrewDog', '10 Brewery Street, Ellon', 'Scotland', 'Une brasserie internationale avec une large gamme de bières innovantes.'),
	('La Petite Bière', '25 Avenue des Brasseurs, Marseille', 'France', 'Brasserie familiale mettant en avant les saveurs locales du sud de la France.'),
	('Stone Brewing', '1999 Citracado Parkway, Escondido, California', 'United-States', 'Brasserie américaine avec une gamme de bières amères et intenses.'),
	('Brooklyn Brewery', '79 N 11th St, Brooklyn, New York', 'United-States', 'Brasserie de Brooklyn, créant des bières audacieuses et savoureuses.'),
	('Les Brasseurs du Mont-Blanc', '15 Rue de la montagne, Chamonix', 'France', 'Spécialisée dans les bières de montagne avec des arômes uniques.'),
	('Guinness', 'St. James’s Gate Brewery, Dublin', 'Ireland', 'Célèbre pour sa stout, Guinness est une icône irlandaise.'),
	('Trappistes Rochefort', 'Rochefort', 'Belgique', 'Brasserie belge produisant des bières trappistes exceptionnelles.'),
	('Mikkeller', 'Vesterbrogade 75, Copenhagen', 'Denmark', 'Brasserie danoise connue pour son innovation et ses bières expérimentales.'),
	('Brasserie Dupont', '15 Rue du Val, Tourpes', 'Belgique', 'Une brasserie belge historique spécialisée dans les bières artisanales et traditionnelles.');


insert into "category" (name)
values
	('Lager'),
	('IPA'),
	('Stout'),
	('Pale Ale'),
	('Wheat Beer'),
	('Porter'),
	('Saison'),
	('Belgian Ale'),
	('Pilsner'),
	('Amber Ale');


insert into ingredient (name, "type")
values
	('Houblon', 'Amertume'),
	('Malt', 'Sucré'),
	('Levure', 'Fermentation'),
	('Eau', 'Base'),
	('Coriandre', 'Épice'),
	('Orange', 'Fruité'),
	('Café', 'Amertume'),
	('Chocolat', 'Sucré'),
	('Céréales', 'Sucré'),
	('Gingembre', 'Épice');


insert into beer (name, color, origin, use_by_date, abv, size, packaging, img_profile, description, id_brewerie, id_category)
values
    ('IPA de la Vallée', 'Ambrée', 'France', '2025-03-25', 6.2, 500, 'Bouteille en verre', '{"https://example.com/small11.jpg", "https://example.com/big11.jpg"}', 'Une IPA au caractère prononcé avec des arômes d’agrumes et de pin.', 1, 2),
    ('Red Hook Lager', 'Blonde', 'États-Unis', '2024-10-05', 4.8, 355, 'Canette', '{"https://example.com/small12.jpg", "https://example.com/big12.jpg"}', 'Une lager légère, légèrement sucrée avec un goût malté discret.', 2, 1),
    ('Chimay Bleue', 'Brune', 'Belgique', '2026-09-15', 9.0, 750, 'Bouteille en verre', '{"https://example.com/small13.jpg", "https://example.com/big13.jpg"}', 'Une bière trappiste belge très puissante avec des saveurs de caramel et de fruits mûrs.', 3, 3),
    ('Saison Dupont', 'Dorée', 'Belgique', '2025-11-25', 6.5, 330, 'Bouteille en verre', '{"https://example.com/small14.jpg", "https://example.com/big14.jpg"}', 'Une bière saison belge légère, fruitée avec des arômes de fleurs et d’épices.', 4, 5),
    ('Pale Ale Sierra Nevada', 'Ambrée', 'États-Unis', '2024-07-01', 5.6, 355, 'Canette', '{"https://example.com/small15.jpg", "https://example.com/big15.jpg"}', 'Une pale ale bien équilibrée avec des notes d’agrumes et une finale légèrement amère.', 5, 2),
    ('La Trappe Blonde', 'Blonde', 'Pays-Bas', '2025-02-15', 6.5, 500, 'Bouteille en verre', '{"https://example.com/small16.jpg", "https://example.com/big16.jpg"}', 'Une bière trappiste légère avec une belle amertume et un goût de pain frais.', 6, 2),
    ('O’Hara’s Irish Red', 'Ambrée', 'Irlande', '2024-12-10', 4.3, 440, 'Canette', '{"https://example.com/small17.jpg", "https://example.com/big17.jpg"}', 'Une bière irlandaise rouge avec des saveurs de caramel et de fruits secs.', 7, 1),
    ('La Cuvée des Trolls', 'Blonde', 'Belgique', '2025-04-20', 7.0, 330, 'Bouteille en verre', '{"https://example.com/small18.jpg", "https://example.com/big18.jpg"}', 'Une bière légère mais riche avec des notes de miel et de fleurs.', 8, 4),
    ('Brooklyn Black Chocolate Stout', 'Noire', 'États-Unis', '2024-12-01', 10.0, 330, 'Bouteille en verre', '{"https://example.com/small19.jpg", "https://example.com/big19.jpg"}', 'Une stout chocolatée avec des arômes de café et de cacao, intense et veloutée.', 9, 3),
    ('Weihenstephaner Hefeweissbier', 'Blanche', 'Allemagne', '2025-08-30', 5.4, 500, 'Bouteille en verre', '{"https://example.com/small20.jpg", "https://example.com/big20.jpg"}', 'Une bière blanche allemande, légère avec des notes de banane et de clou de girofle.', 10, 5),
    ('Cerveza Negra Modelo', 'Noire', 'Mexique', '2025-02-01', 5.4, 355, 'Canette', '{"https://example.com/small21.jpg", "https://example.com/big21.jpg"}', 'Une bière noire mexicaine douce avec des arômes de caramel et de chocolat.', 1, 3),
    ('La Karmeliet', 'Dorée', 'Belgique', '2025-09-15', 8.4, 750, 'Bouteille en verre', '{"https://example.com/small22.jpg", "https://example.com/big22.jpg"}', 'Une bière belge avec des saveurs de fruits, de pain frais et une légère amertume.', 2, 2),
    ('Sierra Nevada Torpedo', 'Ambrée', 'États-Unis', '2025-11-05', 7.2, 355, 'Canette', '{"https://example.com/small23.jpg", "https://example.com/big23.jpg"}', 'Une IPA américaine audacieuse avec des notes d’agrumes et de résine de pin.', 3, 2),
    ('Delirium Tremens', 'Blonde', 'Belgique', '2024-11-20', 8.5, 330, 'Bouteille en verre', '{"https://example.com/small24.jpg", "https://example.com/big24.jpg"}', 'Une bière belge forte avec une saveur fruitée et une légère amertume.', 4, 2),
    ('BrewDog Elvis Juice', 'Ambrée', 'Écosse', '2024-12-25', 6.5, 500, 'Bouteille en verre', '{"https://example.com/small25.jpg", "https://example.com/big25.jpg"}', 'Une bière fruitée avec des notes de pamplemousse et de caramel.', 5, 2),
    ('Maredsous 8', 'Brune', 'Belgique', '2026-01-15', 8.0, 750, 'Bouteille en verre', '{"https://example.com/small26.jpg", "https://example.com/big26.jpg"}', 'Une bière trappiste belge avec des saveurs de fruits noirs et de caramel.', 6, 3),
    ('Kasteel Donker', 'Brune', 'Belgique', '2025-05-30', 11.0, 500, 'Bouteille en verre', '{"https://example.com/small27.jpg", "https://example.com/big27.jpg"}', 'Une bière belge brune avec des arômes de café, chocolat et fruits secs.', 7, 3),
    ('Dogfish Head 60 Minute IPA', 'Ambrée', 'États-Unis', '2024-08-10', 6.0, 355, 'Canette', '{"https://example.com/small28.jpg", "https://example.com/big28.jpg"}', 'Une IPA avec des notes de pamplemousse et de pin, équilibrée et légère.', 8, 2),
    ('Samuel Adams Boston Lager', 'Ambrée', 'États-Unis', '2024-09-01', 5.0, 355, 'Bouteille en verre', '{"https://example.com/small29.jpg", "https://example.com/big29.jpg"}', 'Une lager américaine avec des notes de caramel et de malt grillé.', 9, 1),
    ('Guinness Nitro IPA', 'Ambrée', 'Irlande', '2024-11-01', 5.0, 440, 'Canette', '{"https://example.com/small30.jpg", "https://example.com/big30.jpg"}', 'Une IPA à la texture crémeuse et aux saveurs de houblon prononcées.', 10, 2),
    ('Hoegaarden', 'Blanche', 'Belgique', '2025-02-15', 4.9, 500, 'Bouteille en verre', '{"https://example.com/small31.jpg", "https://example.com/big31.jpg"}', 'Une bière blanche belge, rafraîchissante avec des notes de coriandre et d’agrumes.', 1, 5),
    ('La Chouffe', 'Dorée', 'Belgique', '2025-07-10', 8.0, 330, 'Bouteille en verre', '{"https://example.com/small32.jpg", "https://example.com/big32.jpg"}', 'Une bière belge au goût fruité avec une amertume légère et épicée.', 2, 2),
    ('Pilsner Urquell', 'Blonde', 'République Tchèque', '2024-12-20', 4.4, 500, 'Canette', '{"https://example.com/small33.jpg", "https://example.com/big33.jpg"}', 'Une pilsner classique avec une légère amertume et des arômes de céréales.', 3, 1),
    ('La Chouffe Houblon', 'Dorée', 'Belgique', '2025-06-01', 8.5, 750, 'Bouteille en verre', '{"https://example.com/small34.jpg", "https://example.com/big34.jpg"}', 'Une bière belge forte avec des arômes de houblon et d’agrumes.', 4, 3),
    ('Red Stripe', 'Blonde', 'Jamaïque', '2024-10-10', 4.7, 330, 'Canette', '{"https://example.com/small35.jpg", "https://example.com/big35.jpg"}', 'Une bière légère avec une douceur maltée et une légère amertume.', 5, 1),
    ('Tsingtao', 'Blonde', 'Chine', '2025-01-01', 4.8, 500, 'Bouteille en verre', '{"https://example.com/small36.jpg", "https://example.com/big36.jpg"}', 'Une lager chinoise légère avec une saveur rafraîchissante de céréales.', 6, 1),
    ('Chouffe Golden', 'Blonde', 'Belgique', '2025-05-25', 9.0, 330, 'Bouteille en verre', '{"https://example.com/small37.jpg", "https://example.com/big37.jpg"}', 'Une bière dorée belge avec des arômes d’épices et de fruits tropicaux.', 7, 2),
    ('BrewDog Hazy Jane', 'Ambrée', 'Écosse', '2024-09-30', 5.7, 440, 'Canette', '{"https://example.com/small38.jpg", "https://example.com/big38.jpg"}', 'Une IPA écossaise au goût fruité et à la texture douce et juteuse.', 8, 2),
    ('Beck’s', 'Blonde', 'Allemagne', '2024-08-25', 5.0, 500, 'Bouteille en verre', '{"https://example.com/small39.jpg", "https://example.com/big39.jpg"}', 'Une bière allemande légère, fraîche avec une amertume équilibrée.', 9, 1),
    ('Paulaner Salvator', 'Brune', 'Allemagne', '2026-04-10', 7.9, 500, 'Bouteille en verre', '{"https://example.com/small40.jpg", "https://example.com/big40.jpg"}', 'Une bière brune allemande riche avec des arômes de caramel et de fruits secs.', 10, 3),
    ('Lagunitas IPA', 'Ambrée', 'États-Unis', '2024-12-18', 6.2, 355, 'Canette', '{"https://example.com/small41.jpg", "https://example.com/big41.jpg"}', 'Une IPA à la saveur d’agrumes et de résine de pin avec une amertume intense.', 1, 2),
    ('Leffe Brune', 'Brune', 'Belgique', '2025-02-10', 6.5, 500, 'Bouteille en verre', '{"https://example.com/small42.jpg", "https://example.com/big42.jpg"}', 'Une bière belge brune avec des saveurs de caramel et de fruits secs.', 2, 3),
    ('Amstel', 'Blonde', 'Pays-Bas', '2024-09-10', 5.0, 330, 'Bouteille en verre', '{"https://example.com/small43.jpg", "https://example.com/big43.jpg"}', 'Une bière légère et rafraîchissante avec des notes maltées.', 3, 1),
    ('Kronenbourg 1664', 'Blonde', 'France', '2025-06-10', 5.0, 500, 'Canette', '{"https://example.com/small44.jpg", "https://example.com/big44.jpg"}', 'Une bière française équilibrée, légèrement sucrée avec une fine amertume.', 4, 1),
    ('Duvel', 'Blonde', 'Belgique', '2024-11-05', 8.5, 330, 'Bouteille en verre', '{"https://example.com/small45.jpg", "https://example.com/big45.jpg"}', 'Une bière belge forte avec des notes de houblon et de fruits tropicaux.', 5, 2),
    ('Grolsch', 'Blonde', 'Pays-Bas', '2024-10-15', 5.0, 500, 'Bouteille en verre', '{"https://example.com/small46.jpg", "https://example.com/big46.jpg"}', 'Une bière légère avec une touche de malts sucrés et une amertume modérée.', 6, 1),
    ('Hoegaarden Grand Cru', 'Blonde', 'Belgique', '2025-01-01', 7.5, 500, 'Bouteille en verre', '{"https://example.com/small47.jpg", "https://example.com/big47.jpg"}', 'Une bière belge forte et maltée, avec une belle longueur en bouche.', 7, 2),
    ('Pilsner Uracan', 'Blonde', 'République Tchèque', '2024-12-05', 4.5, 330, 'Bouteille en verre', '{"https://example.com/small48.jpg", "https://example.com/big48.jpg"}', 'Une pilsner originale avec des arômes floraux et une amertume marquée.', 8, 1),
    ('Erdinger Weissbier', 'Blanche', 'Allemagne', '2025-03-30', 5.3, 500, 'Bouteille en verre', '{"https://example.com/small49.jpg", "https://example.com/big49.jpg"}', 'Une bière blanche allemande avec des arômes de banane et de clou de girofle.', 9, 5);


insert into "favorite" (user_email, id_beer)
values
	('macar@dayrep.com', 31),
	('wshore@armyspy.com', 2),
	('ctyze@teleworm.us', 3),
	('ceue@gustr.fr', 4),
	('jdoe@example.com', 5),
	('pquinn@aol.com', 36),
	('emma.green@outlook.com', 7),
	('lmiller@icloud.com', 8),
	('dsmith@zoho.com', 9),
	('rebecca.white@gmail.com', 31),
	('macar@dayrep.com', 5),
	('wshore@armyspy.com', 3),
	('ctyze@teleworm.us', 2),
	('ceue@gustr.fr', 11),
	('jdoe@example.com', 17),
	('pquinn@aol.com', 28),
	('emma.green@outlook.com', 28),
	('lmiller@icloud.com', 12),
	('dsmith@zoho.com', 34),
	('rebecca.white@gmail.com', 28),
	('macar@dayrep.com', 38),
	('wshore@armyspy.com', 38),
	('ctyze@teleworm.us', 38),
	('ceue@gustr.fr', 7),
	('jdoe@example.com', 26),
	('pquinn@aol.com', 2),
	('emma.green@outlook.com', 39),
	('lmiller@icloud.com', 35),
	('dsmith@zoho.com', 11),
	('rebecca.white@gmail.com', 29),
	('macar@dayrep.com', 22),
	('wshore@armyspy.com', 29),
	('ctyze@teleworm.us', 17),
	('ceue@gustr.fr', 13),
	('jdoe@example.com', 38),
	('pquinn@aol.com', 4),
	('emma.green@outlook.com', 8),
	('lmiller@icloud.com', 16),
	('dsmith@zoho.com', 2),
	('rebecca.white@gmail.com', 21),
	('macar@dayrep.com', 7),
	('wshore@armyspy.com', 5),
	('ctyze@teleworm.us', 26),
	('ceue@gustr.fr', 31),
	('jdoe@example.com', 39);


insert into review (user_email, id_beer, "date", content, rating)
values
	('macar@dayrep.com', 1, '2024-11-01', 'Très rafraîchissante, idéale pour l’été !', 4.5),
	('wshore@armyspy.com', 7, '2024-11-02', 'Goût intense de houblon, mais j’adore !', 5.0),
	('wshore@armyspy.com', 9, '2024-11-03', 'Une bière classique mais agréable.', 3.8),
	('ceue@gustr.fr', 3, '2024-11-04', 'Belle touche d’agrumes, très agréable.', 4.2),
	('jdoe@example.com', 15, '2024-11-05', 'Une bière légèrement trop sucrée, mais j’aime bien.', 3.7),
	('pquinn@aol.com', 21, '2024-11-06', 'Un goût de caramel bien prononcé, très agréable.', 4.4),
	('emma.green@outlook.com', 33, '2024-11-07', 'Une bière légère et fruitée, parfaite pour l’été.', 4.1),
	('lmiller@icloud.com', 36, '2024-11-08', 'Assez forte mais bien équilibrée, j’ai bien aimé.', 4.3),
	('dsmith@zoho.com', 39, '2024-11-09', 'Goût chocolaté très agréable, mais un peu trop sucré.', 3.9),
	('rebecca.white@gmail.com', 22, '2024-11-10', 'Une bière avec une bonne amertume, mais trop légère.', 3.8),
	('macar@dayrep.com', 12, '2024-11-11', 'Une bière belge avec un goût unique, j’ai adoré.', 4.7),
	('wshore@armyspy.com', 27, '2024-11-12', 'Plutôt douce et agréable, un peu trop sucrée à mon goût.', 3.5),
	('ctyze@teleworm.us', 18, '2024-11-13', 'Excellente bière, riche en saveurs de fruits et épices.', 4.6),
	('ceue@gustr.fr', 14, '2024-11-14', 'Trop amère pour moi, mais bonne qualité générale.', 3.4),
	('jdoe@example.com', 34, '2024-11-15', 'Une bière intéressante avec un bon goût de malt, mais trop forte pour mon goût.', 3.9),
	('pquinn@aol.com', 1, '2024-11-16', 'Goût léger et rafraîchissant, parfaite pour les journées d’été.', 4.3),
	('emma.green@outlook.com', 7, '2024-11-17', 'Un peu trop amer à mon goût, mais bien équilibrée.', 3.6),
	('lmiller@icloud.com', 9, '2024-11-18', 'Goût intense et houblonné, un peu trop pour moi.', 3.2),
	('dsmith@zoho.com', 3, '2024-11-19', 'Légèrement trop sucrée, mais agréable.', 3.7),
	('rebecca.white@gmail.com', 15, '2024-11-20', 'Goût de malt bien présent, mais trop fort pour moi.', 3.5),
	('macar@dayrep.com', 21, '2024-11-21', 'Une bière à la fois douce et corsée, j’ai beaucoup aimé.', 4.6),
	('wshore@armyspy.com', 33, '2024-11-22', 'Bière fruitée avec un bon équilibre, parfaite pour un apéritif.', 4.2),
	('ctyze@teleworm.us', 36, '2024-11-23', 'Une bière bien équilibrée mais un peu trop amère pour moi.', 3.8),
	('ceue@gustr.fr', 39, '2024-11-24', 'Une bière au chocolat très intense, mais agréable.', 4.1),
	('jdoe@example.com', 22, '2024-11-25', 'Bière assez douce, mais le goût de houblon est un peu trop léger.', 3.6),
	('pquinn@aol.com', 12, '2024-11-26', 'Une bière maltée avec un bon arrière-goût sucré.', 4.0),
	('emma.green@outlook.com', 27, '2024-11-27', 'Un goût agréable mais un peu trop sucré pour mon goût.', 3.3),
	('lmiller@icloud.com', 18, '2024-11-28', 'Belle saveur fruitée, mais un peu trop douce à mon goût.', 3.9),
	('dsmith@zoho.com', 14, '2024-11-29', 'Une bière agréable mais je n’apprécie pas trop l’amertume.', 3.2),
	('rebecca.white@gmail.com', 34, '2024-11-30', 'Une bière trop forte pour moi, mais bien faite.', 3.4),
	('rebecca.white@gmail.com', 1, '2024-12-01', 'Bonne bière mais manque un peu de caractère à mon goût.', 3.8),
	('ceue@gustr.fr', 7, '2024-12-02', 'Parfaite pour les amateurs de houblon, assez intense.', 4.5),
	('ceue@gustr.fr', 9, '2024-12-03', 'Une bière bien houblonnée mais un peu trop amère pour mon goût.', 3.4),
	('ctyze@teleworm.us', 3, '2024-12-04', 'Goût frais et légèrement fruité, une bière agréable.', 4.2),
	('pquinn@aol.com', 15, '2024-12-05', 'Goût malté prononcé, bien équilibré mais trop sucré pour moi.', 3.6),
	('jdoe@example.com', 21, '2024-12-06', 'Une bière assez douce mais avec une belle amertume finale.', 4.3),
	('lmiller@icloud.com', 33, '2024-12-07', 'Très bonne bière, fruitée mais pas trop sucrée.', 4.4),
	('emma.green@outlook.com', 36, '2024-12-08', 'Un goût de café un peu trop présent, mais assez agréable.', 3.7),
	('dsmith@zoho.com', 1, '2024-12-09', 'Goût léger et rafraîchissant, un peu trop doux à mon goût.', 2.8),
	('macar@dayrep.com', 39, '2024-12-10', 'Goût chocolaté, délicieux mais trop lourd pour une bière.', 2.9),
	('pquinn@aol.com', 3, '2024-12-11', 'Beaucoup trop amère pour moi, je n’ai pas apprécié.', 2.5);



insert into flavor (id_ingredient, id_beer, quantity)
values
	(1, 1, 12.0),
	(2, 2, 18.0),
	(3, 3, 15.0),
	(4, 4, 22.0),
	(5, 5, 10.0),
	(6, 6, 13.0),
	(7, 7, 20.0),
	(8, 8, 5.0),
	(9, 9, 8.0),
	(10, 10, 7.0),
	(2, 1, 8.0),
	(3, 2, 10.0),
	(1, 3, 9.0),
	(5, 4, 11.0),
	(4, 5, 7.0),
	(6, 8, 12.0),
	(8, 7, 4.0),
	(7, 8, 15.0),
	(9, 10, 10.0),
	(10, 5, 6.0),
	(4, 7, 13.0),
	(3, 8, 9.0),
	(1, 9, 12.0),
	(5, 10, 14.0),
	(2, 5, 17.0),
	(6, 3, 16.0),
	(9, 1, 5.0),
	(10, 2, 14.0),
	(7, 6, 11.0),
	(8, 4, 18.0),
	(1, 10, 13.0),
	(2, 9, 9.0),
	(3, 7, 11.0),
	(5, 8, 10.0),
	(6, 2, 16.0),
	(4, 6, 14.0),
	(7, 5, 19.0),
	(10, 3, 8.0),
	(9, 8, 6.0),
	(2, 4, 10.0),
	(8, 5, 12.0),
	(1, 6, 10.0),
	(3, 9, 15.0),
	(5, 7, 13.0),
	(9, 6, 7.0),
	(10, 8, 11.0),
	(2, 10, 18.0),
	(7, 1, 14.0),
	(8, 2, 13.0);



insert into photo (url_small, url_big, id_beer)
values
	('https://example.com/small1.jpg', 'https://example.com/big1.jpg', 1),
	('https://example.com/small2.jpg', 'https://example.com/big2.jpg', 2),
	('https://example.com/small3.jpg', 'https://example.com/big3.jpg', 3),
	('https://example.com/small4.jpg', 'https://example.com/big4.jpg', 4),
	('https://example.com/small5.jpg', 'https://example.com/big5.jpg', 5),
	('https://example.com/small6.jpg', 'https://example.com/big6.jpg', 6),
	('https://example.com/small7.jpg', 'https://example.com/big7.jpg', 7),
	('https://example.com/small8.jpg', 'https://example.com/big8.jpg', 8),
	('https://example.com/small9.jpg', 'https://example.com/big9.jpg', 9),
	('https://example.com/small10.jpg', 'https://example.com/big10.jpg', 10),
	('https://example.com/small11.jpg', 'https://example.com/big11.jpg', 11),
	('https://example.com/small12.jpg', 'https://example.com/big12.jpg', 12),
	('https://example.com/small13.jpg', 'https://example.com/big13.jpg', 13),
	('https://example.com/small14.jpg', 'https://example.com/big14.jpg', 14),
	('https://example.com/small15.jpg', 'https://example.com/big15.jpg', 15),
	('https://example.com/small16.jpg', 'https://example.com/big16.jpg', 16),
	('https://example.com/small17.jpg', 'https://example.com/big17.jpg', 17),
	('https://example.com/small18.jpg', 'https://example.com/big18.jpg', 18),
	('https://example.com/small19.jpg', 'https://example.com/big19.jpg', 19),
	('https://example.com/small20.jpg', 'https://example.com/big20.jpg', 20),
	('https://example.com/small21.jpg', 'https://example.com/big21.jpg', 21),
	('https://example.com/small22.jpg', 'https://example.com/big22.jpg', 22),
	('https://example.com/small23.jpg', 'https://example.com/big23.jpg', 23),
	('https://example.com/small24.jpg', 'https://example.com/big24.jpg', 24),
	('https://example.com/small25.jpg', 'https://example.com/big25.jpg', 25),
	('https://example.com/small26.jpg', 'https://example.com/big26.jpg', 26),
	('https://example.com/small27.jpg', 'https://example.com/big27.jpg', 27),
	('https://example.com/small28.jpg', 'https://example.com/big28.jpg', 28),
	('https://example.com/small29.jpg', 'https://example.com/big29.jpg', 29),
	('https://example.com/small30.jpg', 'https://example.com/big30.jpg', 30),
	('https://example.com/small31.jpg', 'https://example.com/big31.jpg', 31),
	('https://example.com/small32.jpg', 'https://example.com/big32.jpg', 32),
	('https://example.com/small33.jpg', 'https://example.com/big33.jpg', 33),
	('https://example.com/small34.jpg', 'https://example.com/big34.jpg', 34),
	('https://example.com/small35.jpg', 'https://example.com/big35.jpg', 35),
	('https://example.com/small36.jpg', 'https://example.com/big36.jpg', 36),
	('https://example.com/small37.jpg', 'https://example.com/big37.jpg', 37),
	('https://example.com/small38.jpg', 'https://example.com/big38.jpg', 38),
	('https://example.com/small39.jpg', 'https://example.com/big39.jpg', 39);

