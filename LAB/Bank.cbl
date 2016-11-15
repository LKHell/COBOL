      *>----------------------------------------------------------------
      *>  ATM Project - 2015
      *>----------------------------------------------------------------

      *>------------------------------
      *> Class description
      *>------------------------------
       class-id. Bank data is protected
                   inherits from Base.

       object section.
       class-control.
           Bank is class "Bank".

       class-object.
      *object-storage section

       Working-storage section.

      *>----------------------------------------------------------------
       Method-id. manages.
      *>----------------------------------------------------------------
       local-storage section.
       77 bank-id pic 9 value 1.

       Linkage Section.
       77 ls-bank-name        pic x(10).

       Procedure Division
                         Returning ls-bank-name.
            Call "IdentifiesBank" using by content bank-id
                                        by reference ls-bank-name

         exit method.
       End Method manages.
      *>----------------------------------------------------------------
       end class-object.
       end class Bank.




