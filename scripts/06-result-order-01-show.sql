/* source 06-result-order-01-show.sql */

/* Normally, ORDER BY is the last operation, if you need to execute other operations before ORDER BY, enclose ORDER BY into inner query. */

/* Setup */
DROP TABLE IF EXISTS test.ro_example;
CREATE TABLE test.ro_example (
  pk INT KEY AUTO_INCREMENT,
  content CHAR(255)
);

INSERT INTO test.ro_example (pk, content) 
  VALUES (null, 'ABCDEFGHIJKLMNOPQRSTUVWZYXABCDEFGHIJKLMNOPQRSTUVWZYXABCDEFGHIJKLMNOPQRSTUVWZYXABCDEFGHIJKLMNOPQRSTUVWZYXABCDEFGHIJKLMNOPQRSTUVWZYXABCDEFGHIJKLMNOPQRSTUVWZYX');

INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;
INSERT INTO test.ro_example SELECT null, content FROM test.ro_example;

/* Multiple TiKV regions exist, your regions count might be 4. (We need multiple regions to show the expected behavior.) */
/* SHOW TABLE test.ro_example REGIONS\G */

/* Are following results the same? Why? Observe the execution plan. */
/* Try 1 */
EXPLAIN
SELECT pk, row_number() over() FROM test.ro_example ORDER BY pk LIMIT 2;

/* Observe the result 1 */
SELECT pk, row_number() over() FROM test.ro_example ORDER BY pk LIMIT 2;
/* Observe the result 2 */
SELECT pk, row_number() over() FROM test.ro_example ORDER BY pk LIMIT 2;
/* Observe the result 3 */
SELECT pk, row_number() over() FROM test.ro_example ORDER BY pk LIMIT 2;
/* Observe the result 4 */
SELECT pk, row_number() over() FROM test.ro_example ORDER BY pk LIMIT 2;


/* Are following results the same? Why? Observe the execution plan. */
EXPLAIN
SELECT pk, row_number() over(ORDER BY pk) FROM test.ro_example LIMIT 2;

/* Try 2 */
/* Observe the result 1 */
SELECT pk, row_number() over(ORDER BY pk) FROM test.ro_example LIMIT 2;
/* Observe the result 2 */
SELECT pk, row_number() over(ORDER BY pk) FROM test.ro_example LIMIT 2;
/* Observe the result 3 */
SELECT pk, row_number() over(ORDER BY pk) FROM test.ro_example LIMIT 2;
/* Observe the result 4 */
SELECT pk, row_number() over(ORDER BY pk) FROM test.ro_example LIMIT 2;


/* Are following results the same? Why? Observe the execution plan. */
EXPLAIN
SELECT pk, row_number() over(ORDER BY pk) FROM test.ro_example ORDER BY pk LIMIT 2;

/* Try 3 */
/* Observe the result 1 */
SELECT pk, row_number() over(ORDER BY pk) FROM test.ro_example ORDER BY pk LIMIT 2;
/* Observe the result 2 */
SELECT pk, row_number() over(ORDER BY pk) FROM test.ro_example ORDER BY pk LIMIT 2;
/* Observe the result 3 */
SELECT pk, row_number() over(ORDER BY pk) FROM test.ro_example ORDER BY pk LIMIT 2;
/* Observe the result 4 */
SELECT pk, row_number() over(ORDER BY pk) FROM test.ro_example ORDER BY pk LIMIT 2;


/* Are following results the same? Why? Observe the execution plan. */
EXPLAIN
SELECT pk, row_number() over() FROM
(SELECT pk FROM test.ro_example ORDER BY pk LIMIT 2) v;

/* Try 4 */
/* Observe the result 1 */
SELECT pk, row_number() over() FROM
(SELECT pk FROM test.ro_example ORDER BY pk LIMIT 2) v;
/* Observe the result 2 */
SELECT pk, row_number() over() FROM
(SELECT pk FROM test.ro_example ORDER BY pk LIMIT 2) v;
/* Observe the result 3 */
SELECT pk, row_number() over() FROM
(SELECT pk FROM test.ro_example ORDER BY pk LIMIT 2) v;
/* Observe the result 4 */
SELECT pk, row_number() over() FROM
(SELECT pk FROM test.ro_example ORDER BY pk LIMIT 2) v;

