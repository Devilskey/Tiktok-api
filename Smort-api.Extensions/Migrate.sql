﻿CREATE TABLE `Role` ( `Id` integer PRIMARY KEY AUTO_INCREMENT,`Name` varchar(16),`Description` varchar(128));
CREATE TABLE `Users_Public` (`Id` integer PRIMARY KEY AUTO_INCREMENT,`Person_Id` integer,`Username` varchar(32),`Profile_Picture` blob,`Created_At` DateTime, `Updated_At` DateTime,`Deleted_At` DateTime);
CREATE TABLE `Users_Private` ( `Id` integer PRIMARY KEY AUTO_INCREMENT, `Role_Id` integer, `Email` varchar(64), `Password` varchar(128), `Salt` varchar(64), `Token` varchar(64));
CREATE TABLE `Following` ( `User_Id_Followed` integer, `User_Id_Follower` integer, `Followed_At` DateTime );
CREATE TABLE `Video` ( `Id` integer PRIMARY KEY AUTO_INCREMENT, `User_Id` integer, `File_Id` integer, `Title` varchar(32), `Description` varchar(128), `Url` varchar(64), `Created_At` DateTime, `Updated_At` DateTime, `Deleted_At` DateTime );
CREATE TABLE `Reaction` ( `User_Id` integer, `Video_Id` integer, `Created_At` DateTime, `Updated_At` DateTime );
CREATE TABLE `File` ( `Id` integer PRIMARY KEY AUTO_INCREMENT, `File_Name` varchar(32), `File_location` varchar(128), `Created_At` DateTime, `Deleted_At` DateTime );
CREATE TABLE `Username_Counter` ( `Id` integer PRIMARY KEY AUTO_INCREMENT, `Username` varchar(32), `Amount` int, `Created_At` DateTime, `Updated_At` DateTime );


ALTER TABLE `Reaction` ADD FOREIGN KEY (`Video_Id`) REFERENCES `Video` (`Id`);
ALTER TABLE `Video` ADD FOREIGN KEY (`File_Id`) REFERENCES `File` (`Id`);
ALTER TABLE `Reaction` ADD FOREIGN KEY (`User_Id`) REFERENCES `Users_Public` (`Id`);
ALTER TABLE `Following` ADD FOREIGN KEY (`User_Id_Followed`) REFERENCES `Users_Public` (`Id`);
ALTER TABLE `Following` ADD FOREIGN KEY (`User_Id_Follower`) REFERENCES `Users_Public` (`Id`);
ALTER TABLE `Video` ADD FOREIGN KEY (`User_Id`) REFERENCES `Users_Public` (`Id`);
ALTER TABLE `Users_Public` ADD FOREIGN KEY (`Person_Id`) REFERENCES `Users_Private` (`Id`);
ALTER TABLE `Users_Private` ADD FOREIGN KEY (`Role_Id`) REFERENCES `Role` (`Id`);

INSERT IGNORE  INTO `Role` (Id, Name, Description) values (1, "User", "Someone who has an account on the site");
INSERT IGNORE  INTO `Role` (Id, Name, Description) values (2, "Creator", "Someone who Creates content");
INSERT IGNORE  INTO `Role` (Id, Name, Description) values (3, "Admin", "Someone who has unlimited power");