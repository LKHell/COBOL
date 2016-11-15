      *>----------------------------------------------------------------
       Identification Division.
       Program-id. Valida-Acceso.

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
           05 customer-id        pic 9.
           05 customer-name      pic x(10).
           05 customer-city      pic x(10).
           05 customer-card-no   pic 9.
           05 customer-pin       pic 9.

       working-storage section.
       01  fileEnd  pic 9.
           88  eof  value zero.
           88  not-eof  value 1.

       Linkage Section.
       77 ls-customer-pin  pic 9.
       77 ls-customer-id   pic 9.

       Procedure division using ls-customer-pin
                                ls-customer-id.
      *>----------------------------------------------------------------

      *> ½øÈë´úÂë £¿
       main-procedure.
           move ls-customer-pin to customer-id
           open input archivoCustomer
           read archivoCustomer key is customer-id
                   invalid key
                       move 0           to ls-customer-id
                   not invalid key
                       move customer-id to ls-customer-id
           end-read.
           close archivoCustomer.

       .
      *>----------------------------------------------------------------


       end program Valida-Acceso.

