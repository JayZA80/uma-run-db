CREATE DATABASE uma_runs;

USE uma_runs;

CREATE TABLE player (
    player_id INT PRIMARY KEY
);

CREATE TABLE uma_musume (
    uma_id INT AUTO_INCREMENT PRIMARY KEY,
    uma_name VARCHAR(30) NOT NULL,
    star TINYINT DEFAULT 1 NOT NULL,
    speed INT NOT NULL,
    stamina INT NOT NULL,
    power INT NOT NULL,
    guts INT NOT NULL,
    wit INT NOT NULL,
    sprint_apt VARCHAR(1) NOT NULL,
    mile_apt VARCHAR(1) NOT NULL,
    medium_apt VARCHAR(1) NOT NULL,
    long_apt VARCHAR(1) NOT NULL,
    front_apt VARCHAR(1) NOT NULL,
    pace_apt VARCHAR(1) NOT NULL,
    late_apt VARCHAR(1) NOT NULL,
    end_apt VARCHAR(1) NOT NULL,
    turf_apt VARCHAR(1) NOT NULL,
    dirt_apt VARCHAR(1) NOT NULL,
    potential TINYINT DEFAULT 1 NOT NULL
);

CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(30) NOT NULL,
    skill_desc VARCHAR(255) NOT NULL
);

CREATE TABLE support_cards (
    support_id INT AUTO_INCREMENT PRIMARY KEY,
    support_name VARCHAR(100) NOT NULL,
    support_type VARCHAR(7) NOT NULL,
    rarity VARCHAR(3) DEFAULT 'R' NOT NULL,
    limit_break TINYINT DEFAULT 0 NOT NULL
);

CREATE TABLE deck (
    deck_id INT AUTO_INCREMENT PRIMARY KEY,
    support_1 INT NOT NULL,
    support_2 INT NOT NULL,
    support_3 INT NOT NULL,
    support_4 INT NOT NULL,
    support_5 INT NOT NULL,
    support_6 INT NOT NULL,
    FOREIGN KEY (support_1) REFERENCES support_cards(support_id),
    FOREIGN KEY (support_2) REFERENCES support_cards(support_id),
    FOREIGN KEY (support_3) REFERENCES support_cards(support_id),
    FOREIGN KEY (support_4) REFERENCES support_cards(support_id),
    FOREIGN KEY (support_5) REFERENCES support_cards(support_id),
    FOREIGN KEY (support_6) REFERENCES support_cards(support_id)
);

CREATE TABLE run (
    run_id INT AUTO_INCREMENT PRIMARY KEY,
    scenario varchar(30) DEFAULT 'URA Finale' NOT NULL,
    player_id INT NOT NULL,
    uma_id INT NOT NULL,
    deck_id INT NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT FALSE,
    speed_sparks INT NOT NULL DEFAULT 0,
    stamina_sparks INT NOT NULL DEFAULT 0,
    power_sparks INT NOT NULL DEFAULT 0,
    guts_sparks INT NOT NULL DEFAULT 0,
    wit_sparks INT NOT NULL DEFAULT 0,
    turf_sparks INT NOT NULL DEFAULT 0,
    dirt_sparks INT NOT NULL DEFAULT 0,
    sprint_sparks INT NOT NULL DEFAULT 0,
    mile_sparks INT NOT NULL DEFAULT 0,
    medium_sparks INT NOT NULL DEFAULT 0,
    long_sparks INT NOT NULL DEFAULT 0,
    front_sparks INT NOT NULL DEFAULT 0,
    pace_sparks INT NOT NULL DEFAULT 0,
    late_sparks INT NOT NULL DEFAULT 0,
    end_sparks INT NOT NULL DEFAULT 0,
    speed INT NOT NULL,
    stamina INT NOT NULL,
    power INT NOT NULL,
    guts INT NOT NULL,
    wit INT NOT NULL,
    uma_rank VARCHAR(4) NOT NULL,
    FOREIGN KEY (player_id) REFERENCES player(player_id),
    FOREIGN KEY (uma_id) REFERENCES uma_musume(uma_id),
    FOREIGN KEY (deck_id) REFERENCES deck(deck_id)
);

CREATE TABLE run_skills (
    skill_id INT NOT NULL,
    run_id INT NOT NULL,
    source VARCHAR(20) NOT NULL DEFAULT 'innate',
    PRIMARY KEY (run_id, skill_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id),
    FOREIGN KEY (run_id) REFERENCES run(run_id)
);
