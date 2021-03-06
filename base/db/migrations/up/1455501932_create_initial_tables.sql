CREATE TABLE users (
	id SERIAL,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	password VARCHAR(255) NOT NULL,
	locationid INTEGER NOT NULL,
	lastauthenticated TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updatedat TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE inputs (
	id SERIAL,
	userid INTEGER,
	flexid VARCHAR(255),
	flexidtype INTEGER,
	responseid INTEGER,
	commands VARCHAR(255) ARRAY,
	objects VARCHAR(255) ARRAY,
	actors VARCHAR(255) ARRAY,
	times VARCHAR(255) ARRAY,
	places VARCHAR(255) ARRAY,
	sentence VARCHAR(255),
	plugin VARCHAR(255),
	route VARCHAR(255),
	createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE responses (
	id SERIAL,
	userid INTEGER NOT NULL,
	inputid INTEGER NOT NULL,
	sentence VARCHAR(255) NOT NULL,
	route VARCHAR(255) NOT NULL,
	state JSONB,
	createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE userflexids (
	userid INTEGER NOT NULL,
	flexid VARCHAR(255) NOT NULL,
	flexidtype INTEGER NOT NULL,
	createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (userid, flexid)
);

CREATE TABLE locations (
	id SERIAL,
	name VARCHAR(255),
	lat FLOAT,
	lon FLOAT,
	PRIMARY KEY (id)
);
