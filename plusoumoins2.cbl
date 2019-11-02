      ******************************************************************
      * Author: Michael Pirali
      * Date: 2019/10/13
      * Purpose: add 'pla-restart'
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
       77 play PIC x.
       77 iCola PIC 9(2) VALUE 30.
       77 iColb PIC 9(2) VALUE 33.

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

           01 pla-normal.
               02 LINE 9 COL 10 VALUE 'Vous avez trouvé en '.
               02 COL iCola PIC zz FROM i.
               02 COL iColb VALUE 'essais !'.

           01 pla-lucky.
               02 LINE 9 COL 10 VALUE 'Vous avez trouvé du premier '.
               02 VALUE 'coup !!'.

           01 pls-restart.
               02 LINE 11 COL 10 VALUE 'Voulez-vous rejouer ? O/N '.
               02 COL 37 PIC x TO play REQUIRED.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           INITIALIZE userNumber

           PERFORM UNTIL play = 'n' OR 'N'
               MOVE FUNCTION CURRENT-DATE(9:8) TO seed

               COMPUTE randNumber = FUNCTION RANDOM (seed) * 100 + 1

               DISPLAY pla-instruction

               PERFORM UNTIL userNumber = randNumber
                   MOVE 0 TO userNumber
                   COMPUTE i = i + 1
                   DISPLAY pls-reponse
                   ACCEPT pls-reponse
                   IF userNumber < randNumber THEN
                       DISPLAY pla-inf
                   ELSE
                       IF userNumber > randNumber THEN
                           DISPLAY pla-sup
                       ELSE
                           IF i > 9 THEN
                               MOVE 31 TO iCola
                               MOVE 34 TO iColb
                           ELSE
                               MOVE 30 TO iCola
                               MOVE 33 TO iColb
                           END-IF
                           DISPLAY pla-win
                           IF i = 1 THEN
                               DISPLAY pla-lucky
                           ELSE
                               DISPLAY pla-normal
                           END-IF
                       END-IF
                   END-IF
               END-PERFORM
               MOVE 0 TO i
               MOVE ' ' TO play

               PERFORM UNTIL play = 'o' OR 'O' OR 'n' OR 'N'
                   DISPLAY pls-restart
                   ACCEPT pls-restart
               END-PERFORM

           END-PERFORM

           STOP RUN.
       END PROGRAM PLUS-OU-MOINS.
