
-- ralasafe schema

CREATE TABLE ralasafe_sequence (
	currentValue int,
	name varchar(100) not null,
	primary key( name )
);

CREATE TABLE usertype (
	name varchar(100) not null,
	description varchar(500),
	userMetadataXML varchar(4000),
	PRIMARY KEY(name)
);

CREATE TABLE application (
	name varchar(100) not null,
	description varchar(500),
	PRIMARY KEY(name)
);

CREATE TABLE applicationusertype (
	appName varchar(100) not null,
	userTypeName varchar(100) not null,
	userMetadataStr varchar(1000),
	PRIMARY KEY(appName, userTypeName)
);

