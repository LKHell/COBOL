
      *>----------------------------------------------------------------
      *>  ATM Project - 2015
      *>----------------------------------------------------------------
       Identification Division.
       Program-id. request-account.

       Environment Division.
       Input-Output Section.
       File-Control.

       Select archivoAccounts assign to "account.dat"
           organization is indexed
           access is dynamic
           record key is account-no
           alternate record key is account-owner-id.

       Data Division.

       File Section.
       FD archivoAccounts.
       01 account.
           05 account-no        pic 9.
           05 account-type      pic 9.
           05 account-owner-id  pic 9.
           05 account-owner     pic x(10).
           05 account-balance   pic 9(10).

       working-storage section.

       Linkage Section.
         77 ls-customer-id          pic 9.
         77 ls-account-no           pic 9.

       Procedure division using ls-customer-id
                                ls-account-no.

      *>----------------------------------------------------------------
       modulo-principal.
      *>----------------------------------------------------------------
       *> ½øÈë´úÂë £¿
           move ls-customer-id to account-no
           open input archivoAccounts
               read archivoAccounts key is account-no
                     invalid key
                         move 0 to ls-account-no
                     not invalid key
                         move account-no to ls-account-no
               end-read
           close archivoAccounts.

      *>---------------


       end program request-account.


