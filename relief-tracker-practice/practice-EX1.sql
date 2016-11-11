Use ReliefTracker;
SELECT Person.firstName, Person.lastName, role, Relief.name, Relief.location
FROM ReliefTeam join Person on ReliefTeam.personID = Person.ID join Relief
ON Relief.ID = ReliefTeam.reliefID;
