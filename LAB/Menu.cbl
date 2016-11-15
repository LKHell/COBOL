      *>----------------------------------------------------------------
      *> Class description
      *>----------------------------------------------------------------
       class-id. Menu data is protected
                   inherits from Base.

       object section.
       class-control.
           Menu is class "Menu".


       object.
       object-storage section.
       77 dash-line     pic x(35) value all "-".
       77 blank-space   pic x(7) value all " ".

      *>----------------------------------------------------------------
       Method-id. ATM-title.
      *>----------------------------------------------------------------
       Procedure Division.
         display space
         display dash-line
         display "   ATM_byLiKunhao"
         display dash-line
         display space
         .
       End Method ATM-title.
      *>----------------------------------------------------------------

      *>----------------------------------------------------------------
       Method-id. main-menu.
      *>----------------------------------------------------------------
       Procedure Division.
         display dash-line
         display blank-space "main menu"
         display dash-line
         display space
         display "    1-Withdraw" blank-space "  2-Deposit"
         display space
         display "    3-Query   " blank-space "  4-Transfer"
         display space
         display "    5-Modify PIN" blank-space "0-Exit"
         display space
         display dash-line
         .
       End Method main-menu.
      *>----------------------------------------------------------------

       Method-id. account-menu.
      *>----------------------------------------------------------------
       Procedure Division.
         display dash-line
         display blank-space "Account menu"
         display dash-line
         display space
         display "    1-Saving" blank-space "2-Current"
         display space
         display dash-line
         .
       End Method account-menu.
      *>----------------------------------------------------------------

      *>----------------------------------------------------------------
       Method-id. withdraw-menu.
      *>----------------------------------------------------------------
       Procedure Division.
         display dash-line
         display blank-space "withdraw menu"
         invoke self "choice-menu"
         .
       End Method withdraw-menu.
      *>----------------------------------------------------------------

      *>----------------------------------------------------------------
       Method-id. deposit-menu.
      *>----------------------------------------------------------------
       Procedure Division.
         display dash-line
         display blank-space "deposit menu"
         invoke self "choice-menu"
         .
       End Method deposit-menu.
      *>----------------------------------------------------------------

      *>----------------------------------------------------------------
       Method-id. transfer-menu.
      *>----------------------------------------------------------------
       Procedure Division.
         display dash-line
         display blank-space "transfer menu"
         display dash-line
         display space
         display "    Enter the destination account ?"
         display space
         display dash-line
         .
       End Method transfer-menu.
      *>----------------------------------------------------------------

      *>----------------------------------------------------------------
       Method-id. pin-menu.
      *>----------------------------------------------------------------
       Procedure Division.
         display dash-line
         display blank-space "change pin menu"
         display dash-line
         display space
         display "    Enter the old pin ..."
         display space
         display dash-line
         .
       End Method pin-menu.
      *>----------------------------------------------------------------

      *>----------------------------------------------------------------
       Method-id. choice-menu.
      *>----------------------------------------------------------------
       Procedure Division.
         display dash-line
         display space
         display "    1.  50$   " blank-space "2. 100$"
         display space
         display "    3. 200$   " blank-space "4. 500$"
         display space
         display dash-line
         .
       End Method choice-menu.
      *>----------------------------------------------------------------

       End object.

       End class Menu.
