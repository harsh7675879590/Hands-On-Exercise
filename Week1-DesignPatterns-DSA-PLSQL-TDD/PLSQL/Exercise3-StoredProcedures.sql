-- 1. Process Monthly Interest for all Savings Accounts
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance * 1.01,
        LastModified = SYSDATE
    WHERE AccountType = 'Savings';
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Monthly interest processed for all savings accounts.');
END;
/

-- 2. Update Employee Bonus by Department
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_Department IN VARCHAR2,
    p_BonusPercent IN NUMBER
) AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_BonusPercent / 100)
    WHERE Department = p_Department;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Bonus updated for department: ' || p_Department);
END;
/

-- 3. Transfer Funds Between Accounts
CREATE OR REPLACE PROCEDURE TransferFunds(
    p_FromAccount IN NUMBER,
    p_ToAccount IN NUMBER,
    p_Amount IN NUMBER
) AS
    v_Balance NUMBER;
BEGIN
    SELECT Balance INTO v_Balance
    FROM Accounts
    WHERE AccountID = p_FromAccount;
    
    IF v_Balance < p_Amount THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Insufficient balance in account ' 
                              || p_FromAccount);
    ELSE
        UPDATE Accounts
        SET Balance = Balance - p_Amount,
            LastModified = SYSDATE
        WHERE AccountID = p_FromAccount;
        
        UPDATE Accounts
        SET Balance = Balance + p_Amount,
            LastModified = SYSDATE
        WHERE AccountID = p_ToAccount;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('SUCCESS: Transferred Rs.' || p_Amount || 
                             ' from Account ' || p_FromAccount || 
                             ' to Account ' || p_ToAccount);
    END IF;
END;
/

BEGIN
    ProcessMonthlyInterest;
    UpdateEmployeeBonus('IT', 10);
    TransferFunds(1, 2, 500);
    TransferFunds(2, 3, 99999);
END;
/