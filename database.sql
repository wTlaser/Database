drop table if exists booking;
drop table if exists tourevent;
drop table if exists client;
drop table if exists tour;



Create Table Tour (
    TourName nvarchar(100),
    Description nvarchar(500)
    PRIMARY KEY (TourName)
);
Create Table Client (
    ClientId INT,
    Surname nvarchar(100) NOT NULL,
    GivenName nvarchar(100) NOT NULL,
    Gender nvarchar(1) CHECK (Gender IN ('M','F','I')),
    PRIMARY KEY (ClientId),
);
Create Table TourEvent (
    TourName nvarchar(100),
    EventMonth nvarchar(3) CHECK (EventMonth IN ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')),
    EventDay INT CHECK (EventDay>=1 and EventDay<=31),
    EventYear INT CHECK (EventYear=4),
    EventFee Money NOT NULL, CHECK (EventFee>0),
  PRIMARY KEY (TourName, EventDay, EventYear, EventMonth),
  FOREIGN KEY (TourName) REFERENCES Tour(TourName),
);
Create Table Booking (
    ClientId INT,
    TourName nvarchar(100),
    EventMonth nvarchar(3) CHECK (EventMonth IN ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')),
    EventDay INT CHECK (EventDay>=1 and EventDay<=31),
    EventYear INT CHECK (EventYear=4),
    Payment Money CHECK (Payment>0),
    DateBooked DATE NOT NULL,
  PRIMARY KEY (ClientId, TourName, EventMonth, EventDay, EventYear),
  FOREIGN KEY (ClientId) REFERENCES Client(ClientId),
  FOREIGN KEY (TourName, EventDay, EventYear, EventMonth) REFERENCES TourEvent
);