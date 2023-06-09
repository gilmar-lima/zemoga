# Zemoga Salesforce Technical Test

This repository contains my solutions to the Zemoga technical test for Salesforce 
developers position.

## Part 1

For the first part I have created a [portifolio](https://github.com/gilmar-lima/zemoga/tree/feature/reddit/force-app/main/default/lwc/portifolio) LWC component that can be found
in this repository.

## Part 2

For the second part, here is my solution:

In order to update a field in object B with a value from the Account object
considering that you already have the ID of the object B, the solution follows:

```
TheObjectType B = new TheObjectType();
B.Id = theIdOfTheObject;
B.FieldToUpdate__c = theValue;
update B;
```

## Part 3

For this part I have created [RedditService](https://github.com/gilmar-lima/zemoga/blob/feature/reddit/force-app/main/default/classes/RedditService.cls) class to perform the comment posting.
I'm assuming that the payload provided in the test is the payload which must be sent
to the comments endpoint. I also assumed Basic authentication for Reddit API.