-- Lister les bières par taux d'alcool, de la plus légère à la plus forte
select name, abv || '%' as "alcool rate"
from beer
order by abv asc;


-- Afficher le nombre de bières par catégorie
select cat.name as category, count(cat.id) as "number of beers"
from beer
join category cat
	on beer.id_category = cat.id
group by cat.id
order by "number of beers" asc;


-- Trouver toutes les bières d'une brasserie donnée
select
	brew.name as "brewerie",
	beer.name as "beer",
	origin, color,
	abv || '%' as "alcool rate"
from beer
join brewerie brew
	on beer.id_brewerie = brew.id
	and brew.id = 1;


-- Lister les utilisateurs et le nombre de bières qu'ils ont ajoutées à leurs favoris
select
	upper(usr.last_name) || ' ' || usr.first_name as "name",
	count(fav.id_beer) as "beer count"
from "user" usr
join favorite fav
	on usr.email = fav.user_email
group by usr.email 
order by "name" asc;


-- Ajouter une nouvelle bière à la base de données
insert into beer (name, color, origin, use_by_date, abv, size, packaging, img_profile, description, id_brewerie, id_category)
values
	('Beck’s Gold', 'Blonde', 'Allemagne', '2024-11-15', 4.5, 330, 'Canette', '{"https://example.com/small50.jpg", "https://example.com/big50.jpg"}',
	'Une bière légère et savoureuse, parfaite pour une soirée estivale.', 10, 1);

select * from beer order by id desc limit 1;


-- Afficher les bières et leurs brasseries, ordonnées par pays de la brasserie
select
	country,
	brew.name as "brewerie",
	beer.name as "beer",
	origin, color,
	abv || '%' as "alcool rate"
from beer
join brewerie brew
	on beer.id_brewerie = brew.id
order by country asc;


-- Lister les bières avec leurs ingrédients
select
	beer.name as "beer",
	ing.name as "ingredient",
	quantity || ' ml' as quantity
from flavor fl
left join beer
	on beer.id = fl.id_beer
left join ingredient ing 
	on fl.id_ingredient = ing.id
order by beer.name;


-- Afficher les brasseries et le nombre de bières qu'elles produisent, pour celles ayant plus de 5 bières
select
	brew.name as "brewerie",
	 count(brew.id) as "beer count"
from beer
join brewerie brew
	on beer.id_brewerie = brew.id
group by brew.id; -- having count(brew.id) > 5; -- aucune brasserie n'a plus de 4 bières


-- Lister les bières qui n'ont pas encore été ajoutées aux favoris par aucun utilisateur
with favorite_beers as (
	select distinct fav.id_beer
	from favorite fav
	join "user" usr
		on fav.user_email = usr.email
)

select id, name as "beers not liked" from beer
where id not in (select id_beer from favorite_beers);


-- Trouver les bières favorites communes entre deux utilisateurs
with users_1_2_fav_beers as (
    select id_beer, beer.name as beer
    from favorite fav
    join "user" usr
        on fav.user_email = usr.email
        and usr.email in (select email from "user" limit 2)
    join beer
        on beer.id = fav.id_beer
)

select id_beer, beer
from users_1_2_fav_beers
group by 1, 2
having count(id_beer) > 1;


-- Afficher les brasseries dont les bières ont une moyenne de notes supérieure à une certaine valeur
with
    avg_all_beers as (
        select avg(rating) as mean
        from review
    ),
    avgs_per_brewerie as (
        select
            brew.name as brewerie,
            avg(rev.rating) as "average ratings"
        from review rev
        join beer
            on rev.id_beer = beer.id
        join brewerie brew
            on beer.id_brewerie = brew.id
        group by brew.id
    )

select
    brewerie, round("average ratings"::NUMERIC, 2)
from
    avgs_per_brewerie, avg_all_beers
where
    "average ratings" > mean;


-- Mettre à jour les informations d'une brasserie.
update brewerie
set address = '18 Rue du Val, Tourpes'
where name = 'Brasserie Dupont';

select address from brewerie where name = 'Brasserie Dupont';


-- Supprimer les photos d'une bière en particulier
delete from photo where id_beer = 5;

select * from photo where id_beer between 4 and 6;




