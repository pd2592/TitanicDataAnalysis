A = load '/user/flume/FlumeData.1486653862918.tmp' using PigStorage(',') as (passengerId:int, survived:int, pclass:int, name:chararray, sex:chararray, age:int, sibsp:int, parch:int, ticket:chararray, fare:int, cabin:float, embarked:chararray);

B = foreach A generate passengerId, survived, pclass, embarked;

C = filter B by embarked=='S';

D = filter C by survived==0;

E = group D by pclass; 

F = foreach E generate group, COUNT(D.passengerId);

dump F;
