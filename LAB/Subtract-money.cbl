       Identification Division.
       Program-id. Subtract-money.

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
         77 ls-account-no             pic 9.
         77 ls-amount                 pic 999.
         01 bool     pic 9.
            88  exist  value 1.
            88  not-exist  value zero.

       Screen Section.
       01 erase-screen.
           05 blank screen
              foreground-color 15
              background-color 9.

      *>----------------------------------------------------------------
       Procedure division using ls-account-no
                                ls-amount
                                bool.


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
               if account-balance is less than ls-amount
                   then
                       display erase-screen
                       display "|-----------------------------------|"
                       display "|                                   |"
                       display "|        Insufficient Funds         |"
                       display "|                                   |"
                       display "|    Please check your account      |"
                       display "|                                   |"
                       display "|-----------------------------------|"
                       stop space
                    else
                       subtract ls-amount
                                from   account-balance
                       rewrite account
               end-if.
       close archivoAccounts.
      *>----------------------------------------------------------------

       end program Subtract-money.
