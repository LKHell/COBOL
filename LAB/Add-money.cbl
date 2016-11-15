
       Identification Division.
       Program-id. Add-money.

       Input-Output Section.
       File-Control.

       Select archivoAccounts assign to "account.dat"
           organization is indexed
           access is dynamic
           record key is account-no
           alternate key is account-owner-id.

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
         77 ls-account-no          pic 9.
         77 ls-amount              pic 999.
         01 bool                   pic 9.
            88  exist  value 1.
            88  not-exist  value zero.
      *>----------------------------------------------------------------
       Procedure division using ls-account-no
                                ls-amount
                                bool.

      *> ½øÈë´úÂë £¿ change by subtract-money
       move ls-account-no to account-no.
       open i-o archivoAccounts
           read archivoAccounts record into account
                                        key is account-no

                      invalid key
                          set not-exist to true
                          stop space
                          stop " Account does not Exist!"
                      not invalid key
                          set exist to true
                       add ls-amount
                       to   account-balance
                       rewrite account
       close archivoAccounts.





      *>----------------------------------------------------------------

       end program Add-money.

