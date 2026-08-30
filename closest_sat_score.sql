-- Given a table of students and their SAT test scores, write a query to return the two students with the closest test scores with the score difference.

-- If there are multiple students with the same minimum score difference, select the student name combination that is higher in the alphabet. 

-- Example:

-- Input:

-- scores table

-- Column	Type
-- id	    INTEGER
-- student	VARCHAR
-- score	  INTEGER

-- Output:

-- Column	      Type
-- one_student	  VARCHAR
-- other_student	VARCHAR
-- score_diff	  INTEGER

-- Solution

WITH pairs AS (
    SELECT
        LEAST(s1.student, s2.student) AS one_student,
        GREATEST(s1.student, s2.student) AS other_student,
        ABS(s1.score - s2.score) AS score_diff
    FROM scores s1
    JOIN scores s2
        ON s1.id < s2.id
)
SELECT
    one_student,
    other_student,
    score_diff
FROM pairs
ORDER BY
    score_diff ASC,
    one_student DESC,
    other_student DESC
LIMIT 1;
