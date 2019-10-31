;; macro definition file

(define-syntax display-wasnull 
  (syntax-rules ()
    ((_ rs)  (begin
	       (debug-display "BiglooCode.scm :: ResultatMesuresF : = (java.sql.ResultSet-wasNull rs):")
	       (debug-display (java.sql.ResultSet-wasNull rs))
	       (debug-newline)))))


;; (define-syntax error 
;;   (syntax-rules ()
;;     ((_ arg1 arg2 arg3 ...)
;;      (error arg1 arg2 arg3))))
