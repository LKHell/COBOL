
       Identification Division.
       Program-id. Pin-Changer.

       Environment Division.
       Input-Output Section.
       File-Control.

       Select archivoCustomer assign to "customer.dat"
           organization is indexed
           access is dynamic
           record key is customer-id.

       Data Division.

       File Section.
       FD archivoCustomer.
       01 registro.
           05 customer-id          pic 9.
           05 customer-name        pic x(10).
           05 customer-city        pic x(10).
           05 customer-account-no  pic 9.
           05 customer-pin         pic 9.

       working-storage section.
       77 newPin-A           pic 9.
       77 newPin-B           pic 9.
       77 i                  pic 9.

       Linkage Section.
       77 ls-old-pin            pic 9.
       77 ls-customer-id        pic 9.

       Screen Section.
       01 erase-screen.
           05 blank screen
              foreground-color 15
              background-color 9.


       Procedure Division using ls-old-pin
                                ls-customer-id.
       move 3 to i.
       perform menu-pin.
       exit program.


      *>----------------------------------------------------------------
      *>----------------------------------------------------------------
       menu-pin.
      *>----------------------------------------------------------------
      *> 进入menu-pin代码 ？

       move ls-old-pin to customer-id
       open i-o archivoCustomer
            read archivoCustomer record into registro
                                         key is customer-id
              not invalid key

               display "Please enther your old Pin ：" no advancing
               accept  newPin-A
               if newPin-A is equal to ls-old-pin
               then
                     perform  change-pin
               end-if


               perform until ( newPin-A is equal to ls-old-pin )
               or ( i = 0 )
               if newPin-A is equal to ls-old-pin
               then
                     perform  change-pin
               else
                     compute i = i - 1
               display "Please enther your old Pin ：" no advancing
               accept  newPin-A

               end-if
               end-perform
               .
       close archivoCustomer.

      *>----------------------------------------------------------------

      *>----------------------------------------------------------------
       change-pin.
      *>----------------------------------------------------------------
      *> 进入change-pin代码 ？

               display "Please enter your new pin : " no advancing
               accept  newPin-A

               display "Retype your new pin : " no advancing
               accept  newPin-B

               perform until ( newPin-A is equal to newPin-B )
               or ( i = 0 )
               if ( newPin-A is equal to newPin-B )
                 then
                   display space
                   move newPin-A to customer-pin
                   rewrite  registro
                   display  "Sucessed"
                 else
                   compute i = i - 1
                  display "Please enter your new pin : " no advancing
                  accept  newPin-A
                  display "Retype your new pin : " no advancing
                  accept  newPin-B
               end-if
               end-perform
               .

      *>---------------------------------------------------------------

       end program Pin-Changer.



