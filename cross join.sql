
CREATE TABLE suits (
    suit_id INT,
    suit_name VARCHAR(10)
);

CREATE TABLE ranks (
    rank_id INT,
    rank_name VARCHAR(5)
);

desc suits;
desc ranks;

INSERT INTO suits (suit_id, suit_name) VALUES
    (1, 'Hearts'),
    (2, 'Diamonds'),
    (3, 'Clubs'),
    (4, 'Spades');
    
INSERT INTO ranks (rank_id, rank_name) VALUES
    (1, 'Ace'),
    (2, '2'),
    (3, '3'),
    (4, '4'),
    (5, '5'),
    (6, '6'),
    (7, '7'),
    (8, '8'),
    (9, '9'),
    (10, '10'),
    (11, 'Jack'),
    (12, 'Queen'),
    (13, 'King');    

select s.suit_name,r.rank_name
from suits s
cross join 
ranks r;

