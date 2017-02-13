A = load '/user/flume/FlumeData.1486653862918.tmp' using PigStorage(',') as (passengerId:int, survived:int, pclass:int, name:chararray, sex:chararray, age:int, sibsp:int, parch:int, ticket:chararray, fare:int, cabin:float, embarked:chararray);

B = foreach A generate pclass, fare;

C = group B by pclass;

D = foreach C generate group, AVG(B.fare);

dump D;
