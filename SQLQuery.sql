--CREATE TABLE Users (
--  UserID INT PRIMARY KEY,
--  Name VARCHAR(50) NOT NULL,
--  PhoneNumber VARCHAR(20) NOT NULL,
--  ProfilePicture VARCHAR(255)
--);

--CREATE TABLE Groups (
--  GroupID INT PRIMARY KEY,
--  GroupName VARCHAR(50) NOT NULL,
--  GroupCapacity INT
--);

--CREATE TABLE GroupMembers (
--  GroupID INT,
--  UserID INT,
--  PRIMARY KEY (GroupID, UserID),
--  FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
--  FOREIGN KEY (UserID) REFERENCES Users(UserID)
--);

--CREATE TABLE Messages (
--  MessageID INT PRIMARY KEY,
--  SenderID INT NOT NULL,
--  ReceiverID INT NOT NULL,
--  GroupID INT,
--  Message TEXT NOT NULL,
--  Timestamp DATETIME NOT NULL,
--  FOREIGN KEY (SenderID) REFERENCES Users(UserID),
--  FOREIGN KEY (ReceiverID) REFERENCES Users(UserID),
--  FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
--);

--INSERT INTO Users(UserID, Name, PhoneNumber)
--VALUES(1, 'John Doe', '08178-764-555'),
--  (2, 'Jane Doe', '08055-555-1213'),
--  (3, 'Obinna Joe', '09055-777-1213')

--INSERT INTO Groups (GroupID, GroupName)
--VALUES
--  (1, 'MCB/BCH 19 CLASS'),
--  (2, 'GENESYS INTERNS'),
--  (3, 'CRUISE JOINT');

-- Insert data into GroupMembers table
--INSERT INTO GroupMembers (GroupID, UserID)
--VALUES
--  (1, 1),
--  (1, 2),
--  (2, 1),
--  (2, 3),
--  (3, 2),
--  (3, 3);

--INSERT INTO Messages (MessageID, SenderID, ReceiverID, Message, Timestamp)
--VALUES
--  (1, 1, 2, 'Hi Jane!', '2022-12-01 12:00:00'),
--  (2, 2, 1, 'Hello John!', '2022-12-01 12:01:00'),
--  (3, 1, 3, 'Hey Bob!', '2022-12-02 12:00:00'),
--  (4, 3, 1, 'What is up, John?', '2022-12-02 12:01:00');

--CREATE VIEW MessageView AS
--SELECT
--  Users.Name AS SenderName,
--  Receiver.Name AS ReceiverName,
--  Messages.Message,
--  Messages.Timestamp
--FROM
--  Messages
--  JOIN Users ON Messages.SenderID = Users.UserID
--  JOIN Users AS Receiver ON Messages.ReceiverID = Receiver.UserID;
