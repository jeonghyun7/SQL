---아우터조인(외부조인)-------------------------------
SELECT S.stdName, S.addr, C.clubName, C.roomNo
FROM stdtbl S
LEFT OUTER JOIN stdclubtbl SC ON S.stdName = SC.stdName
LEFT OUTER JOIN clubtbl C ON SC.clubName = C.clubName
UNION
SELECT S.stdName, S.addr, C.clubName, C.roomNo
FROM stdtbl S
LEFT OUTER JOIN stdclubtbl SC ON SC.stdName = S.stdName
RIGHT OUTER JOIN clubtbl C ON SC.clubName = C.clubName;