DROP TABLE SUBMODELS IF EXISTS;
DROP TABLE MODELS IF EXISTS;
DROP TABLE WHEELS IF EXISTS;
DROP TABLE ENGINES IF EXISTS;

CREATE TABLE WHEELS(
    id BIGINT IDENTITY NOT NULL PRIMARY KEY,
    wheel_size VARCHAR(45),
    wheel_type VARCHAR(45)
);

CREATE TABLE ENGINES(
    id BIGINT IDENTITY NOT NULL PRIMARY KEY,
	engine_power INT NOT NULL,
    engine_type VARCHAR(45) NOT NULL,
);

CREATE TABLE MODELS (
  model_id BIGINT IDENTITY NOT NULL PRIMARY KEY,
  model_name VARCHAR(45) NOT NULL,
  model_from TINYINT(4) NOT NULL,
  model_to TINYINT(4) DEFAULT NULL,
  model_type VARCHAR(45) DEFAULT NULL,
  wheel_id BIGINT ,
  engine_id BIGINT ,
  FOREIGN KEY (wheel_id) REFERENCES WHEELS(id),
  FOREIGN KEY (engine_id) REFERENCES ENGINES(id)
);

CREATE TABLE SUBMODELS (
  submodel_id BIGINT IDENTITY NOT NULL PRIMARY KEY,
  submodel_name VARCHAR(45) NOT NULL,
  submodel_line VARCHAR(45) NOT NULL,
  model_id BIGINT,
  wheel_id BIGINT,
  engine_id BIGINT,
  FOREIGN KEY (model_id) REFERENCES MODELS(model_id),
  FOREIGN KEY (wheel_id) REFERENCES WHEELS(id),
  FOREIGN KEY (engine_id) REFERENCES ENGINES(id)
);