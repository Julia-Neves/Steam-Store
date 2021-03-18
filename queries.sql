 -- Jogos de ação dentre os 100 mais bem avaliados

SELECT rate.name, rate.positive_ratings, rate.required_age, rate.genres
FROM (
	SELECT name, required_age, positive_ratings, genres, release_date
	FROM game
    ORDER BY game.positive_ratings DESC
    LIMIT 100
) AS rate
HAVING 
	rate.genres IN ('Action')
ORDER BY rate.positive_ratings DESC;


 -- Jogos de ação lançados em 2019

SELECT recently.name, recently.genres, recently.positive_ratings
FROM (
	SELECT name, release_date, genres, positive_ratings
	FROM game WHERE YEAR(release_date) = 2019
	ORDER BY positive_ratings DESC
    LIMIT 100
) AS recently
HAVING 
	recently.genres IN ('Action')
ORDER BY positive_ratings DESC;


-- Quantidade de jogos de ação entre os jogos da loja

SELECT genres, count(genres)
FROM game
WHERE genres like "%action%"
GROUP BY genres


 -- Idade mínima para baixar os 5 primeiros jogos mais bem avaliados

SELECT required_age,name,positive_ratings
FROM game
GROUP BY required_age,name, positive_ratings
HAVING
required_age = 0
ORDER BY positive_ratings desc
limit 100; 


 -- Gênero do jogo com mais avaliações negativas

SELECT genres, count (negative_ratings)
FROM game group by genres
HAVING 
genres = 0
ORDER BY count(genres) desc
limit 1;


 -- Dentre os 10 jogos mais bem avaliados, quantos tem chat online?e quantos possuem anti-cheat?e quantos possuem ambos?

SELECT categories, name, positive_ratings
FROM game
WHERE categories in ("Multi-player" and "Valve Anti-Cheat enabled")
ORDER BY positive_ratings desc
limit 10;


 -- Quantos do top100 jogos mais bem avaliados não possuem restrição de idade?

SELECT rate.name, rate.positive_ratings, rate.required_age
FROM (
	SELECT name, required_age, positive_ratings, genres, release_date
	FROM game
    ORDER BY game.positive_ratings DESC
    LIMIT 100
) AS rate
HAVING rate.required_age = 0
ORDER BY rate.positive_ratings DESC;


