      *>----------------------------------------------------------------
       Identification division.
      *>----------------------------------------------------------------
       program-id. ATM.

      *>----------------------------------------------------------------
       Environment division.
      *>----------------------------------------------------------------
       object section.
       class-control.
           Menu           is class "Menu"
           Account        is class "Account"
           DebitCard      is class "DebitCard"
           .
      *>----------------------------------------------------------------
       Data division.
      *>----------------------------------------------------------------
       Working-storage section.
       77 userPin               pic 9.
       77 accountType           pic 9.
       77 amountType            pic 9.
       77 amountMoney           pic 999.
       77 accountNumber         pic 9.
       77 accountTransfer       pic 9.
       77 customerID            pic 9.
       77 transactionType       pic 9.
       77 transactionDate       pic 9(6).
       01 bool                  pic 9.
          88  exist  value 1.
          88  not-exist  value zero.
       01 menuObject            object reference.
       01 accountObject         object reference.
       01 debitCardObject       object reference.

       Screen Section.
       01 erase-screen.
           05 blank screen
              foreground-color 1
              background-color 7.

      *>----------------------------------------------------------------
       Procedure division.
      *>----------------------------------------------------------------
           perform create-objects.
           perform menu-identification.
           perform getAccountNo.
           perform menu-transactions.
           stop run
           .
      *>-----------创造对象----------------------------------------

       create-objects.
           Invoke Menu        "New" returning menuObject.
           Invoke Account     "New" returning accountObject.
           Invoke DebitCard   "New" returning debitCardObject
           .
      *>----------------------------------------------------------------
       *>判断密码,1为正确，其他为误（同时终止程序运行）

       menu-Identification.
           display erase-screen
           invoke  menuObject "ATM-title"
           display "    PIN ? : " no advancing
           Accept  userPin
           if userPin is zero
              then stop run
              else perform getCustomerId
           end-if
           .
      *>----------------------------------------------------------------
       *>连接上一函数，获取ID，用到debitcard class

       getCustomerId.
           Invoke debitCardObject "Acces" using userPin
                                          returning customerID
           if customerID is equal to zero
           then
                display space
                stop " --- Invalid Card ID ! ---"
                perform menu-identification
           end-if
           .
      *>----------------------------------------------------------------

      *>----------------------------------------------------------------
        getAccountNo.
      *>----------第三步------------读取账户-------------------------
           Invoke accountObject "verifyAccount"
                              using customerID
                              returning accountNumber
           if accountNumber is equal to zero
           then  display space
      *> 进入if代码 ？
                stop " --- Invalid Account Number ! ---"
                perform menu-identification
           end-if
           .
      *>----------------------------------------------------------------


      *>----------------------------------------------------------------
       menu-transactions.
      *>----------------------------------------------------------------
           display erase-screen
           invoke  menuObject "main-menu"
           display "    option ? : " no advancing
           accept  amountType.
           evaluate amountType
             when 1 display space perform menu-withdraw
      *> 进入evaluate代码 ？
             when 2 display space perform menu-deposit
             when 3 display space perform menu-query
             when 4 display space perform menu-transfer
             when 5 display space perform menu-changepin
             when 0 perform stop run
             when other perform menu-transactions
           end-evaluate
           .
      *>----------------------------1-----------------------------------

       menu-withdraw.
           display erase-screen.
           invoke  menuObject "withdraw-menu".
           perform performTransaction.
           set exist to true.
           Call "Subtract-money" using
                                  by content accountNumber
                                             amountMoney
                                  by reference bool.
           if exist then perform menu-query
           end-if
           .

      *>----------------------------2-----------------------------------
       menu-deposit.
      *> 进入menu-deposit代码 ？
           display erase-screen.
           invoke menuObject "deposit-menu".
           perform performTransaction.
           set exist to true.
           Call "Add-money" using
                             by content accountNumber
                                        amountMoney
                             by reference bool.
           if exist then perform menu-query
           end-if
           .

      *>----------------------------3-----------------------------------




       menu-query.
           Accept transactionDate from date.
           Call "Print-Query"
                   using
                   by content accountNumber
                              transactionDate.
           perform menu-transactions
           .

      *>----------------------------4-----------------------------------


       menu-transfer.

      *> 进入menu-transfer代码 ？(直接调用subtract 和add )
           display erase-screen.
           invoke  menuObject "transfer-menu"
           display " Account Number : " no advancing
           accept accountTransfer
                      invoke menuObject "choice-menu"
           perform performTransaction.
           set exist to true.
           Call "Subtract-money" using
                                  by content accountNumber
                                             amountMoney
                                  by reference bool.
           Call "Add-money" using
                                  by content accountTransfer
                                             amountMoney
                                  by reference bool.
           if exist then perform menu-query
           end-if
           .
      *>----------------------------5-----------------------------------
       menu-changepin.

      *> 进入menu-changepin代码 ？
           display erase-screen
           invoke menuObject "pin-menu"
           display "    PIN ? : " no advancing
           Accept  userPin
           Call "Pin-Changer" using userPin
                              returning customerID
           perform menu-transactions

           .

      *>----------------------------------------------------------------

       performTransaction.
           display "    option ? : " no advancing
           accept  transactionType.
           evaluate transactionType
               when 1 perform move 50  to amountMoney
               when 2 perform move 100 to amountMoney
               when 3 perform move 200 to amountMoney
               when 4 perform move 500 to amountMoney
               when other perform menu-transactions
           end-evaluate
           .
