      * Author: Michael Pirali
      * Date: 2019/10/13
      * Purpose: test ACCEPT
      * Tectonics: cobc
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. MyFirstCOBOL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 nom PIC x(25).


       SCREEN SECTION.
           1 pla-titre.
               2 BLANK SCREEN.
               2 LINE 6 COL 10 VALUE 'Hey !'.

           1 pls-nom.
               2 LINE 8 COL 10 VALUE 'Quel est ton nom ? '.
               2 PIC x(25) TO nom REQUIRED.

           1 pla-nom.
               2 LINE 10 COL 10 VALUE 'Salut'.
               2 COL 16 PIC x(25) FROM nom.

       PROCEDURE DIVISION.

      *> On affiche le nom de notre programme
       DISPLAY pla-titre.

      *> Ensuite on affiche le formulaire de saisie
       DISPLAY pls-nom.
       ACCEPT pls-nom.
       DISPLAY pla-nom.
       DISPLAY '.'.

       STOP RUN.
