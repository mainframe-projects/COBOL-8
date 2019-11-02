      ******************************************************************
      * Author: Queen of Cobol
      * Date: March 2, 2015
      * Purpose: READ CSV
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. READ-CSV.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT datain
           ASSIGN TO DISC
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL.

           SELECT dataout
           ASSIGN TO DISC
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  datain.
       01  INPUT-RECORD        PIC X(80).
       FD  dataout.
       01  OUTPUT-RECORD.
           05 OUT-LAST-NAME     PIC X(15).
           05 FILLER            PIC X(5).
           05 OUT-FIRST-NAME    PIC X(10).
           05 FILLER            PIC X(5).
           05 OUT-STREET        PIC X(25).
           05 FILLER            PIC X(5).
           05 OUT-CITY          PIC X(10).
           05 FILLER            PIC X(5).
           05 OUT-STATE         PIC XX.
           05 FILLER            PIC X(5).
           05 OUT-ZIP           PIC X(10).


       WORKING-STORAGE SECTION.
       01  SEPARATE-IT.
           05 LAST_NAME        PIC X(25).
           05 FIRST_NAME       PIC X(15).
           05 STREET_ADDR      PIC X(30).
           05 CITY             PIC X(15).
           05 STATE            PIC XX.
           05 ZIP              PIC X(10).
       PROCEDURE DIVISION.
       START-ROUTINE.
           OPEN INPUT datain.
           OPEN OUTPUT dataout.
       READ-ROUTINE.
           MOVE SPACES TO INPUT-RECORD.
           READ datain AT END GO TO END-ROUTINE.
           MOVE SPACES TO SEPARATE-IT.
           UNSTRING INPUT-RECORD DELIMITED BY "~"
              INTO LAST_NAME, FIRST_NAME, STREET_ADDR,
              CITY, STATE, ZIP.
           MOVE SPACES TO OUTPUT-RECORD.
           MOVE LAST_NAME TO OUT-LAST-NAME.
           MOVE FIRST_NAME TO OUT-FIRST-NAME.
           MOVE STREET_ADDR TO OUT-STREET.
           MOVE CITY TO OUT-CITY.
           MOVE STATE TO OUT-STATE.
           MOVE ZIP TO OUT-ZIP.
           WRITE OUTPUT-RECORD.
           GO TO READ-ROUTINE.
       END-ROUTINE.
           CLOSE datain.
           CLOSE dataout.
           STOP RUN.
