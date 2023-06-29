-- 연습용
-- 보너스 포함한 연봉이 높은 5명의 사번, 이름, 부서명, 직급, 입사일, 순위 조회

-- 부서별 급여 합계가 전체 급여 총 합의 20%보다 많은 부서의 부서명, 부서별 급여 합계 조회

-- WITH을 이용하여 급여 합과 급여 평균 조회

-- OPTION
--1번
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
ORDER BY STUDENT_NAME;

--2번
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

--3번
SELECT STUDENT_NAME, STUDENT_NO, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE STUDENT_NO LIKE '99%'
AND (STUDENT_ADDRESS LIKE '%강원도%'  OR STUDENT_ADDRESS LIKE '%경기도%')
ORDER BY STUDENT_NAME;

-- 4번 문제
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR P
JOIN TB_DEPARTMENT D ON (P.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '법학과'
ORDER BY PROFESSOR_SSN;

-- 5번 문제
SELECT S.STUDENT_NO, TO_CHAR(POINT, 'FM99.00')
FROM TB_STUDENT S
JOIN TB_GRADE G ON (S.STUDENT_NO = G.STUDENT_NO)
WHERE TERM_NO = '200402' AND CLASS_NO = 'C3118100'
ORDER BY 2 DESC;

-- 6번 문제
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
ORDER BY STUDENT_NAME;

-- 7번 문제
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS C
JOIN TB_DEPARTMENT D ON (C.DEPARTMENT_NO = D.DEPARTMENT_NO);

-- 8번 문제
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS C
JOIN TB_PROFESSOR P ON (C.DEPARTMENT_NO = P.DEPARTMENT_NO)
ORDER BY 2;

-- 9번 문제
SELECT S.STUDENT_NO, STUDENT_NAME, ROUND(AVG(NVL(POINT,0)),1)
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON (D.DEPARTMENT_NO = S.DEPARTMENT_NO)
JOIN TB_GRADE G ON (G.STUDENT_NO = S.STUDENT_NO)
WHERE DEPARTMENT_NAME = '음악학과'
GROUP BY S.STUDENT_NO, STUDENT_NAME;

-- 10번 문제
SELECT DEPARTMENT_NAME, STUDENT_NAME, PROFESSOR_NAME
FROM TB_DEPARTMENT D
JOIN TB_STUDENT S ON (D.DEPARTMENT_NO = S.DEPARTMENT_NO)
--JOIN TB_PROFESSOR P ON (P.PROFESSOR_NO = S.COACH_PROFESSOR_NO)
JOIN TB_PROFESSOR P ON (P.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE STUDENT_NO = 'A313047';

-- 11번 문제
-- 2007년도에 '인간관계론' 과목을 수강 학생을 찾아 수강학기를 표시
SELECT S.STUDENT_NAME, G.TERM_NO
FROM TB_STUDENT S 
JOIN TB_GRADE G ON (S.STUDENT_NO = G.STUDENT_NO)
JOIN TB_CLASS C ON (G.CLASS_NO = C.CLASS_NO)
WHERE C.CLASS_NAME = '인간관계론' AND G.TERM_NO LIKE '%2007%'
ORDER BY S.STUDENT_NAME;

-- 12번 문제
-- 예체능 계열 과목 중 과목 담당교수를 한명도 배정받지 못한 과목을 찾아 학과 이름을 출력하세용
SELECT C.CLASS_NAME, DEPARTMENT_NAME
FROM TB_DEPARTMENT D
JOIN TB_CLASS C ON (D.DEPARTMENT_NO = C.DEPARTMENT_NO)
LEFT JOIN TB_CLASS_PROFESSOR T ON (C.CLASS_NO = T.CLASS_NO)
WHERE D.CATEGORY = '예체능'
AND PROFESSOR_NO IS NULL;
