SELECT *
FROM Student

ORDER BY 
  CASE 
    WHEN BatchNo LIKE '%-%' THEN LEFT(BatchNo, CHARINDEX('-', BatchNo) - 1)
    ELSE LEFT(BatchNo, PATINDEX('%[0-9]%', BatchNo) - 1)
  END,

  CASE 
    WHEN BatchNo LIKE '%-%' THEN 
      SUBSTRING(BatchNo, CHARINDEX('-', BatchNo) + 1, LEN(BatchNo) - CHARINDEX('-', BatchNo) - 1)
    ELSE 
      SUBSTRING(BatchNo, PATINDEX('%[0-9]%', BatchNo), LEN(BatchNo))
  END,

CASE
    WHEN ISNUMERIC(CASE
        WHEN SeatRollNo LIKE '%-%' THEN
          LEFT(SeatRollNo, CHARINDEX('-', SeatRollNo) - 1)
        ELSE
          LEFT(SeatRollNo, PATINDEX('%[0-9]%', SeatRollNo) - 1)
      END) = 1 THEN
      CONVERT(INT, CASE
        WHEN SeatRollNo LIKE '%-%' THEN
          LEFT(SeatRollNo, CHARINDEX('-', SeatRollNo) - 1)
        ELSE
          LEFT(SeatRollNo, PATINDEX('%[0-9]%', SeatRollNo) - 1)
      END)
    ELSE
      0
END,

CASE 
    WHEN ISNUMERIC(RIGHT(SeatRollNo, 3)) = 1 
    THEN CONVERT(INT, RIGHT(SeatRollNo, 3)) 
    ELSE 0
END,

SeatRollNo, BatchNo

