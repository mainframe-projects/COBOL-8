      ******************************************************************
      * Author: Michael Pirali
      * Date: 2019/10/13
      * Purpose: basic knowledge test
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PLUS-OU-MOINS.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 userNumber PIC 9(3).
       77 seed PIC 9(8) VALUE 0.
       77 randNumber PIC 9(3).
       77 i PIC 9(2).

       SCREEN SECTION.
           01 pla-instruction.
               02 BLANK SCREEN.
               02 LINE 3 COL 10 VALUE 'Veuillez entrer un nombre '.
               02 VALUE 'compris entre 1 et 100 :'.

           01 pls-reponse.
               02 LINE 5 COL 10 VALUE 'Nombre : '.
               02 PIC zzz TO userNumber REQUIRED.

           01 pla-inf.
               02 LINE 7 COL 10 VALUE 'Votre nombre est trop petit'
               FOREGROUND-COLOR 4
               BACKGROUND-COLOR 15.

           01 pla-sup.
               02 LINE 7 COL 10 VALUE 'Votre nombre est trop grand'
               FOREGROUND-COLOR 15
               BACKGROUND-COLOR 4.

           01 pla-win.
               02 LINE 7 COL 10 VALUE '     B I N G O             '.
               02 LINE 9 COL 10 VALUE 'Vous avez trouvé en '.
               02 COL 30 PIC zz FROM i.
               02 COL 33 VALUE 'essais !'.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           INITIALIZE userNumber.

           MOVE FUNCTION CURRENT-DATE(9:8) TO seed.

           COMPUTE randNumber = FUNCTION RANDOM (seed) * 100 + 1.

           DISPLAY pla-instruction.

           PERFORM UNTIL userNumber = randNumber
               COMPUTE i = i + 1
               DISPLAY pls-reponse
               ACCEPT pls-reponse
               IF userNumber < randNumber THEN
                   DISPLAY pla-inf
               ELSE
                   IF userNumber > randNumber THEN
                       DISPLAY pla-sup
                   ELSE
                       DISPLAY pla-win
                   END-IF
               END-IF
           END-PERFORM

           STOP RUN.
       END PROGRAM PLUS-OU-MOINS.
