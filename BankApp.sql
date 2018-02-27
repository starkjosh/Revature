CREATE TABLE BANK_CUSTOMER
(
    C_ID NUMBER NOT NULL,
    FNAME VARCHAR2(20) NOT NULL,
    LNAME VARCHAR2(20) NOT NULL,
    USERNAME VARCHAR2(20) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    ADDRESS VARCHAR2(20) NOT NULL,
    PHONENUM VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_BANK_CUSTOMER PRIMARY KEY (C_ID)
);

CREATE TABLE ACCOUNTS
(
    A_ID NUMBER NOT NULL,
    C_ID NUMBER NOT NULL,
    C_ID2 NUMBER,
    BALANCE NUMBER,
    CONSTRAINT PK_ACCOUNTS PRIMARY KEY (A_ID)
);

CREATE TABLE LOGIN_INFO
(
    USERNAME VARCHAR2(20) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    ACCOUNT_TYPE VARCHAR2(20) NOT NULL,
    C_ID NUMBER
);

ALTER TABLE BANK_CUSTOMER ADD APP_STATUS VARCHAR2(20);
ALTER TABLE BANK_CUSTOMER ADD ADDRESS VARCHAR2(60);
ALTER TABLE LOGIN_INFO DROP COLUMN C_ID;
ALTER TABLE LOGIN_INFO ADD C_ID VARCHAR2(20);

CREATE SEQUENCE C_ID_GEN
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1;
    /
SELECT C_ID_GEN.NEXTVAL FROM DUAL;

CREATE SEQUENCE A_ID_GEN
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1;
    /

CREATE OR REPLACE PROCEDURE NEW_BANKER
(ID IN NUMBER, FN IN VARCHAR2, LN IN VARCHAR2, UN IN VARCHAR2, PW IN VARCHAR2, AD IN VARCHAR2, PNUM IN VARCHAR2)
AS
BEGIN
    INSERT INTO BANK_CUSTOMER VALUES(ID,FN,LN,UN,PW,AD,PNUM, '0');
    COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE NEW_ACCT
(ID IN NUMBER, AID IN NUMBER)
AS
BEGIN
    UPDATE BANK_CUSTOMER SET APP_STATUS = 'APPROVED' WHERE C_ID = ID;
    INSERT INTO ACCOUNTS VALUES(AID, ID, NULL, 0);
END;
/

CREATE OR REPLACE PROCEDURE NEW_LOGIN
( UNAME IN VARCHAR2, PWORD IN VARCHAR2, TIPE IN VARCHAR2)
AS
BEGIN
    INSERT INTO LOGIN_INFO VALUES(UNAME,PWORD,TIPE);
    COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE ACCT_ACTION
(ID IN INT, BAL IN NUMBER)
AS
BEGIN
    UPDATE ACCOUNTS SET BALANCE = BAL WHERE A_ID = ID;
END;
/

CREATE OR REPLACE PROCEDURE DELETE_HELP
(ID IN INT)
AS
BEGIN
    DELETE FROM ACCOUNTS WHERE C_ID = ID;
END;
/
CREATE OR REPLACE PROCEDURE DELETE_HELP2
(ID IN INT)
AS
BEGIN
    DELETE FROM BANK_CUSTOMER WHERE C_ID = ID;
END;
/

EXECUTE NEW_BANKER(15, 'BILL', 'KILL', 'FLUFFY', 'KID', '1234 BIG LANE', '843-193-1934');
SELECT C_ID, FNAME, LNAME FROM BANK_CUSTOMER WHERE APP_STATUS = '0';
--EXECUTE NEW_ACCT(15, 20);
DELETE FROM BANK_CUSTOMER WHERE C_ID = 7;
--DELETE FROM ACCOUNTS WHERE A_ID = 20;
commit;
INSERT INTO LOGIN_INFO VALUES('admin', 'admin', 'ADMIN', NULL);
COMMIT;
DELETE FROM LOGIN_INFO WHERE USERNAME = 'starkjosh';
ALTER TABLE LOGIN_INFO DROP COLUMN C_ID;
COMMIT;

