      
       Identification Division.
       Program-id. Print-Query.

       Environment Division.
       object section.
       class-control.
           Bank is class "Bank"
           ATM-Info is class "ATM-Info".

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
      *77 print-balance         pic $$$,$$$,$$9.99.
       77 print-balance         pic 9(10).
       77 bank-name             pic x(10).
       77 atm-location          pic x(10).
       77 print-date            pic zz99/99/99.
       78 dash-line  value "------------------------------------".

       Linkage Section.
         77 ls-account-no           pic 9.
         77 ls-transactionDate      pic 9(6).

       Screen Section.
       01 erase-screen.
           05 blank screen
              foreground-color 15
              background-color 9.

       Procedure division using ls-account-no
                                ls-transactionDate.
           Invoke Bank "manages"
                       returning bank-name.

           Invoke ATM-Info "identifies"
                       returning atm-location.
           perform statement.
           exit program
           .

      *>----------------------------------------------------------------
       menu-consult.
      *>----------------------------------------------------------------
           display erase-screen.
           display space.
           display "  Bank name : " bank-name.
           display dash-line.
           display "           Statement"
           display dash-line.
           display space.
           display "   ATM  : " atm-location.
           display space.
           display "   DATE : " print-date.
           display space.
           display dash-line.
           display space.
           display " Transaction type: Querying  ".
           display space.
      *>----------------------------------------------------------------


      *>----------------------------------------------------------------
       statement.
      *>----------------------------------------------------------------
           move ls-account-no to account-no.
           open input archivoAccounts.
           read archivoAccounts
                      key is account-no
           end-read.
           close archivoAccounts.
           move ls-transactionDate to print-date.
           perform menu-consult.
           display " Account : ".
           display "   no : " account-no no advancing
           display "              type : " account-type
           display space
           display "   owner : " account-owner no advancing
           display "  ID : " account-owner-id
           display space
           move account-balance to print-balance
           display " Balance : " print-balance
           display space.
           display dash-line.

         stop " Press any key..."
         .
      *>----------------------------------------------------------------


       end program Print-Query.


