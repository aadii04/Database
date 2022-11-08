Create Table Artist(
Artist_Id Int Not Null,
Album_Id Int Not Null,
First_Name Varchar(10) Not Null,
Middle_Name Varchar(10),
Last_Name Varchar (15),
Contact_Number BigInt Not Null,
 CONSTRAINT [Artist_Id_PK] PRIMARY KEY CLUSTERED
(
    [Artist_Id] ASC
)
)

Create Table Album(
Artist_Id Int Not Null,
Album_Id Int Not Null,
Album_Name Varchar(20) Not Null,
Release_Date Date Not Null
 CONSTRAINT [Album_Id_PK] PRIMARY KEY CLUSTERED
(
    [Album_Id] ASC
)
) ON [PRIMARY]

Alter table Album
Add Foreign key (Artist_Id) References Artist(Artist_Id)

Create Table Song(
Song_Id Int Not Null,
Album_Id Int Not Null,
Song_Name varchar(15) Not Null,
Song_Artist Varchar(20) Not Null,
Release_Date Date Not Null,
Publising_Company Varchar Not Null
 CONSTRAINT [Song_Id_pk] PRIMARY KEY CLUSTERED
(
    [Song_Id] ASC
)
) ON [PRIMARY]

Alter Table Song 
Add Foreign key (Album_Id) References Album(Album_Id)

Alter Table Song 
Add Foreign key (Artist_Id) References Artist(Artist_Id)

select * from Music
select * from Album


