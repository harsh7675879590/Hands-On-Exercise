-- 1. Apply 1% discount to loan interest for customers above 60
BEGIN
    FOR customer IN (SELECT CustomerID, 
                            TRUNC(MONTHS_BETWEEN(SYSDATE, DOB)/12) AS Age 
                     FROM Customers)
    LOOP
        IF customer.Age > 60 THEN
            UPDATE Loans 
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = customer.CustomerID;
            DBMS_OUTPUT.PUT_LINE('Discount applied for CustomerID: ' 
                                  || customer.CustomerID 
                                  || ' Age: ' || customer.Age);
        END IF;
    END LOOP;
    COMMIT;
END;
/

-- 2. Set IsVIP = TRUE for customers with balance over 10000
BEGIN
    FOR customer IN (SELECT CustomerID, Balance FROM Customers)
    LOOP
        IF customer.Balance > 10000 THEN
            UPDATE Customers 
            SET IsVIP = 'TRUE'
            WHERE CustomerID = customer.CustomerID;
            DBMS_OUTPUT.PUT_LINE('VIP status set for CustomerID: ' 
                                  || customer.CustomerID);
        END IF;
    END LOOP;
    COMMIT;
END;
/

-- 3. Print reminders for loans due within 30 days
BEGIN
    FOR loan IN (SELECT L.LoanID, C.Name, L.EndDate 
                 FROM Loans L 
                 JOIN Customers C ON L.CustomerID = C.CustomerID
                 WHERE L.EndDate BETWEEN SYSDATE AND SYSDATE + 30)
    LOOP
        DBMS_OUTPUT.PUT_LINE('REMINDER: Dear ' || loan.Name || 
                             ', your loan ID ' || loan.LoanID || 
                             ' is due on ' || loan.EndDate);
    END LOOP;
END;
/