-- 1번 정답
SELECT STUDENT_NO "학번", 
STUDENT_NAME "이름", 
TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') "입학년도"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY "입학년도";

-- 2번 정답
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != 3;

-- 3번 정답
SELECT PROFESSOR_NAME,
CASE
WHEN TO_CHAR(SYSDATE, 'MMDD') > SUBSTR(PROFESSOR_SSN, 3,4)
THEN (TO_CHAR(SYSDATE, 'YY')+2000 -((SUBSTR(PROFESSOR_SSN, 1,2))+1900))+1

WHEN TO_CHAR(SYSDATE, 'MMDD') < SUBSTR(PROFESSOR_SSN, 3,4)
THEN TO_CHAR(SYSDATE, 'YY')+2000 -((SUBSTR(PROFESSOR_SSN, 1,2))+1900)
END "나이"

FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN,8,1) = 1;

-- 4번 정답
SELECT SUBSTR(PROFESSOR_NAME, 2)
FROM TB_PROFESSOR;

-- 5번 정답 
SELECT 
STUDENT_NO,
STUDENT_NAME
FROM TB_STUDENT
WHERE 
EXTRACT(YEAR FROM ENTRANCE_DATE) - (SUBSTR(STUDENT_SSN, 1, 2)+1900) > 19;

-- 6번 정답
SELECT TO_CHAR(TO_DATE(20201225, 'YYYYMMDD'), 'DAY') "2020년 크리스마스 요일은 "FROM DUAL;

-- 7번 정답
SELECT TO_CHAR(TO_DATE('99/10/11'), 'YYYY"년"MM"월"DD"일"') 값1, 
TO_CHAR(TO_DATE('49/10/11'), 'YYYY"년"MM"월"DD"일"') 값2,
TO_CHAR(TO_DATE('99/10/11'), 'YYYY"년"MM"월"DD"일"') 값3,
TO_CHAR(TO_DATE('49/10/11'), 'YYYY"년"MM"월"DD"일"') 값4
FROM DUAL;

-- 8번 정답 //
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) < 2000
ORDER BY STUDENT_NAME;

-- 9번 정답
SELECT ROUND(AVG(POINT), 1) 평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-- 10번 정답
SELECT DEPARTMENT_NO 학과번호, COUNT(*) 학생수
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 학과번호;

-- 11번 정답
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

-- 12번 정답
SELECT TO_CHAR(TO_DATE(TERM_NO, 'YYYYMM'),'YYYY') 년도 , ROUND(AVG(POINT),1) "년도별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY TO_CHAR(TO_DATE(TERM_NO, 'YYYYMM'),'YYYY')
ORDER BY "년도";

-- 13번 정답
SELECT DEPARTMENT_NO "학과 코드", 
COUNT(
CASE 
WHEN ABSENCE_YN = 'Y' THEN 1
ELSE NULL
END) "휴학생 수"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

-- 14번 정답
SELECT STUDENT_NAME 동일이름, COUNT(*) "동명인 수"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(DISTINCT (STUDENT_SSN)) > 1
ORDER BY STUDENT_NAME;

-- 15번 정답 
SELECT TO_CHAR(TO_DATE(TERM_NO, 'YYYYMM'),'YYYY') 년도 , NVL(SUBSTR(TERM_NO, 5,2),' ')학기 ,ROUND(AVG(NVL(POINT,0)),1) "년도별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP (TO_CHAR(TO_DATE(TERM_NO, 'YYYYMM'),'YYYY'),SUBSTR(TERM_NO, 5,2));


