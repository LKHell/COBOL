      *>----------------------------------------------------------------
      *>  ATM Project - 2015
      *>----------------------------------------------------------------


       Identification Division.
       Program-id. IdentifiesBank.

       Environment Division.
       Input-Output Section.
       File-Control.

       Select archivoBank assign to "bank.dat"
           organization is indexed
           access is dynamic
           record key is bank-id.

       Data Division.
       File Section.

       FD archivoBank.
       01 bank.
           05 bank-id          pic 9.
           05 bank-name        pic x(10).
           05 bank-city        pic x(10).

       working-storage section.

       Linkage Section.
         77 ls-bank-id         pic 9.
         77 ls-bank-name       pic x(10).

       Procedure division using ls-bank-id ls-bank-name.
           move ls-bank-id to bank-id.
           open input archivoBank 
           read archivoBank key is bank-id
                   not invalid key
                       move bank-name to ls-bank-name
           end-read.
           close archivoBank.


