A = load '/user/flume/FlumeData.1486653862918.tmp' using PigStorage(',') as (passengerId:int, survived:int, pclass:int, name:chararray, sex:chararray, age:int, sibsp:int, parch:int, ticket:chararray, fare:int, cabin:float, embarked:chararray);

B = foreach A generate passengerId, survived, pclass, sex;

C = filter B by survived==1;
S1 = filter C by sex=='female';
S2 = filter C by sex=='male';
D = group S1 by pclass;

E = foreach D generate group, COUNT(S1.passengerId);

dump E;

D1 = group S2 by pclass;

E1 = foreach D generate group, COUNT(S2.passengerId);

dump E1;

