      *>----------------------------------------------------------------
      *>  ATM Project - 2015
      *>----------------------------------------------------------------

      *>------------------------------
      *> Class description
      *>------------------------------
       class-id. ATM-Info data is protected
                   inherits from Base.

       object section.
       class-control.
           ATM-Info is class "ATM-Info".

       class-object.

       Working-storage section.

      *>----------------------------------------------------------------
       Method-id. identifies.
      *>----------------------------------------------------------------
       local-storage section.
       77 atm-id pic 9 value 1.

       Linkage Section.
       77 ls-atm-location   pic x(10).

       Procedure Division
                       Returning ls-atm-location.

            Call "IdentifiesATM" using
                                       by content atm-id
                                       by reference ls-atm-location

         exit method.
       End Method identifies.
      *>----------------------------------------------------------------
       end class-object.
       end class ATM-Info.



