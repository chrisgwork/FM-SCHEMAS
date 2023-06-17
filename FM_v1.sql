-- drop and create database to refresh environment ---------------------------------------------------------------------
DROP DATABASE IF EXISTS film_manager;
CREATE DATABASE IF NOT EXISTS film_manager;
USE film_manager;

-- create table --------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS actor (
	actor_id   INT         NOT NULL,
	full_name  VARCHAR(50) NOT NULL,
	birth_date DATE
);

CREATE TABLE IF NOT EXISTS director (
	director_id INT 	    NOT NULL,
	full_name   VARCHAR(50) NOT NULL,
	birth_date  DATE
);

CREATE TABLE IF NOT EXISTS film (
	film_id   INT 	      NOT NULL,
	full_name VARCHAR(50) NOT NULL,
	release_date YEAR
);

CREATE TABLE IF NOT EXISTS film_actor_mapping (
	film_actor_mapping_id INT NOT NULL,
  	actor_id 		      INT NOT NULL,
	film_id 		      INT NOT NULL
);

CREATE TABLE IF NOT EXISTS film_director_mapping (
	film_director_mapping_id INT NOT NULL,
  	director_id              INT NOT NULL,
	film_id                  INT NOT NULL
);

CREATE TABLE IF NOT EXISTS film_genre_mapping (
	film_genre_mapping_id INT NOT NULL,
	film_id               INT NOT NULL,
	genre_id              INT NOT NULL
);

CREATE TABLE IF NOT EXISTS film_last_viewed (
	film_last_viewed_id INT       NOT NULL,
	film_last_viewed_on TIMESTAMP NOT NULL,
	film_id             INT       NOT NULL,
	reviewer_id         INT       NOT NULL
);

CREATE TABLE IF NOT EXISTS film_owned_status_mapping (
	film_owned_status_mapping_id  INT NOT NULL,
	film_owned_status_mapping_ind INT NOT NULL,
	film_id                       INT NOT NULL,
	house_hold_id                 INT NOT NULL
);

CREATE TABLE IF NOT EXISTS film_rating (
	film_rating_id         INT           NOT NULL,
	description			   VARCHAR(255),
	reviewer_id            INT           NOT NULL,
	film_rating_verdict_id INT           NOT NULL
);

CREATE TABLE IF NOT EXISTS film_rating_mapping (
	film_rating_mapping_id INT       NOT NULL,
	film_reviewed_on       TIMESTAMP NOT NULL,
	film_id                INT       NOT NULL,
	film_rating_id         INT       NOT NULL,
	film_rating_status_id  INT       NOT NULL
);

-- statuses: ACTIVE, INACTIVE
CREATE TABLE IF NOT EXISTS film_rating_status (
	film_rating_status_id INT          NOT NULL,
	code 		      VARCHAR(255) NOT NULL
);

-- verdicts: FAVOURITE, EXCELLENT, GOOD, OKAY, BLEH, BAD, DREADFUL, BAD_IT_GOOD
CREATE TABLE IF NOT EXISTS film_rating_verdict (
	film_rating_verdict_id INT         NOT NULL,
	code 		       VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre (
	genre_id  INT            NOT NULL,
	code	  VARCHAR(20)    NOT NULL,
	description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS genre_sub_type (
	genre_sub_type_id  INT            NOT NULL,
	code	  	       VARCHAR(20)    NOT NULL,
	description 	   VARCHAR(255),
	genre_id  		   INT            NOT NULL
);

CREATE TABLE IF NOT EXISTS house_hold (
	house_hold_id INT         NOT NULL,
	full_name     VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS rev_hous_memshp_mapp (
	rev_hous_memshp_mapp_id INT NOT NULL,
	house_hold_id           INT NOT NULL
);

CREATE TABLE IF NOT EXISTS reviewer (
	reviewer_id INT         NOT NULL,
	full_name   VARCHAR(50) NOT NULL,
	birth_date  DATE
);

CREATE TABLE IF NOT EXISTS reviewer_house_membership (
	reviewer_house_membership_id INT NOT NULL,
	rev_hous_memshp_mapp_id      INT NOT NULL,
	reviewer_id                  INT NOT NULL
);

-- set primary key -----------------------------------------------------------------------------------------------------
ALTER TABLE actor                      ADD CONSTRAINT pk_actor_id                     PRIMARY KEY (actor_id);
ALTER TABLE director                   ADD CONSTRAINT pk_director_id                  PRIMARY KEY (director_id);
ALTER TABLE film                       ADD CONSTRAINT pk_film_id                      PRIMARY KEY (film_id);
ALTER TABLE film_actor_mapping         ADD CONSTRAINT pk_film_actor_mapping_id        PRIMARY KEY (film_actor_mapping_id);
ALTER TABLE film_director_mapping      ADD CONSTRAINT pk_film_director_mapping_id     PRIMARY KEY (film_director_mapping_id);
ALTER TABLE film_genre_mapping         ADD CONSTRAINT pk_film_genre_mapping_id        PRIMARY KEY (film_genre_mapping_id);
ALTER TABLE film_last_viewed           ADD CONSTRAINT pk_film_last_viewed_id          PRIMARY KEY (film_last_viewed_id);
ALTER TABLE film_owned_status_mapping  ADD CONSTRAINT pk_film_owned_status_mapping_id PRIMARY KEY (film_owned_status_mapping_id);
ALTER TABLE film_rating                ADD CONSTRAINT pk_film_rating_id               PRIMARY KEY (film_rating_id);
ALTER TABLE film_rating_mapping        ADD CONSTRAINT pk_film_rating_mapping_id       PRIMARY KEY (film_rating_mapping_id);
ALTER TABLE film_rating_status         ADD CONSTRAINT pk_film_rating_status_id        PRIMARY KEY (film_rating_status_id);
ALTER TABLE film_rating_verdict        ADD CONSTRAINT pk_film_rating_verdict_id       PRIMARY KEY (film_rating_verdict_id);
ALTER TABLE genre                      ADD CONSTRAINT pk_genre_id                     PRIMARY KEY (genre_id);
ALTER TABLE genre_sub_type             ADD CONSTRAINT pk_genre_sub_typ_id             PRIMARY KEY (genre_sub_type_id);
ALTER TABLE house_hold                 ADD CONSTRAINT pk_house_hold_id                PRIMARY KEY (house_hold_id);
ALTER TABLE rev_hous_memshp_mapp       ADD CONSTRAINT pk_rev_hous_memshp_mapp_id      PRIMARY KEY (rev_hous_memshp_mapp_id);
ALTER TABLE reviewer                   ADD CONSTRAINT pk_reviewer_id                  PRIMARY KEY (reviewer_id);
ALTER TABLE reviewer_house_membership  ADD CONSTRAINT pk_reviewer_house_membership_id PRIMARY KEY (reviewer_house_membership_id);

-- set AUTO_INCREMENT on primary key -----------------------------------------------------------------------------------
ALTER TABLE actor                      MODIFY actor_id                     INT(10) AUTO_INCREMENT;
ALTER TABLE director                   MODIFY director_id                  INT(10) AUTO_INCREMENT;
ALTER TABLE film                       MODIFY film_id                      INT(10) AUTO_INCREMENT;
ALTER TABLE film_actor_mapping         MODIFY film_actor_mapping_id        INT(10) AUTO_INCREMENT;
ALTER TABLE film_director_mapping      MODIFY film_director_mapping_id     INT(10) AUTO_INCREMENT;
ALTER TABLE film_genre_mapping         MODIFY film_genre_mapping_id        INT(10) AUTO_INCREMENT;
ALTER TABLE film_last_viewed           MODIFY film_last_viewed_id          INT(10) AUTO_INCREMENT;
ALTER TABLE film_owned_status_mapping  MODIFY film_owned_status_mapping_id INT(10) AUTO_INCREMENT;
ALTER TABLE film_rating                MODIFY film_rating_id               INT(10) AUTO_INCREMENT;
ALTER TABLE film_rating_mapping        MODIFY film_rating_mapping_id       INT(10) AUTO_INCREMENT;
ALTER TABLE film_rating_status         MODIFY film_rating_status_id        INT(10) AUTO_INCREMENT;
ALTER TABLE film_rating_verdict        MODIFY film_rating_verdict_id       INT(10) AUTO_INCREMENT;
ALTER TABLE genre                      MODIFY genre_id                     INT(10) AUTO_INCREMENT;
ALTER TABLE genre_sub_type             MODIFY genre_sub_type_id            INT(10) AUTO_INCREMENT;
ALTER TABLE house_hold                 MODIFY house_hold_id                INT(10) AUTO_INCREMENT;
ALTER TABLE rev_hous_memshp_mapp       MODIFY rev_hous_memshp_mapp_id      INT(10) AUTO_INCREMENT;
ALTER TABLE reviewer                   MODIFY reviewer_id                  INT(10) AUTO_INCREMENT;
ALTER TABLE reviewer_house_membership  MODIFY reviewer_house_membership_id INT(10) AUTO_INCREMENT;

-- set foreign key -----------------------------------------------------------------------------------------------------
ALTER TABLE film_actor_mapping        ADD CONSTRAINT fk_fam_film_id                    FOREIGN KEY (film_id)                 REFERENCES film(film_id);
ALTER TABLE film_actor_mapping        ADD CONSTRAINT fk_fam_actor_id                   FOREIGN KEY (actor_id)                REFERENCES actor(actor_id);
ALTER TABLE film_director_mapping     ADD CONSTRAINT fk_fdm_director_id                FOREIGN KEY (director_id)             REFERENCES director(director_id);
ALTER TABLE film_director_mapping     ADD CONSTRAINT fk_fdm_film_id                    FOREIGN KEY (film_id)                 REFERENCES film(film_id);
ALTER TABLE film_genre_mapping        ADD CONSTRAINT fk_fgm_film_id                    FOREIGN KEY (film_id)                 REFERENCES film(film_id);
ALTER TABLE film_genre_mapping        ADD CONSTRAINT fk_fgm_genre_id                   FOREIGN KEY (genre_id)                REFERENCES genre(genre_id);
ALTER TABLE film_last_viewed          ADD CONSTRAINT fk_flv_film_id                    FOREIGN KEY (film_id)                 REFERENCES film(film_id);
ALTER TABLE film_last_viewed          ADD CONSTRAINT fk_flv_reviewer_id                FOREIGN KEY (reviewer_id)             REFERENCES reviewer(reviewer_id);
ALTER TABLE film_owned_status_mapping ADD CONSTRAINT fk_fosm_film_id                   FOREIGN KEY (film_id)                 REFERENCES film(film_id);
ALTER TABLE film_owned_status_mapping ADD CONSTRAINT fk_fosm_house_hold_id             FOREIGN KEY (house_hold_id)           REFERENCES house_hold(house_hold_id);
ALTER TABLE film_rating               ADD CONSTRAINT fk_fr_reviewer_id                 FOREIGN KEY (reviewer_id)             REFERENCES reviewer(reviewer_id);
ALTER TABLE film_rating               ADD CONSTRAINT fk_fr_film_rating_verdict_id      FOREIGN KEY (film_rating_verdict_id)  REFERENCES film_rating_verdict(film_rating_verdict_id);
ALTER TABLE film_rating_mapping       ADD CONSTRAINT fk_frm_film_id                    FOREIGN KEY (film_id)                 REFERENCES film(film_id);
ALTER TABLE film_rating_mapping       ADD CONSTRAINT fk_frm_film_rating_id             FOREIGN KEY (film_rating_id)          REFERENCES film_rating(film_rating_id);
ALTER TABLE film_rating_mapping       ADD CONSTRAINT fk_frm_film_rating_status_id      FOREIGN KEY (film_rating_status_id)   REFERENCES film_rating_status(film_rating_status_id);
ALTER TABLE genre_sub_type	     	  ADD CONSTRAINT fk_gst_genre_id        		   FOREIGN KEY (genre_id) 			     REFERENCES genre(genre_id);
ALTER TABLE rev_hous_memshp_mapp      ADD CONSTRAINT fk_rhmm_house_hold_id             FOREIGN KEY (house_hold_id)           REFERENCES house_hold(house_hold_id);
ALTER TABLE reviewer_house_membership ADD CONSTRAINT fk_rhm_rev_hous_memshp_mapp_id    FOREIGN KEY (rev_hous_memshp_mapp_id) REFERENCES rev_hous_memshp_mapp(rev_hous_memshp_mapp_id);
ALTER TABLE reviewer_house_membership ADD CONSTRAINT fk_rhm_reviewer_id                FOREIGN KEY (reviewer_id)      	     REFERENCES reviewer(reviewer_id);