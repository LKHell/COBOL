      *>----------------------------------------------------------------
      *>  ATM Project - 2015
      *>----------------------------------------------------------------

       Identification Division.
       Program-id. IdentifiesATM.

       Environment Division.
       Input-Output Section.
       File-Control.

       Select archivoATM assign to "atm.dat"
           organization is indexed
           access is dynamic
           record key is atm-id.

       Data Division.
       File Section.

       FD archivoATM.
       01 atm.
           05 atm-id           pic 9.
           05 atm-location     pic x(10).

       working-storage section.

       Linkage Section.
         77 ls-atm-id        pic 9.
         77 ls-atm-location  pic x(10).

       Procedure division using ls-atm-id ls-atm-location.
           move ls-atm-id to atm-id.
           open input archivoATM.
           read archivoATM key is atm-id
                   not invalid key
                       move atm-location to ls-atm-location
           end-read.
           close archivoATM.


