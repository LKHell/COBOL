      *>----------------------------------------------------------------
      *>  ATM Project - 2015
      *>----------------------------------------------------------------

      *>----------------------------------------------------------------
      *> Class description
      *>----------------------------------------------------------------
       class-id. DebitCard data is protected
                   inherits from Base.

       object section.
       class-control.
           DebitCard is class "DebitCard".


       object.
       object-storage section.

      *>----------------------------------------------------------------
       Method-id. Acces.
      *>----------------------------------------------------------------
       Linkage Section.
         77 ls-userPin               pic 9.
         77 ls-customer-id           pic 9.

       Procedure Division using ls-userPin               
                          Returning ls-customer-id.
         Call "Valida-Acceso" using
                        by content ls-userPin
                        by reference ls-customer-id
       exit method
       End Method Acces.
      *>----------------------------------------------------------------
       End object.

       End class DebitCard.
