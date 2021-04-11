--Problem Statement
/*
Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are .

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

Input Format

The following tables hold interview data:

Contests: The contest_id is the id of the contest, hacker_id is the id of the hacker who created the contest, and name is the name of the hacker.

Colleges: The college_id is the id of the college, and contest_id is the id of the contest that Samantha used to screen the candidates.

Challenges: The challenge_id is the id of the challenge that belongs to one of the contests whose contest_id Samantha forgot, and college_id is the id of the college where the challenge was given to candidates.

View_Stats: The challenge_id is the id of the challenge, total_views is the number of times the challenge was viewed by candidates, and total_unique_views is the number of times the challenge was viewed by unique candidates.

Submission_Stats: The challenge_id is the id of the challenge, total_submissions is the number of submissions for the challenge, and total_accepted_submission is the number of submissions that achieved full scores.
*/

--Solution

SELECT A.CONTEST_ID, A.HACKER_ID, A.NAME,
        SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS,
        SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS,
        SUM(TOTAL_VIEWS) AS TOTAL_VIEWS,
        SUM(TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS
FROM CONTESTS AS A
LEFT JOIN COLLEGES AS B
    ON A.CONTEST_ID = B.CONTEST_ID
LEFT JOIN CHALLENGES AS C
    ON B.COLLEGE_ID = C.COLLEGE_ID
LEFT JOIN (SELECT CHALLENGE_ID, SUM(TOTAL_VIEWS) AS TOTAL_VIEWS,
                  SUM(TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS
           FROM VIEW_STATS
           GROUP BY CHALLENGE_ID) AS D
    ON C.CHALLENGE_ID = D.CHALLENGE_ID
LEFT JOIN (SELECT CHALLENGE_ID, SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS,
                  SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS
           FROM SUBMISSION_STATS
           GROUP BY CHALLENGE_ID) AS E
    ON C.CHALLENGE_ID = E.CHALLENGE_ID
GROUP BY A.CONTEST_ID, A.HACKER_ID, A.NAME
HAVING (TOTAL_SUBMISSIONS + TOTAL_ACCEPTED_SUBMISSIONS + TOTAL_VIEWS + TOTAL_UNIQUE_VIEWS) > 0
ORDER BY A.CONTEST_ID;
