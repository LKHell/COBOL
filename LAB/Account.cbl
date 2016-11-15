      *>----------------------------------------------------------------
      *>  ATM Project - 2015
      *>----------------------------------------------------------------

      *>----------------------------------------------------------------
      *> Class description
      *>----------------------------------------------------------------
       class-id. Account data is protected
                   inherits from Base.

       object section.
       class-control.
           Account is class "Account".

       object.
       object-storage section.

      *>----------------------------------------------------------------
       Method-id. verifyAccount.
      *>----------------------------------------------------------------
       Linkage Section.
         77 ls-customer-id        pic 9.
         77 ls-account-no         pic 9.

       Procedure Division using  ls-customer-id
                          Returning ls-account-no.

           Call "request-account" using
                                  by content ls-customer-id
                                  by reference ls-account-no

           if ls-account-no is equal to 0
           then
                display "------------------------------"
                display "       Invalid Option"
                display "------------------------------"
           end-if.
       exit method.
       end method  verifyAccount.
      *>----------------------------------------------------------------

       End object.

       End class Account.



