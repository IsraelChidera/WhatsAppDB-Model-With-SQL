CREATE TABLE Users (
  UserID INT PRIMARY KEY IDENTITY(1,1),
  Name VARCHAR(50) NOT NULL,
  PhoneNumber VARCHAR(20) NOT NULL,
  ProfilePicture VARCHAR(255)
);

INSERT INTO Users(Name, PhoneNumber)
VALUES('John Doe', '08178-764-555'),
  ('Jane Doe', '08055-555-1213'),
  ('Obinna Joe', '09055-777-1213')

CREATE TABLE Groups (
  GroupID INT PRIMARY KEY IDENTITY(1,1),
  GroupName VARCHAR(50) NOT NULL,
  GroupCapacity INT
);

INSERT INTO Groups ( GroupName)
VALUES
  ( 'MCB/BCH 19 CLASS'),
  ('GENESYS INTERNS'),
  ( 'CRUISE JOINT');

CREATE TABLE GroupMembers (
  GroupMemberID INT PRIMARY KEY IDENTITY(1,1),
  UserID INT,
  GroupAdmin VARCHAR(50) NOT NULL,  
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO GroupMembers (UserID,GroupAdmin)
VALUES
  ( 1, 'Chidera'),
  ( 2, 'Gee'),
  ( 1, 'Godswill'),
  ( 3, 'Dave'),
  ( 2, 'David'),
  ( 3, 'George');

CREATE TABLE Message (
  MessageID INT PRIMARY KEY IDENTITY(1,1),
  SenderID INT NOT NULL,
  ReceiverID INT NOT NULL,
  GroupID INT,
  Message TEXT NOT NULL,
  Timestamp DATETIME NOT NULL,
  FOREIGN KEY (SenderID) REFERENCES Users(UserID),
  FOREIGN KEY (ReceiverID) REFERENCES Users(UserID),
  FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
);

INSERT INTO Message ( SenderID, ReceiverID, Message, Timestamp)
VALUES
  ( 1, 2, 'Hi Jane!', '2022-12-01 12:00:00'),
  ( 2, 1, 'Hello John!', '2022-12-01 12:01:00'),
  ( 1, 3, 'Hey Bob!', '2022-12-02 12:00:00'),
  ( 3, 1, 'What is up, John?', '2022-12-02 12:01:00');

CREATE VIEW MessageView AS
SELECT
  Users.Name AS SenderName,
  Receiver.Name AS ReceiverName,
  Message.Message,
  Message.Timestamp
FROM
  Message
  JOIN Users ON Message.SenderID = Users.UserID
  JOIN Users AS Receiver ON Message.ReceiverID = Receiver.UserID;