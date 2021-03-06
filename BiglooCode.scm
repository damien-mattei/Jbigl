;; Bigloo Scheme code for java virtual machine and tomcat web server

;; author: Damien Mattei

;; compile with:
;;
;; cd bigloo4.2c/examples/Jbigl
;; make
;;
;;
;; building a jar library for netbeans:
;; jar cf ~/Dropbox/BiglFunctProg.jar eu
;;
;; only to be done the first time:
;; how to make bigloo_s.zip usable by tomcat server:
;; mkdir tmp
;; cd tmp
;; unzip /usr/local/lib/bigloo/4.1a/bigloo_s.zip
;; jar cf bigloo-4.1.jar bigloo/
;; deploy bigloo*.jar with web application





(module eu.oca.bigloofunct.BiglooCode 

	
	(include "macro.scm")

	;(include "../../../Dropbox/git/library-FunctProg/bigloo/error-bigloo-scheme.scm")
	;(include "../../../Dropbox/git/library-FunctProg/check-arg.scm")
	;(include "../../../Dropbox/git/library-FunctProg/let.scm")
	;(include "../../../Dropbox/git/library-FunctProg/bigloo/srfi-14-character-set-bigloo-scheme.scm")

	;(include "../../../Dropbox/git/library-FunctProg/srfi/srfi-13-s48-module.scm")
	;(include "../../../Dropbox/git/library-FunctProg/srfi/srfi-13.scm")
	(include "../../../Dropbox/git/library-FunctProg/syntactic-sugar.scm") ;; YES in bigloo you can include files from other schemes...
	
	;;(include "../../../Dropbox/git/library-FunctProg/display-bigloo-scheme.scm")
	
	(include "../../../Dropbox/git/library-FunctProg/bigloo/escape-char-bigloo-scheme.scm")

	(include "../../../Dropbox/git/library-FunctProg/display.scm")
	(include "../../../Dropbox/git/library-FunctProg/first-and-rest.scm")
	(include "../../../Dropbox/git/library-FunctProg/second-third-and-co.scm")

	(include "../../../Dropbox/git/library-FunctProg/debug.scm")

	;; (include-relative "../../../Dropbox/git/library-FunctProg/syntactic-sugar.scm") ;; YES in bigloo you can include files from other schemes...
	;; (include-relative  "../../../Dropbox/git/library-FunctProg/display.scm")
	;; (include-relative  "../../../Dropbox/git/library-FunctProg/debug.scm")

	;; (include "../../../Dropbox/lib/syntactic-sugar.scm") ;; YES in bigloo you can include files from other schemes...
	;; (include "../../../Dropbox/lib/display.scm")
	;; (include "../../../Dropbox/lib/debug.scm")
	
	;;(include "ResultSet.scm")
	;; java jigloo -r -skip-nested-classes -no-transient -no-volatile -o ../examples/Jbigl/jigloo-generated-ResultSet.scm java.sql.ResultSet
	(include "jigloo-generated-ResultSet.scm")

	;; java jigloo -r -skip-nested-classes -no-transient -no-volatile -o ../examples/Jbigl/jigloo-generated-String.scm java.lang.String
	;;(include "jigloo-generated-String.scm")

	(java 
	 
	 ;;(class %jobject "java.lang.Object")
	 ;;(class %jstring::%jobject "java.lang.String")


	 ;; (class %jresultset 
	 ;; 	(method next::bool (::%jresultset) "next") 
	 ;; 	(method abstract public  last::bool (::%jresultset )  "last")
	 ;; 	(method abstract public  getRow::int (::%jresultset )  "getRow")

	 ;; 	"java.sql.ResultSet")
	 
	 ;;(array int* ::int)
	 (array byte* ::byte) ;; peux t'on utiliser string a la place (cf awt.scm)
	 (array byte** ::byte*)
	 
	 ;;(array string* ::string)
	 ;;(array jstring* ::%jstring)
	 
	 (class eu.oca.bigloofunct.JavaForBigloo
		(method static hello::int (::int*) "hello")
		(method static displayByteArrayString::void (::byte**) "displayByteArrayString") ;; java name
		;;(method static bstring->jstring::%jstring (::byte*) "bstring_to_jstring");; java name
		;;(method static bstring->jstring::%jstring (::string) "bstring_to_jstring");; java name
		(method static bstring->jstring::java.lang.String (::string) "bstring_to_jstring");; java name 
		(method static jstring->bstring::string (::java.lang.String) "jstring_to_bstring");; java name 
		(method static pi2dec::double () "pi2dec")
		(method static piFloat::float () "piFloat")
		(method static jdouble->bstring::string (::double) "jdouble_to_bstring");; java name 
		(method static displayByteStringNL::void (::string) "displayByteStringNL");; java name 
		(method static displayDoubleNL::void (::double) "displayDoubleNL");; java name 
		(method static displayInt::void (::int) "displayInt");; java name 
		"eu.oca.bigloofunct.JavaForBigloo")

	 ;; (class eu.oca.bigloofunct.JavaForGlooGloo
	 ;; 	(method static hello::int (::int*) "hello")
	 ;; 	(method static displayByteArrayString::void (::byte**) "displayByteArrayString")
	 ;; 	"eu.oca.bigloofunct.JavaForGlooGloo")
	 
	 (class eu.oca.DataBase
		;;(method static DataBase::void (::void) "DataBase")
		(constructor new ())
		;;(field static resultSet::%jresultset "resultSet")
		(field static resultSet::java.sql.ResultSet "resultSet")
		(field static resultSet2::java.sql.ResultSet "resultSet2")
		(field static resultSetRequete::java.sql.ResultSet "resultSetRequete")
		(field static resultSetOrbite::java.sql.ResultSet "resultSetOrbite")
		(field static val::int "val")
		(method getval::int (::eu.oca.DataBase) "getval")
		;;(method getresultSet::%jresultset (::eu.oca.DataBase) "getresultSet")
		(method getresultSet::java.sql.ResultSet (::eu.oca.DataBase) "getresultSet")
		(method static searchDriverStatic::void () "searchDriverStatic")
		(method static deregisterDriverStatic::void () "deregisterDriverStatic")
		(method static setResultSetNull::void () "setResultSetNull")
		(method static setResultSet2Null::void () "setResultSet2Null")
		(method searchDriverDynamic::void (::eu.oca.DataBase) "searchDriverDynamic")
		(method static connectStatic::void () "connectStatic")
		(method connectDynamic::void (::eu.oca.DataBase) "connectDynamic")
		(method static closeStatic::void () "closeStatic")
		(method closeDynamic::void (::eu.oca.DataBase) "closeDynamic")
		(method static createStatementStatic::void () "createStatementStatic")
		(method createStatementDynamic::void (::eu.oca.DataBase) "createStatementDynamic")
		;;(method static executeQueryStatic::void (::%jstring) "executeQueryStatic")
		(method static executeQueryStatic::void (::java.lang.String) "executeQueryStatic") 
		(method static executeQueryStatic2args::void (::java.lang.String ::int) "executeQueryStatic")
		(method static executeQueryStaticStringString::void (::java.lang.String ::java.lang.String) "executeQueryStatic")
		;;(method executeQueryDynamic::void (::eu.oca.DataBase ::%jstring) "executeQueryDynamic")
		(method executeQueryDynamic::void (::eu.oca.DataBase ::java.lang.String) "executeQueryDynamic") 
		(method static readDataBase::void () "readDataBase")
		;;(method setResultSetNull::void () "setResultSetNull")
		"eu.oca.DataBase")

	 ) ;; end java



	
	(export (callback::int ::int))
	;(export (affichen::nil ::bstring))
	(export (affichen::nil ::byte*))
	(export (affiche::nil ::byte*))
	
	(export (squareJavaArray::int* ::int*))
	(export (displayArrayByteStar::nil  ::byte**))
	(export (displayReverseArrayByteStar::nil  ::byte**))
	(export (reverseArrayByteStar::byte**  ::byte**))

	(export (ResultatMesuresF::byte* ::byte* ::byte* ::byte*))
	(export (ResultatMesuresFbeta::byte* ::byte* ::byte*))
	(export (ResultatMesuresF2::byte* ::eu.oca.DataBase))
	(export (ResultatMesuresAF::byte* ::byte* ::byte* ::byte*))


	(main start)) ;; define the main routine called at startup

;; end module


;; macros 

;; for Kawa and Bigloo compatibility
;; does not works in bigloo: macros can not replace directives
;; (define-syntax include-relative 
;;   (syntax-rules ()
;;     ((_ fn) (include fn))))





;; (define-syntax when
;;   (syntax-rules ()
;;     ((_ pred b1 ...)
;;      (if-t pred (begin b1 ...)))))


;; (define-syntax while
;;   (syntax-rules ()
;;     ((_ pred b1 ...)
;;      (let loop () (when pred b1 ... (loop))))))



(define (start argv)
  
  (let* ((tab (make-int* 2))
	 (str (make-byte* 5))
	 (tabstr (make-byte** 3))
	 ;;(bstr::byte* " WORLD")
	 (bstr (make-byte* 5))
	 (bstr2 (make-byte* 5))
	 (v (make-vector 3))
	 (identificateur "Nom")
	 ;;(identificateur "")
	 ;;(objet "cocorico")
	 (objet "COU 1027")
	 (choixres "Orbite")
	 (bstr_identificateur (make-byte* (string-length identificateur)))
	 (bstr_objet (make-byte* (string-length objet)))
	 (bstr_choixres (make-byte* (string-length choixres))))
    

    (set! bstr_identificateur identificateur)
    (set! bstr_objet objet)

    (print "tab length: " (int*-length tab))
    (int*-set! tab 0 3)
    (int*-set! tab 1 6)
    (debug-display (int*-ref tab 1))
    (debug-newline)
    (set! str "HELLO")
    (debug-display "str : ")
    (debug-display str)
    (debug-newline)
    (byte**-set! tabstr 0 str)
    (debug-display "tabstr [0] : ")
    (debug-display (byte**-ref tabstr 0))
    (debug-newline)
    (vector-set! v 0 (byte**-ref tabstr 0))
    (debug-display "v [0] : ")
    (debug-display (vector-ref v 0))
    (debug-newline)
    ;;(byte**-set! tabstr 1 "HELLO") ; marche pas 
    ;;(string-set! str 0 "h") ; marche pas
    (set! bstr " WORLD")
    (set! bstr2 " !")
    (byte**-set! tabstr 1 bstr)
    (byte**-set! tabstr 2 bstr2)
    (set! v (java-array-byte*->scheme-vector tabstr))
    (debug-display "v : ")
    (debug-display v)
    (debug-newline)
    
    
    (debug-display "(java-array-int->scheme-vector tab) : ")
    (debug-display (java-array-int->scheme-vector tab))
    (debug-newline)
    (debug-display "(square-vector (java-array-int->scheme-vector tab)) : ")
    (debug-display (square-vector (java-array-int->scheme-vector tab)))
    (debug-newline)
  
    ;; call java methods
    (print (eu.oca.bigloofunct.JavaForBigloo-hello tab))
    ;;(eu.oca.bigloofunct.JavaForBigloo-bstring->jstring "hello boy")
   
    ;;(eu.oca.bigloofunct.JavaForGlooGloo-hello tab)
    
    (debug-newline)
    (debug-display "(eu.oca.bigloofunct.JavaForBigloo-displayByteArrayString tabstr)")
    (debug-newline)
    (eu.oca.bigloofunct.JavaForBigloo-displayByteArrayString tabstr)
    (debug-newline)
    
    (ResultatMesuresF bstr_identificateur bstr_objet bstr_choixres) ;; juste pour pas qu'il rale ,devrait etre bstr_choixres

;;    (ResultatMesuresFbeta bstr_identificateur bstr_objet)

    (debug-newline)

    ;;  (eu.oca.DataBase-searchDriverStatic)

    (debug-newline)

    ;; (ResultatMesuresF2 (eu.oca.DataBase-new))

    )
  
  )


;*---------------------------------------------------------------------*/
;*    callback ...                                                     */
;*---------------------------------------------------------------------*/
(define (callback x)
  (+ 1 x))

(define (square x)
  (* x x))

(define (square-list L)
  (map square L))

(define (square-vector V)
  (vector-map square V))

(define (sum-vector V)
  (apply + (vector->list V)))

(define (squareJavaArray A)
  (scheme-vector->java-array-int (square-vector (java-array-int->scheme-vector A))))

(define (java-array-int->scheme-vector A)
  (let* ((len (int*-length A))
	 (res (make-vector len)))
    (debug-display len)
    (debug-newline)
    ;(debug-display A)
    ;(debug-newline)
    (let loop ((i 0))
      (vector-set! res i (int*-ref A i))
      (if (= i (- len 1))
	  res
	  (loop (+ i 1))))))


(define (scheme-vector->java-array-int V)
  (let* ((len (vector-length V))
	 (res (make-int* len)))
    (let loop ((i 0))
      (int*-set! res i (vector-ref V i))
      (if (= i (- len 1))
	  res
	  (loop (+ i 1))))))

(define (java-array-byte*->scheme-vector A)
  (let* ((len (byte**-length A))
	 (result (make-vector len)))
    (let loop ((i 0))
      (vector-set! result i (byte**-ref A i))
      (if (= i (- len 1))
	  result
	  (loop (+ i 1))))))

(define (scheme-vector->java-array-byte* V)
  (let* ((len (vector-length V))
	 (res (make-byte** len)))
    (let loop ((i 0))
      (byte**-set! res i (vector-ref V i))
      (if (= i (- len 1))
	  res
	  (loop (+ i 1))))))

(define (displayArrayByteStar jab*)
  (debug-display (java-array-byte*->scheme-vector jab*))
  (debug-newline)
  '())

(define (displayReverseArrayByteStar jab*)
  (debug-display (reverseArrayByteStar jab*))
  (debug-newline)
  '())

(define (reverseArrayByteStar jab*)
  (scheme-vector->java-array-byte* (list->vector (reverse (vector->list (java-array-byte*->scheme-vector jab*))))))

(define (affichen s)
  (debug-display s)
  (debug-newline)
  ;;1
  '()
  )

(define (affiche s)
  (debug-display s)
  '()
  )

(define (ResultatMesuresF2 db)
  (debug-display "BiglooCode.scm :: ResultatMesuresF2")
  (debug-newline)
  (eu.oca.DataBase-searchDriverDynamic db)
  (make-byte* 255))


(define res '()) ;; will be result ( string,HTML page)


(define (ResultatMesuresF bstr_identificateur bstr_objet bstr_choixres)
;;(define (ResultatMesuresF identificateur objet)
  
  (let* (
	 (len_bstr_identificateur (byte*-length bstr_identificateur))
	 (identificateur (make-string len_bstr_identificateur))
	 (len_bstr_objet (byte*-length bstr_objet))
	 (objet (make-string len_bstr_objet))
	 
	 (len_bstr_choixres (byte*-length bstr_choixres))
	 (choixres (make-string len_bstr_choixres))
	 (essai "")
	 (baraterreur  "Veuillez re-initialiser la page et recommencer la requète : ") ;; baratin erreur
	 (baratexiste "L'objet demandé existe, mais avec le nom suivant, cliquez sur le bouton Soumettre pour avoir le résultat :") ;; baratin existe
	 (baratobjet " L'objet demandé existe, mais il existe aussi d'autres objets correspondants à cet identificateur (voir la liste ci-dessous) !")
	 (baratuni "Plusieurs objets correspondent à votre requète, choisissez en un seul dans la liste et cliquez sur le bouton Soumettre à coté: ")
	 (flagerreur 0) ;; flag erreur
	 (flaguni 0)  ;; flag unique
	 (flagexiste 0) ;; flag existe
	 (char-set "UTF-8")  ;; "ISO-8859-1") ;; HTML 5 char set 
	 (len 0)
	 (dyna #f)
	 (db (if dyna
		 (eu.oca.DataBase-new)
		 '())) ;; database
	 (monchoix "")
	 (flagnom 0)
	 (flagobjet 0)
	 (requeteuni::java.lang.String  (begin
					  (set! objet bstr_objet) ;; pourquoi j'affecte objet ici , ce serai mieux au niveau de la definition et juste apres l'allocation (peut etre pour eviter un comportement bizarre du compilateur)
					  (display "BiglooCode.scm : ResultatMesuresF: objet =")
					  (display-nl objet)
					  (display-nl "BiglooCode.scm : ResultatMesuresF: launching convert-Nom on objet")
					  (set! objet (convert-Nom objet))
					  (display "BiglooCode.scm : ResultatMesuresF: objet =")
					  (display-nl objet)
					  ;;(eu.oca.bigloofunct.JavaForBigloo-bstring->jstring (string-append "SELECT DISTINCTROW Coordonnées.Nom FROM Coordonnées WHERE Coordonnées.Nom Like '" objet " %'"))
					  ;;(eu.oca.bigloofunct.JavaForBigloo-bstring->jstring (string-append "SELECT DISTINCTROW Coordonnées.Nom FROM Coordonnées WHERE Coordonnées.Nom Like '" objet " %' ORDER BY Coordonnées.Nom"))
					  (eu.oca.bigloofunct.JavaForBigloo-bstring->jstring (string-append "SELECT DISTINCTROW Coordonnées.Nom FROM Coordonnées WHERE Coordonnées.Nom Like '" objet "%' ORDER BY Coordonnées.Nom"))
					  ))

	 (requetexiste "")
	 ;;(requetexiste::java.lang.String (java.lang.String-java.lang.String8 (string-append "SELECT DISTINCTROW Coordonnées.Nom FROM Coordonnées WHERE Coordonnées.Nom Like '" objet "'")))
	 ;;(jstr::%jstring (eu.oca.bigloofunct.JavaForBigloo-bstring->jstring "hello boy"))
	 (jstr::java.lang.String (eu.oca.bigloofunct.JavaForBigloo-bstring->jstring "hello boy")) 
	 (nombreobjets 0)
	 (objetexiste 0)
	 (rsuni::java.sql.ResultSet eu.oca.DataBase-resultSet2)
	 (rsexiste::java.sql.ResultSet eu.oca.DataBase-resultSet)
	 ;;(rs::java.sql.ResultSet eu.oca.DataBase-resultSetRequete)
	 (rs::java.sql.ResultSet eu.oca.DataBase-resultSet)
	 
	 (marequete
	  (sql-server->mysql-server-syntax 
	   (string-append
	    "SELECT DISTINCTROW Coordonnées.Nom, Coordonnées.[N° Fiche], Coordonnées.[N° BD], Coordonnées.[N° ADS]"
	    ", Coordonnées.[Alpha 2000], Coordonnées.[Delta 2000], Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre" 
	    ", Coordonnées.[N° HIP], Coordonnées.[Orb]"
	    ", Mesures.Date, Mesures.Angle, Mesures.Sépar, Mesures.[Nb Nuits], Mesures.CodeObs,"
	    " Mesures.dimension, Mesures.Instrument, Mesures.Réf, Mesures.Nota"
	    " FROM Coordonnées INNER JOIN Mesures ON Coordonnées.[N° Fiche] = Mesures.[N° Fiche] WHERE")))
	 (monordremes " ORDER BY Mesures.Date")
	 
	 (sqlorbite
	   (sql-server->mysql-server-syntax 
	    (string-append
	    "SELECT DISTINCTROW Coordonnées.Nom, Coordonnées.[N° Fiche], Coordonnées.[N° BD], Coordonnées.[N° ADS]"
	    ", Coordonnées.[Alpha 2000], Coordonnées.[Delta 2000], Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre"
	    ", Coordonnées.[N° HIP], Coordonnées.[Orb]"
	    ", orbite.Auteur, orbite.Année, orbite.référence, orbite.Période, orbite.[moyen mt], orbite.périastre"
	    ", orbite.[mi gd axe], orbite.notes, orbite.excentric, orbite.inclin, orbite.noeud, orbite.[noeud/péri]"
	    " FROM Coordonnées INNER JOIN orbite ON Coordonnées.[N° Fiche] = orbite.[N° Fiche] WHERE")))
	 (monordreorb " ORDER BY orbite.Année")
	 

	 ;; this SQL is endless on MySQL server:
	 ;; SELECT DISTINCTROW Coordonnées.Nom, Coordonnées.`N° Fiche`, Coordonnées.`N° BD`, Coordonnées.`N° ADS`, Coordonnées.`Alpha 2000`, Coordonnées.`Delta 2000`, Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre, Coordonnées.`N° HIP`, Coordonnées.`Orb`, Mesures.Réf, Références.Revue, Références.Titre FROM Coordonnées INNER JOIN (Mesures INNER JOIN Références ON Mesures.Réf = Références.refer) ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` GROUP BY Coordonnées.Nom, Coordonnées.`N° Fiche`, Coordonnées.`N° BD`, Coordonnées.`N° ADS`, Coordonnées.`Alpha 2000`, Coordonnées.`Delta 2000`, Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre, Coordonnées.`N° HIP`, Coordonnées.`Orb`, Mesures.Réf, Références.Revue, Références.Titre HAVING Coordonnées.Nom Like 'COU 1027' ORDER BY Références.Revue;
	 ;;
	 ;; must be replaced by:
	 ;;
	 ;; SELECT DISTINCTROW tmp.Nom,tmp.`N° Fiche`,tmp.`N° BD`, tmp.`N° ADS`, tmp.`Alpha 2000`, tmp.`Delta 2000`,tmp.mag1,tmp.mag2,tmp.Spectre,tmp.`N° HIP`,tmp.`Orb`,  tmp.Réf,Références.Titre FROM (SELECT DISTINCTROW Coordonnées.Nom, Mesures.Réf FROM Coordonnées INNER JOIN Mesures ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` WHERE Coordonnées.Nom Like 'a 426') tmp INNER JOIN Références ON tmp.Réf = Références.refer;
	 ;;
	 ;; SELECT DISTINCTROW tmp.Nom,tmp.`N° Fiche`, tmp.`N° BD`, tmp.`N° ADS`, tmp.`Alpha 2000`, tmp.`Delta 2000`,tmp.mag1,tmp.mag2,tmp.Spectre,tmp.`N° HIP`,tmp.`Orb`, tmp.Réf,Références.Revue,Références.Titre FROM (SELECT DISTINCTROW Coordonnées.Nom,Coordonnées.`N° Fiche`,Coordonnées.`N° BD`, Coordonnées.`N° ADS`, Coordonnées.`Alpha 2000`, Coordonnées.`Delta 2000`, Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre, Coordonnées.`N° HIP`, Coordonnées.`Orb`, Mesures.Réf FROM Coordonnées INNER JOIN Mesures ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` WHERE Coordonnées.Nom Like 'a 426') tmp INNER JOIN Références ON tmp.Réf = Références.refer;
	 ;;
	 ;;  SELECT DISTINCTROW tmp.Nom,tmp.Réf,Références.Titre FROM (SELECT DISTINCTROW Coordonnées.Nom, Mesures.Réf FROM Coordonnées INNER JOIN Mesures ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` WHERE Coordonnées.Nom Like 'a 426') tmp INNER JOIN Références ON tmp.Réf = Références.refer;
	 ;; (sqlrefere
	 ;;   (sql-server->mysql-server-syntax 
	 ;;   (string-append
	 ;;     "SELECT DISTINCTROW Coordonnées.Nom, Coordonnées.[N° Fiche], Coordonnées.[N° BD], Coordonnées.[N° ADS]"
	 ;;     ", Coordonnées.[Alpha 2000], Coordonnées.[Delta 2000], Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre"
	 ;;     ", Coordonnées.[N° HIP], Coordonnées.[Orb]"
	 ;;     ", Mesures.Réf, Références.Revue"
	 ;;     ", Références.Titre"
	 ;;     " FROM Coordonnées INNER JOIN (Mesures INNER JOIN Références ON"
	 ;;     " Mesures.Réf = Références.refer) ON Coordonnées.[N° Fiche] = Mesures.[N° Fiche]"
	 ;;     " GROUP BY Coordonnées.Nom, Coordonnées.[N° Fiche], Coordonnées.[N° BD], Coordonnées.[N° ADS]"
	 ;;     ", Coordonnées.[Alpha 2000], Coordonnées.[Delta 2000], Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre"
	 ;;     ", Coordonnées.[N° HIP], Coordonnées.[Orb]"
	 ;;     ", Mesures.Réf, Références.Revue"
	 ;;     ", Références.Titre HAVING")))

	 ;; (sqlrefere
	 ;;  "SELECT DISTINCTROW tmp.Nom,tmp.`N° Fiche`, tmp.`N° BD`, tmp.`N° ADS`, tmp.`Alpha 2000`, tmp.`Delta 2000`,tmp.mag1,tmp.mag2,tmp.Spectre,tmp.`N° HIP`,tmp.`Orb`, tmp.Réf,Références.Revue,Références.Titre FROM (SELECT DISTINCTROW Coordonnées.Nom,Coordonnées.`N° Fiche`,Coordonnées.`N° BD`, Coordonnées.`N° ADS`, Coordonnées.`Alpha 2000`, Coordonnées.`Delta 2000`, Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre, Coordonnées.`N° HIP`, Coordonnées.`Orb`, Mesures.Réf FROM Coordonnées INNER JOIN Mesures ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` WHERE Coordonnées.Nom Like 'a 426') tmp INNER JOIN Références ON tmp.Réf = Références.refer")

	 (sqlrefere "") ;; will be construct later

	 (sqlrefere-begin
	  "SELECT DISTINCTROW tmp.Nom,tmp.`N° Fiche`, tmp.`N° BD`, tmp.`N° ADS`, tmp.`Alpha 2000`, tmp.`Delta 2000`,tmp.mag1,tmp.mag2,tmp.Spectre,tmp.`N° HIP`,tmp.`Orb`, tmp.Réf,Références.Revue,Références.Titre FROM (SELECT DISTINCTROW Coordonnées.Nom,Coordonnées.`N° Fiche`,Coordonnées.`N° BD`, Coordonnées.`N° ADS`, Coordonnées.`Alpha 2000`, Coordonnées.`Delta 2000`, Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre, Coordonnées.`N° HIP`, Coordonnées.`Orb`, Mesures.Réf FROM Coordonnées INNER JOIN Mesures ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` WHERE")

	 (sqlrefere-end 
	   " GROUP BY Mesures.Réf) tmp INNER JOIN Références ON tmp.Réf = Références.refer GROUP BY tmp.Nom, tmp.`N° Fiche`, tmp.`N° BD`, tmp.`N° ADS`, tmp.`Alpha 2000`, tmp.`Delta 2000`, tmp.mag1, tmp.mag2, tmp.Spectre, tmp.`N° HIP`, tmp.`Orb`, Références.Revue, Références.Titre ")

	 (monordreref " ORDER BY Références.Revue")

	 (jresult::java.lang.String (java.lang.String-java.lang.String8 ""))
	 (result "")
	 (baratin "")
	 ;;(result-double #;::float 0.0)
	 (result-double '())
	 (result-double::double  0.0)
	 (result2::real 0.0)
	 (bs-result "")
	 (len-bs-result 0)
	 (str-result "")
	 (rd '())
	 (iresult 0)
	 (resulth 0) ;; hours
	 (resulth-str "") ;; hours string
	 (resultm 0) ;; minutes
	 (resultm-str "") ;; minutes string
	 (results 0) ;; seconds
	 (results-str "") ;; seconds string
	 (sign "") ;; signe
	 (aresult 0.0) ;; absolute value
	 (resultd 0)
	 (resultd-str "")
	 (resultmi 0)
	 (resultmi-str "")
	 (objet_WDS "")

	 ;; 2000-Coordinates of the object
	 (alpha 0) 
	 (delta 0)
	 (exist-alpha #t)
	 (exist-delta #t)
	 (lang "french")
	 
	 )

    (set! debug-mode #t) ;; debug-mode is defined in debug.scm
    (display-var-nl "BiglooCode.scm :: ResultatMesuresF ::  debug-mode = "  debug-mode )

    ;;(debug-display-msg-symb-nl  "BiglooCode.scm :: ResultatMesuresF ::" nombreobjets ) ;; je sais pas pourquoi cette macro fais planter bigloo ici mais pas dans d'autres situations
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF ::  nombreobjets = "  nombreobjets )
    ;;(eu.oca.bigloofunct.JavaForBigloo-bstringTojstring '()) ;;"hello boy")
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: bstr_identificateur = " bstr_identificateur)
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: bstr_objet = " bstr_objet)
    
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: len_identificateur = " len_bstr_identificateur)
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: (string? bstr_identificateur) = " (string? bstr_identificateur))
    ;;(eu.oca.bigloofunct.JavaForBigloo-bstring->jstring "hello boy")
   
    (set! res (string-append
	       "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
               <html>
                     <head>
                            <meta http-equiv=\"Content-Type\" content=\"text/html; charset=" char-set "\">
                            <meta name=\"GENERATOR\" content=\"Microsoft FrontPage 5.0\">
                            <title>SIDONIe-Résultats : identifications et mesures</title>
                     </head>
                     <LINK rel=\"stylesheet\" href=\"../Style.css\" type=\"text/css\">
               <body>"))


    ;;(set! identificateur  ($bstring->string bstr_identificateur))
    (set! identificateur bstr_identificateur)
    ;;(set! identificateur  (string-append bstr_identificateur))

    ;;(debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: (string-append \"\" bstr_identificateur) = "  (string-append "" bstr_identificateur))
    
    ;;(set! objet ($bstring->string bstr_objet))
    ;;(set! choixres ($bstring->string bstr_choixres)) 

    (set! choixres bstr_choixres) 

    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: identificateur = " identificateur)
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: (string? identificateur) = " (string? identificateur))
  
    (debug-display (string-append "TEST "  identificateur))
    (debug-newline)

    (set!  essai (string-append "TEST "  identificateur))
    (debug-display essai)
    (debug-newline)

    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: essai = " essai)
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: identificateur = " identificateur)
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: (string? essai) = " (string? essai))
    
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: (string=?  identificateur \"\" ) = "  (string=?  identificateur ""))


     ;; database driver search
    
    (debug-newline)

    (if dyna 
	(begin
	  (eu.oca.DataBase-searchDriverDynamic db)

	  (eu.oca.DataBase-connectDynamic db)

	  ;;(eu.oca.DataBase-connectDynamic db) ;; testing fool proof overconnections

	  (eu.oca.DataBase-createStatementDynamic db) ;; i put the statement it if it's true it can be reused for multiple SQL queries

	  )
	(begin 
	  (eu.oca.DataBase-searchDriverStatic)

	  (eu.oca.DataBase-connectStatic)

	  ;;(eu.oca.DataBase-connectStatic) ;; testing fool proof overconnections

	  (eu.oca.DataBase-createStatementStatic) ;; i put the statement here if it's true it can be reused for multiple SQL queries
	  ))

    (debug-newline)

    (when (string-null? identificateur) ;;(string=? identificateur "") ;;(when (equal? identificateur "")
	  (set! flagerreur 1)
	  (set! baraterreur (string-append baraterreur " Vous devez choisir un identificateur ! ")))
	
    (when (string-null? objet)
	  (set! flagerreur 1)
	  (set! baraterreur (string-append baraterreur  " Vous devez spécifier un nom d'objet ! ")))

    (when (string-null? choixres)
	  (set! flagerreur 1)
	  (set! baraterreur (string-append baraterreur  " Vous devez choisir un type d'information ! ")))

   
    (cond
     ((string=? identificateur "Nom")
	 (set! monchoix (string-append " Coordonnées.Nom Like '" objet "'"))
	 (when (= flagerreur 0)
	       (set! flagnom 1)
	       (set! requetexiste (string-append "SELECT DISTINCTROW Coordonnées.Nom FROM Coordonnées WHERE Coordonnées.Nom Like '" objet "'"))
	       (set! jstr (eu.oca.bigloofunct.JavaForBigloo-bstring->jstring requetexiste))
	       
	       (if dyna
		   (begin
		     (eu.oca.DataBase-executeQueryDynamic db jstr)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-getval db)")
		     (eu.oca.DataBase-getval db)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: passed")
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-getresultSet db)")
		     (eu.oca.DataBase-getresultSet db)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: passed")
		     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (%jresultset-next (eu.oca.DataBase-getresultSet db))")
		     ;; (%jresultset-next (eu.oca.DataBase-getresultSet db))
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (java.sql.ResultSet-next (eu.oca.DataBase-getresultSet db))")
		     (java.sql.ResultSet-next (eu.oca.DataBase-getresultSet db))

		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: passed")
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-val db)")
		     (eu.oca.DataBase-val db)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: passed")
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-resultSet db)")
		     (eu.oca.DataBase-resultSet db)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: passed")
		     ;; (%jresultset-next (eu.oca.DataBase-resultSet db))
		     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before let")
		     ;; (let ((reset (eu.oca.DataBase-resultSet db)))
		     ;;   ;;(%jresultset-next reset)
		     ;;   (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (%jresultset-last reset)")
		     ;;   (%jresultset-last reset)
		     ;;   (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (set! nombreobjets (%jresultset-getRow reset))")
		     ;;   (set! nombreobjets (%jresultset-getRow reset))
		     ;;   (debug-display-msg-symb-nl  "BiglooCode.scm :: ResultatMesuresF ::" nombreobjets )
		     ;;   )
		     ;;(%jresultset-next (eu.oca.DataBase-resultSet db))
		     )
		   (begin
		     (eu.oca.DataBase-executeQueryStatic jstr) ;; equiv requetexiste
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (java.sql.ResultSet-next eu.oca.DataBase-resultSet)")
		     (java.sql.ResultSet-next eu.oca.DataBase-resultSet)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (java.sql.ResultSet-last eu.oca.DataBase-resultSet)")

		     ;; this is for counting
		     (java.sql.ResultSet-last eu.oca.DataBase-resultSet)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (set! objetexiste (java.sql.ResultSet-getRow eu.oca.DataBase-resultSet))")
		     (set! objetexiste (java.sql.ResultSet-getRow eu.oca.DataBase-resultSet))
		     ;;(debug-display-msg-symb-quote-nl  "BiglooCode.scm :: ResultatMesuresF ::" objetexiste )
		     ;;(debug-display-msg-symb-nl  "BiglooCode.scm :: ResultatMesuresF ::" objetexiste ) ;; je sais pas pourquoi cette macro fais planter bigloo ici mais pas dans d'autres situations (symbol->string plante avec le front end java)
		     (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF ::  objetexiste = "  objetexiste )
		     ;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (%jresultset-next eu.oca.DataBase-resultSet)")
		     ;;(%jresultset-next eu.oca.DataBase-resultSet)
		     
		     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: testing (symbol->string 'blabla) :")
		     ;; (symbol->string 'blabla)
		     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: test done")

		     (java.sql.ResultSet-beforeFirst eu.oca.DataBase-resultSet)
		     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (set! nombreobjets (java.sql.ResultSet-beforeFirst eu.oca.DataBase-resultSet))")

		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: passed")
		     )
		   ) ;; end if dyna
	       
	       ;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-executeQueryStatic requeteuni)")
	       ;;(eu.oca.DataBase-executeQueryStatic requeteuni)
	       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-executeQueryStatic2args requeteuni2)")
	       (eu.oca.DataBase-executeQueryStatic2args requeteuni 2)
	       ;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (java.sql.ResultSet-last eu.oca.DataBase-resultSet)")
	       ;;(java.sql.ResultSet-last eu.oca.DataBase-resultSet)
	       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (java.sql.ResultSet-last rsuni)")
	       (java.sql.ResultSet-last rsuni)
	       ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (set! nombreobjets (java.sql.ResultSet-getRow eu.oca.DataBase-resultSet))")
	       ;; (set! nombreobjets (java.sql.ResultSet-getRow eu.oca.DataBase-resultSet))
	       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (set! nombreobjets (java.sql.ResultSet-getRow rsuni))")
	       (set! nombreobjets (java.sql.ResultSet-getRow rsuni))
	       (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF ::  nombreobjets = "  nombreobjets )
			     
	       ;;(java.sql.ResultSet-beforeFirst eu.oca.DataBase-resultSet)
	       (java.sql.ResultSet-beforeFirst rsuni)
	       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: passed-2")
	       
	       (when (> nombreobjets 1)
		     (set! flaguni 1))

	       (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF ::  flaguni = "  flaguni)

	       (when (and (= objetexiste 0) (= nombreobjets 1))
		     (set! flagexiste 1))
	       
	       (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF ::  flagexiste = "  flagexiste)

	       ;;(when (and (= objetexiste 1) (>= nombreobjets 1))
	       (when (and (= objetexiste 1) (> nombreobjets 1))
		     (set! flagobjet 1))))

     ((string=? identificateur "N° ADS")
      (set! monchoix (sql-server->mysql-server-syntax (string-append " Coordonnées.[N° ADS] Like '" objet "'"))))
     
     ((string=? identificateur "N° BD")
      (set! monchoix (sql-server->mysql-server-syntax (string-append " Coordonnées.[N° BD] Like '" objet "'"))))

     ((string=? identificateur "N° HIP")
      (set! monchoix (sql-server->mysql-server-syntax (string-append  " Coordonnées.[N° HIP] Like '" objet "'"))))

     (else
      (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: UNSUPPORTED CASE with identificateur =" identificateur)))

    ;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: forcing flagexiste = 1")
    ;;(set! flagexiste 1)

    ;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: forcing flaguni = 1")
    ;;(set! flaguni 1)

    (if (or (= flagerreur 1) (= flaguni 1) (= flagexiste 1))

	(begin

	  (when (= flagerreur 1)
		(set! res (insert-baratin-in-HTML-french-short baraterreur res)))

	  
	  (when (= flagexiste 1)
		(set! res (insert-baratin-in-HTML-french baratexiste res))

		(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: nom :: (when (= flagexiste 1) :: before loop !")

		(let [(the-loop-on-resultset-function
		       ;;(the-loop-on-resultset-function-creator (lambda (x) x)))]
		       (the-loop-on-resultset-function-creator (create-function-form-around-string identificateur choixres lang)))]

		  (the-loop-on-resultset-function rsuni))

		
		;; (java.sql.ResultSet-first rsuni)
		
		;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: nom :: (when (= flagexiste 1) :: before loop !")
		
		;; (letrec ((resultat "UN RESULTAT")
0		;; 	 (loop (lambda ()
		;; 		 (if (java.sql.ResultSet-isAfterLast rsuni)
		;; 		     '()
		;; 		     (let ((jresultat::java.lang.String #;(java.lang.String-java.lang.String8 "a result") (java.sql.ResultSet-getString2 rsuni 0))
		;; 			   (bstr_tmp '()))
		;; 		       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before (set! bstr_tmp (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresultat))")
		;; 		       (set! bstr_tmp (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresultat)) 
		;; 		       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before (set! resultat jresultat)")
		;; 		       (set! resultat bstr_tmp) ;; a revoir quand utilise (convertir avec une procedure java en byte char puis scheme string je pense)
		;; 		       (debug-display-var-nl   "BiglooCode.scm :: ResultatMesuresF :: resultat = " resultat)
		;; 		       (when (string-null? resultat)
		;; 			     (set! resultat "&nbsp;"))
		;; 		       (set! res (string-append
		;; 				  res
		;; 				  "<tr>
                ;;                                        <td>"
		;; 				             (string-set-lower-case-ending resultat 7) " &nbsp;
                ;;                                        </td>
                ;;                                    </tr>"))
		;; 		       (java.sql.ResultSet-next rsuni)
		;; 		       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: looping !")
		;; 		       (loop))))))
		;;   (loop))

		(set! res (string-append
			   res
			   "</table>"))

		) ;; (when (= flagexiste 1)


	  (when (= flaguni 1)
		
		(let [(the-loop-on-resultset-function (the-loop-on-resultset-function-creator
						       (create-function-form-around-string identificateur choixres lang)))]
		  
		  (proc-barat-form-post-submit baratuni rsuni lang the-loop-on-resultset-function)))
		;;(proc-barat baratuni rsuni))


	  (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before (when (and (= flagerreur 0) (= flagobjet 0) (= flagnom 1))")
	  (when (and (= flagerreur 0) (= flagobjet 0) (= flagnom 1))
		(set! rsexiste eu.oca.DataBase-resultSet)
		(java.sql.ResultSet-close rsexiste)
	      
		;;(set! rsexiste (class-nil rsexiste))
		;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before (class-nil rsexiste)")
		;; (class-nil rsexiste) ;; au cas marche pas utiliser la fonction java setResultSetNull
		(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before (eu.oca.DataBase-setResultSetNull)")
		(eu.oca.DataBase-setResultSetNull)

		;; (java.sql.ResultSet-close rsuni)
		;; (class-nil rsuni)
		(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before (eu.oca.DataBase-setResultSet2Null)")
		(eu.oca.DataBase-setResultSet2Null)
		)
	  
	  ) ;; begin

	;; else du (if (or (= flagerreur 1) (= flaguni 1) (= flagexiste 1))
	
	(begin
	  (when (= flagobjet 1)
	      (proc-barat baratobjet rsuni))

	  (when (= flagnom 1)
		(set! rsexiste eu.oca.DataBase-resultSet)
		(java.sql.ResultSet-close rsexiste)

		;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before (set! rsexiste (class-nil rsexiste))")
		;;(set! rsexiste (class-nil rsexiste))
		;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before (class-nil rsexiste)")
		;;(class-nil rsexiste) ;; au cas marche pas utiliser la fonction java setResultSetNull		
		(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before (eu.oca.DataBase-setResultSetNull)")
		(eu.oca.DataBase-setResultSetNull)

		;; (java.sql.ResultSet-close rsuni)
		;; (class-nil rsuni)

		(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: before (eu.oca.DataBase-setResultSet2Null)")
		(eu.oca.DataBase-setResultSet2Null))


	  (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: choixres =")
	  (debug-display choixres)
	  (debug-newline)

	  ;; un COND assez gros ..... correspond au case du code ASP
	  
	  (cond
	   
	   ((string=?  choixres "Ident")
	    
	    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (cond : Ident")

	    (set! marequete (string-append marequete monchoix monordremes))

	     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-executeQueryStaticStringString
	     ;;  (java.lang.String-java.lang.String8 marequete)
	     ;;  (java.lang.String-java.lang.String8 \"Requete\")))")
	     ;; (eu.oca.DataBase-executeQueryStaticStringString
	     ;;  (java.lang.String-java.lang.String8 marequete)
	     ;;  (java.lang.String-java.lang.String8 "Requete"))

	     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-executeQueryStatic (java.lang.String-java.lang.String8 marequete))")
	     (eu.oca.DataBase-executeQueryStatic
	      (java.lang.String-java.lang.String8 marequete))
	     
	     (set! res (string-append res "<h1 align=\"center\"><font color=\"#0000FF\"> SIDONIe - Identifications et mesures </font></h1>"))




	     ;;(java.sql.ResultSet-first rs)

	     (if (not (java.sql.ResultSet-first rs))
		 
		 (then-block ;; empty result set
		  
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF :  empty result set"))
		  (set! baratin "Cet objet n'existe pas dans la base ou est mal orthographié !")
		  (set! flagerreur 1))
		 
		 (else-block

		  (set! jresult (java.sql.ResultSet-getString2 rs 1))
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result = " result))
	     
		  (debug-display "BiglooCode.scm :: ResultatMesuresF : = (java.sql.ResultSet-wasNull rs) 1 :")
		  (debug-display (java.sql.ResultSet-wasNull rs))
		  (debug-newline)

		  ;; TODO verifier que en cas de result set null ca plante pas (comportement different en ASP de rs que en java) cd cas orbite qui est ok

		  (when (and (string-null? result) (string=? identificateur "Nom"))
			(set! baratin "Cet objet n'existe pas dans la base ou est mal orthographié !")
			(set! flagerreur 1))



		  (set! bs-result (eu.oca.bigloofunct.JavaForBigloo-jdouble->bstring (eu.oca.bigloofunct.JavaForBigloo-pi2dec)))
		  (debug-display "BiglooCode.scm :: ResultatMesuresF : bs-result = ")
		  (debug-display bs-result)
		  (debug-newline)

		  (set! bs-result (eu.oca.bigloofunct.JavaForBigloo-jdouble->bstring (java.sql.ResultSet-getDouble2 rs 3)))
		  (debug-display "BiglooCode.scm :: ResultatMesuresF : bs-result =")
		  (debug-display bs-result)
		  (debug-display "|")
		  (debug-newline)
		  (debug-display "BiglooCode.scm :: ResultatMesuresF : = (java.sql.ResultSet-wasNull rs) 3 :")
		  (debug-display (java.sql.ResultSet-wasNull rs))
		  (debug-newline)

		  ;; (set! len-bs-result (byte*-length bs-result))
		  ;; (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF : len-bs-result = " len-bs-result)
		  ;; (set! bs-result (make-string len-bs-result))
		  ;; (set! bs-result (eu.oca.bigloofunct.JavaForBigloo-jdouble->bstring (java.sql.ResultSet-getDouble2 rs 3)))
		  ;; (debug-display "BiglooCode.scm :: ResultatMesuresF : bs-result = ")
		  ;; (debug-display bs-result)
		  ;; (debug-newline)

		  ;; useless, only for tests
		  ;;(debug-display-nl "BiglooCode.scm :: ResultatMesuresF : before  (set! result-double .....)")
		  
		  ;;(set! result-double (java.sql.ResultSet-getDouble2 rs 3))

		  ;; useless, only for tests
		  ;;(set! result-double (eu.oca.bigloofunct.JavaForBigloo-pi2dec))

		  ;; (set! result-double (eu.oca.bigloofunct.JavaForBigloo-piFloat))
		  ;; (debug-display-nl "BiglooCode.scm :: ResultatMesuresF : before  (set! result2 .......)")
		  ;; (set! result2 (+fl result-double 0.0))
		  ;; (debug-display "BiglooCode.scm :: ResultatMesuresF : result2 = ")
		  ;; (debug-display result2)
		  ;; (debug-newline)
		  ;; (debug-display-nl "BiglooCode.scm :: ResultatMesuresF : before display")

		  ;; useless, only for tests
		  ;;(debug-display "BiglooCode.scm :: ResultatMesuresF : result-double = ")
		  
		  ;;(debug-display result-double)
		  ;;(printf "~a" result-double)
		  ;;(printf "~s" result-double)
		  
		  ;; useless, only for tests
		  ;;(debug-display (double->ieee-string result-double))
		  ;;(debug-newline)
		  
		  ;;(debug-display (real->string result-double))
		  ;;(debug-newline)
		  ;;(debug-display-nl "BiglooCode.scm :: ResultatMesuresF : before display-var-nl")
		  ;;(debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF : result-double = " result-double)
		  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: (string? bs-result) = " (string? bs-result))
	     
		  ;; (debug-display "BiglooCode.scm :: ResultatMesuresF : (debug-display (string->real bs-result)) =")
		  ;; (debug-newline)
		  ;; (debug-display (string->number (string-append " " bs-result)))
		  ;; (debug-newline)
	     
		  (set! result-double (string->real bs-result))
	     
		  (set! str-result bs-result)

		  
		  ;; lonely block that do nothing else than printing but cause the app to crash !! => commented now !

		  ;; (let* ((sp (string-split str-result "."))
		  ;; 	 (irss (car sp))
		  ;; 	 (frss (cadr sp))
		  ;; 	 (irs (string->number irss))
		  ;; 	 (frs (string->number frss))
		  ;; 	 (len-frss (string-length frss))
		  ;; 	 (expo (expt 10 len-frss))
		  ;; 	 (frc-rs (/ frs expo))
		  ;; 	 (rsf (+ irs frc-rs))
		  ;; 	 )
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF : irss = " irss)
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF : frss = " frss)
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF : irs = " irs)
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF : frs = " frs)
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF : len-frss = " len-frss)
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF : expo = " expo)
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF : frc-rs = " frc-rs)
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF : rsf = " rsf)
		  ;;   (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL rsf) ;; cause erreur
		  ;;   )
		  
		  (debug-display  "BiglooCode.scm :: ResultatMesuresF : (real? result-double) =")
		  (debug-display (real? result-double))
		  (debug-newline)
		  (set! result2 result-double)
		  ;;(set! str-result (real->string result2))
		  ;;(+ result-double 1)
		  ;;(debug-display result2)
		  ;;(real->string result2)


		  ) ;; fin else
		 ) ;; fin if test empty set
 



	     (if (not (java.sql.ResultSet-first rs))
	     
		 (then-block ;; empty result set


		  (when (and (java.sql.ResultSet-wasNull rs) (string=? identificateur "N° BD"))
			(set! baratin "Cet objet n'existe pas dans la base ou son N° BD est mal orthographié !")
			(set! flagerreur 1)))
		 (else-block
		  (set! jresult (java.sql.ResultSet-getString2 rs 3))
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 3 = " result))))
		 

	     (if (not (java.sql.ResultSet-first rs))
	     
		 (then-block ;; empty result set

		  (when (and  (string-null? result)  (string=? identificateur "N° BD"))
			(set! baratin "Cet objet n'existe pas dans la base ou son N° BD est mal orthographié !")
			(set! flagerreur 1)))

		 (else-block
		  
		  (set! bs-result (eu.oca.bigloofunct.JavaForBigloo-jdouble->bstring (java.sql.ResultSet-getDouble2 rs 4)))
		  (debug-display "BiglooCode.scm :: ResultatMesuresF : bs-result 4 =")
		  (debug-display bs-result)
		  (debug-display "|")
		  (debug-newline)
		  
		  (debug-display "BiglooCode.scm :: ResultatMesuresF : = (java.sql.ResultSet-wasNull rs) 4 :")
		  (debug-display (java.sql.ResultSet-wasNull rs))
		  (debug-newline)
		  ) ;; fin else
		 ) ;; fin if test empty set
 

	     (if (not (java.sql.ResultSet-first rs))
	     
		 (then-block ;; empty result set
	     
		  (when (and (java.sql.ResultSet-wasNull rs) (string=? identificateur "N° ADS"))
			(set! baratin "Cet objet n'existe pas dans la base ou son N° ADS est mal orthographié !")
			(set! flagerreur 1)))

		 (else-block
		  (set! jresult (java.sql.ResultSet-getString2 rs 4))
	     
		  (when (not (java.sql.ResultSet-wasNull rs))
			(set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			(debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 4 = " result)))
		  ) ;; fin else
		 ) ;; fin if test empty set
 
		
	     (if (not (java.sql.ResultSet-first rs))
	     
		 (then-block ;; empty result set

		  (when (and  (string-null? result) (string=? identificateur "N° ADS"))
			(set! baratin "Cet objet n'existe pas dans la base ou son N° ADS est mal orthographié !")
			(set! flagerreur 1)))
		 
		 (else-block

		  ;; (set! bs-result (eu.oca.bigloofunct.JavaForBigloo-jdouble->bstring (java.sql.ResultSet-getDouble2 rs 9)))
		  ;; (debug-display "BiglooCode.scm :: ResultatMesuresF : bs-result 9 =")
		  ;; (debug-display bs-result)
		  ;; (debug-display "|")
		  ;; (debug-newline)

	     
		  (set! jresult (java.sql.ResultSet-getString2 rs 10))
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 10 = " result))

		  
		  (debug-display "BiglooCode.scm :: ResultatMesuresF : = (java.sql.ResultSet-wasNull rs) 10 :")
		  (debug-display (java.sql.ResultSet-wasNull rs))
		  (debug-newline)))

	     
	     (when (not (java.sql.ResultSet-first rs))
		   (when (and (java.sql.ResultSet-wasNull rs) (string=? identificateur "N° HIP"))
			 (set! baratin "Cet objet n'existe pas dans la base ou son N° HIP est mal orthographié !")
			 (set! flagerreur 1))
		   
		   (when (and  (string-null? result) (string=? identificateur "N° HIP"))
			 (set! baratin "Cet objet n'existe pas dans la base ou son N° HIP est mal orthographié !")
			 (set! flagerreur 1)))
	     
		



	     (if (equal? flagerreur 1)
		 
		   (set! res (string-append
			      res
			    "<div align=\"center\">
                                  <center>
                                           <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                             <tr>
                                                 <th width=\"82%\">
                                                     <font color=\"#0000FF\">"
			                                 baratin "<br>
                                                     </font>
                                                 </th>
                                             </tr>
                                           </table>
                                 </center>
                           </div>
                           <P>
                           <P>"))

		
		   (begin  ;; else du if
  

		     (set! res (string-append
			    res
			    "<div align=\"center\">
                                  <center>
                                          <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                                <tr>
                                                     <th>
                                                          <font color=\"#0000FF\"> Objet <br></font>"
			                                   (field-result-set-lower-case-ending rs 1 7)
			                             "</th>"
		                                            "<td align=\"center\"><font color=\"#0000FF\"> N° BD<br></font>"
							    (field-result-set-lowercase rs 3)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> N° ADS<br></font>"
							    (field-result-set-lowercase rs 4)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> N° HIP<br></font>"
							    (field-result-set-lowercase-check-star rs 10)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\">  Type Spectral<br></font>"
							    (field-result-set-lowercase-check-minus rs 9)
							    "</td>
                                               </tr>
					       <tr>
                                                    <td align=\"center\"><font color=\"#0000FF\"> Alpha 2000<br>"
							    (begin

							      (set! result-double (java.sql.ResultSet-getDouble2 rs 5))
							      ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : result-double =")
							      ;; (debug-display result-double)
							      ;; (debug-newline)

							      (if (java.sql.ResultSet-wasNull rs)
								  (then-block
								    (set! result "&nbsp;")
								    (set! exist-alpha #f))
								  (else-block ;; else
								    (set! iresult (floor result-double))
								    (set! alpha iresult)
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult)


								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : iresult =")
								    ;; (debug-display iresult)
								    ;; (debug-newline)

								    (set! resulth (fix (/ iresult 1000)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (integer? resulth) =")
								    (debug-display (integer? resulth))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (bignum? resulth) =")
								    (debug-display (bignum? resulth))
								    (debug-newline)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF :  (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth) =")
								    ;; (debug-newline)
								    ;; (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth)
								    ;; (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : resulth 1 =")
								    (debug-display resulth)
								    (debug-newline)

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : before change code 1")

								    (set! resulth-str #;"result will be here" #;(number->string resulth) (num->string resulth))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : after change code 1")

								    (set! resultm (- iresult (* resulth 1000)))
								    (set! resultm (fix (/ resultm 10)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (integer? resultm) =")
								    (debug-display (integer? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (bignum? resultm) =")
								    (debug-display (bignum? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : resultm =")
								    (debug-display resultm)
								    (debug-newline)

								    (set! resultm-str (num->string resultm))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : resultm-str =")
								    (debug-display resultm-str)
								    (debug-newline)
								    
								    (set! results (- iresult (* resulth 1000) (* resultm 10)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : results =")
								    ;; (debug-display results)
								    ;; (debug-newline)
								    
								    (set! results-str (num->string (fix results)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : results-str =")
								    (debug-display results-str)
								    (debug-newline)

								    (when (< resulth 1)
									  (set! resulth-str "00"))
								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (< resulth 1)")

								    (when (and (>= resulth 1) (< resulth 10))
									  (set! resulth-str (string-append "0" resulth-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed  (and (>= resulth 1) (< resulth 10)")
								    (when (< resultm 10)
									  (set! resultm-str (string-append "0" resultm-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (< resultm 10)")

								    (set! result (string-append resulth-str " h " resultm-str "." results-str " mn"))))
							      (string-append "</font>" result "</td>")) ;; end begin
							   

						      "<td align=\"center\"><font color=\"#0000FF\"> Delta 2000<br>"

						        (begin

							  (set! result-double (java.sql.ResultSet-getDouble2 rs 6))
							  ;; (set! result2 result-double)
							  ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : result2 =")
							  ;; (debug-newline)
							  ;; (debug-display (real->string result2))
							  ;; (debug-newline)
							  (debug-display  "BiglooCode.scm :: ResultatMesuresF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double) = ")
							  (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double)

							  (if (java.sql.ResultSet-wasNull rs)

							      (then-block 
							        "&nbsp;"
								(set! exist-delta #f))

							      (else-block ;; else
							        (if (< result-double 0)
								    (set! sign "-")
								    (set! sign "&nbsp;"))

								(set! delta result-double)
								(set! aresult (abs result-double))
								
								(set! resultd (fix (/ aresult 100)))
								(set! resultd-str (num->string resultd))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (set! resultd-str (num->string resultd))")
								(set! resultmi (- aresult (* resultd 100)))
								(set! resultmi-str (num->string  (fix resultmi)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (set! resultmi-str (num->string (fix  resultmi)))")
								(when (< resultd 1)
								    (set! resultd-str "00"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed  (set! resultd-str \"00\")")
								(when (and (>= resultd 1) (< resultd 10))
								      (set! resultd-str (string-append "0" resultd-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (when (and (>= resultd 1) (< resultd 10)) ......")
								(when (< resultmi 10)
								      (set! resultmi-str (string-append "0" resultmi-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (when (< resultmi 10) .....")
								(set! result (string-append sign resultd-str " ° " resultmi-str " '"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (set! result (string-append sign resultd-str ....")
								(debug-display  "BiglooCode.scm :: ResultatMesuresF : result =")
								(debug-display result)
								(debug-newline)
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed display")
								) ;; end begin else
							      ) ;; end if (java.sql.ResultSet-wasNull rs)
							  (string-append "</font>" result "</td>")) ;; end begin

							"<td align=\"center\"><font color=\"#0000FF\"> mag 1<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 7))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 7 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "00.")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))

							"<td align=\"center\"><font color=\"#0000FF\"> mag 2<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 8))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 8 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "00.")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))

							"<td align=\"center\"><font color=\"#0000FF\"> Orbite calculée ?<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 11))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 11 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "*")
								(set! result "NON"))

							  (string-append "</font>" result "</td>"))

					        "</tr>
                                         </table>
                                     </center>
                               </div>"
			       ) ;; end de string-append , bizarre emacs le voit pas 
			   ) ;; end (set! res ...


		     ;; add the 2000-Coordinates of the object in HTML data
		     (when (and exist-alpha exist-delta)
			   (html-print-2000-Coordinates (fix alpha)
							(fix delta)))
		     

		     (set! res (string-append
			    res
		       "<P>
                        <P>
                        <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">
                            <tr>
                                <th><font color=\"#000080\"> Date </font></th>
                                <th><font color=\"#000080\"> Angle </font></th>
                                <th><font color=\"#000080\"> Sépar. </font></th>
                                <th><font color=\"#000080\"> Nuits </font></th>
                                <th><font color=\"#000080\"> Code </font></th>
                                <th><font color=\"#000080\"> Instr. </font></th>
                                <th><font color=\"#000080\"> Dim. </font></th>
                                <th><font color=\"#000080\"> Réf. </font></th>
                                <th><font color=\"#000080\"> Notes </font></th>
                            </tr>"))


		 ;; (let loop ((l '(1 2 3)))
		 ;;   (if (java.sql.ResultSet-isAfterLast rsuni)
		 ;;       '()
		 ;;       (begin
		 ;; 	 (set! res (string-append
		 ;; 		    res
		 ;; 		    " A "))
		 ;; 	 (java.sql.ResultSet-next rsuni)
		 ;; 	 (loop))))
		 
		 (java.sql.ResultSet-first rs) ;; rs.movefirst

		 (let loop ((end-flag (java.sql.ResultSet-isAfterLast rs)))
		   (when (not end-flag) ;; not rs.eof
			 (set! res (string-append res "<tr>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 12))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 12 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			       (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 13))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 13 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			       (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 14))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 14 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			       (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! result (number->string (java.sql.ResultSet-getInt2 rs 15)))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 15 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			     (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 16))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 16 = " result))
			 (if (java.sql.ResultSet-wasNull rs)
			     (set! result "&nbsp;")
			     (set! result (string-upcase result)))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 18))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 18 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			       (set! result "&nbsp;"))
			 (when (string=? result "t")
			       (set! result (string-upcase result)))
			 (when (string=? result "l")
			       (set! result (string-upcase result)))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 17))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 17 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			       (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))
			 
			 (set! jresult (java.sql.ResultSet-getString2 rs 19))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 19 = " result))
			 (if (java.sql.ResultSet-wasNull rs)
			     (set! result "&nbsp;")
			     (set! result (string-upcase result)))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 20))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 20 = " result))
			 (when (or (java.sql.ResultSet-wasNull rs) (string-null? result))
			       (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td></tr>"))

			 (java.sql.ResultSet-next rs) ;; rs.Movenext
			 (loop (java.sql.ResultSet-isAfterLast rs)))) ;; Loop
		 
		 (set! res (string-append
			    res
			    "</table>"))
		 
		 ) ;; end (begin ... du else du if
		   
	       ) ;; end (if (equal? flagerreur 1) ..... else   begin ...

	     ) ;;  fin cas dans COND : ((string=?  choixres "Ident")

	   ((string=?  choixres "Orbite")

	    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (cond : Orbite")

	    (set! sqlorbite (string-append sqlorbite monchoix monordreorb))

	    ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-executeQueryStaticStringString
	    ;;   (java.lang.String-java.lang.String8 sqlorbite)
	    ;;   (java.lang.String-java.lang.String8 \"Orbite\")))")
	    ;; (eu.oca.DataBase-executeQueryStaticStringString
	    ;;   (java.lang.String-java.lang.String8 sqlorbite)
	    ;;   (java.lang.String-java.lang.String8 "Orbite"))

	    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-executeQueryStatic (java.lang.String-java.lang.String8 sqlorbite))")
	    (eu.oca.DataBase-executeQueryStatic (java.lang.String-java.lang.String8 sqlorbite))

	    (set! res (string-append res "<h1 align=\"center\"><font color=\"#0000FF\"> SIDONIe - Paramètres des orbites</font></h1>"))

	    (debug-display "BiglooCode.scm :: ResultatMesuresF : = (java.sql.ResultSet-wasNull rs):")
	    (debug-display (java.sql.ResultSet-wasNull rs))
	    (debug-newline)

	    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur = " (number->string flagerreur)))

	    (if (not (java.sql.ResultSet-first rs))
		(then-block ;; empty result set
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF :  empty result set"))
		  (set! baratin "Cet objet n'a pas d'orbite calculée !")
		  (set! flagerreur 1))
		(else-block
		  (set! jresult (java.sql.ResultSet-getString2 rs 1))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 1 = " result))
		  
		  (when (and (string-null? result) (string=? identificateur "Nom"))
			(set! baratin "Cet objet n'a pas d'orbite calculée !")
			(set! flagerreur 1))))


	    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur 1 = " (number->string flagerreur)))

	    (if (not (java.sql.ResultSet-first rs))
		(then-block ;; empty result set
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF :  empty result set"))
		  (set! baratin "Cet objet n'a pas d'orbite calculée !")
		  (set! flagerreur 1))
		(else-block
		 (set! jresult (java.sql.ResultSet-getString2 rs 3))
		 (display-wasnull rs)
		 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 3 = " result))
		 (when (and (string-null? result) (string=? identificateur "N° BD"))
		       (set! baratin "Cet objet n'a pas d'orbite calculée !")
		       (set! flagerreur 1))))

	    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur 3 = " (number->string flagerreur)))


	    (if (not (java.sql.ResultSet-first rs))
		(then-block ;; empty result set
		 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF :  empty result set"))
		  (set! baratin "Cet objet n'a pas d'orbite calculée !")
		  (set! flagerreur 1))
		(else-block
		 (set! jresult (java.sql.ResultSet-getString2 rs 4))
		 (display-wasnull rs)
		 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 4 = " result))
		  
		 (when (and (string-null? result) (string=? identificateur "N° ADS"))
		       (set! baratin "Cet objet n'a pas d'orbite calculée !")
		       (set! flagerreur 1))))
		  
		 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur 4 = " (number->string flagerreur)))

		 (if (not (java.sql.ResultSet-first rs))
		     (then-block ;; empty result set
		      (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF :  empty result set"))
		      (set! baratin "Cet objet n'a pas d'orbite calculée !")
		      (set! flagerreur 1))
		     (else-block
		      (set! jresult (java.sql.ResultSet-getString2 rs 10))
		      (display-wasnull rs)
		      (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		      (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 10 = " result))
		      (when (and  (string-null? result) (string=? identificateur "N° HIP"))
		       (set! baratin "Cet objet n'a pas d'orbite calculée !")
		       (set! flagerreur 1))))
		 

		 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur 10 = " (number->string flagerreur)))
		 
		 (if (not (java.sql.ResultSet-first rs))
		     (then-block ;; empty result set
		      (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF :  empty result set"))
		      (set! baratin "Cet objet n'a pas d'orbite calculée !")
		      (set! flagerreur 1))
		     
		     (else-block
		      (set! jresult (java.sql.ResultSet-getString2 rs 11))
		      (display-wasnull rs)
		      (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		      (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 11 Orb = " result))
		      (when (java.sql.ResultSet-wasNull rs)
			    (set! baratin "Cet objet n'a pas d'orbite calculée !")
			    (set! flagerreur 1))
		      
		      ) ;; du else
		     
		     ) ;; fin (if (not (java.sql.ResultSet-first rs)) 
		  
		  
	    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur 11 = " (number->string flagerreur)))

	    (if (equal? flagerreur 1)
		      
		(set! res (string-append
			   res
			    "<div align=\"center\">
                                  <center>
                                           <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                             <tr>
                                                 <th width=\"82%\">
                                                     <font color=\"#0000FF\">"
			                                 baratin "<br>
                                                     </font>
                                                 </th>
                                             </tr>
                                           </table>
                                 </center>
                           </div>
                           <P>
                           <P>"))

		
		(begin  ;; else du if
		  (set! res (string-append
			     res
			     "<div align=\"center\">
                                  <center>
                                          <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                                <tr>
                                                     <th>
                                                          <font color=\"#0000FF\"> Objet <br></font>"
			                                   (field-result-set-lower-case-ending rs 1 7)
			                             "</th>"
		                                            "<td align=\"center\"><font color=\"#0000FF\"> N° BD<br></font>"
							    (field-result-set-lowercase rs 3)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> N° ADS<br></font>"
							    (field-result-set-lowercase rs 4)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> N° HIP<br></font>"
							    (field-result-set-lowercase-check-star rs 10)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\">  Type Spectral<br></font>"
							    (field-result-set-lowercase-check-minus rs 9)
							    "</td>
                                               </tr>
					       <tr>
                                                    <td align=\"center\"><font color=\"#0000FF\"> Alpha 2000<br>"
							    (begin

							      (set! result-double (java.sql.ResultSet-getDouble2 rs 5))
							      ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : result-double =")
							      ;; (debug-display result-double)
							      ;; (debug-newline)

							      (if (java.sql.ResultSet-wasNull rs)
								  (set! result "&nbsp;")
								  (begin ;; else
								    (set! iresult (floor result-double))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult)


								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : iresult =")
								    ;; (debug-display iresult)
								    ;; (debug-newline)

								    (set! resulth (fix (/ iresult 1000)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (integer? resulth) 2 =")
								    (debug-display (integer? resulth))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (bignum? resulth) 2 =")
								    (debug-display (bignum? resulth))
								    (debug-newline)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF :  (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth) =")
								    ;; (debug-newline)
								    ;; (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth)
								    ;; (debug-newline)
								    
								    ;; (let ((bt1 16)
								    ;; 	  (bt2 0))
								    ;;   (display-expr-nl (bignum? bt1))
								    ;;   (display-msg-var-nl "bt1 =" bt1)
								    ;;   (debug-newline)
								    ;;   (display-expr-nl (bignum? bt2))
								    ;;   (display-msg-var-nl "bt1 =" bt2))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : resulth 2 =")
								    (debug-display resulth)
								    (debug-newline)

								    (set! resulth-str #;"result will be here" #;(number->string resulth) (num->string resulth))
								    (set! resultm (- iresult (* resulth 1000)))
								    (set! resultm (fix (/ resultm 10)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (integer? resultm) =")
								    (debug-display (integer? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (bignum? resultm) =")
								    (debug-display (bignum? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : resultm =")
								    (debug-display resultm)
								    (debug-newline)

								    (set! resultm-str (num->string resultm))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : resultm-str =")
								    (debug-display resultm-str)
								    (debug-newline)
								    
								    (set! results (- iresult (* resulth 1000) (* resultm 10)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : results =")
								    ;; (debug-display results)
								    ;; (debug-newline)
								    
								    (set! results-str (num->string (fix results)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : results-str =")
								    (debug-display results-str)
								    (debug-newline)

								    (when (< resulth 1)
									  (set! resulth-str "00"))
								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (< resulth 1)")

								    (when (and (>= resulth 1) (< resulth 10))
									  (set! resulth-str (string-append "0" resulth-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed  (and (>= resulth 1) (< resulth 10)")
								    (when (< resultm 10)
									  (set! resultm-str (string-append "0" resultm-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (< resultm 10)")

								    (set! result (string-append resulth-str " h " resultm-str "." results-str " mn"))))
							      (string-append "</font>" result "</td>")) ;; end begin
							   

						      "<td align=\"center\"><font color=\"#0000FF\"> Delta 2000<br>"

						      (begin

							  (set! result-double (java.sql.ResultSet-getDouble2 rs 6))
							  ;; (set! result2 result-double)
							  ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : result2 =")
							  ;; (debug-newline)
							  ;; (debug-display (real->string result2))
							  ;; (debug-newline)
							  (debug-display  "BiglooCode.scm :: ResultatMesuresF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double) = ")
							  (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double)

							  (if (java.sql.ResultSet-wasNull rs)
							      "&nbsp;"
							      (begin ;; else
								(if (< result-double 0)
								    (set! sign "-")
								    (set! sign "&nbsp;"))
								(set! aresult (abs result-double))
								(set! resultd (fix (/ aresult 100)))
								(set! resultd-str (num->string resultd))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (set! resultd-str (num->string resultd))")
								(set! resultmi (- aresult (* resultd 100)))
								(set! resultmi-str (num->string  (fix resultmi)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (set! resultmi-str (num->string (fix  resultmi)))")
								(when (< resultd 1)
								    (set! resultd-str "00"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed  (set! resultd-str \"00\")")
								(when (and (>= resultd 1) (< resultd 10))
								      (set! resultd-str (string-append "0" resultd-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (when (and (>= resultd 1) (< resultd 10)) ......")
								(when (< resultmi 10)
								      (set! resultmi-str (string-append "0" resultmi-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (when (< resultmi 10) .....")
								(set! result (string-append sign resultd-str " ° " resultmi-str " '"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (set! result (string-append sign resultd-str ....")
								(debug-display  "BiglooCode.scm :: ResultatMesuresF : result =")
								(debug-display result)
								(debug-newline)
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed display")
								) ;; end begin else
							      ) ;; end if (java.sql.ResultSet-wasNull rs)
							  (string-append "</font>" result "</td>")) ;; end begin
							
							"<td align=\"center\"><font color=\"#0000FF\"> mag 1<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 7))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 7 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "0")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))

								"<td align=\"center\"><font color=\"#0000FF\"> mag 2<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 8))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 8 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "0")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))
							
							
							"<td align=\"center\"><font color=\"#0000FF\"> Orbite calculée ?<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 11))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 11 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "*")
								(set! result "NON"))

							  (string-append "</font>" result "</td>"))
							
							
							"</tr>
                                                  </table>
                                               </center>
                                            </div>"
				
							;; vaut mieux pas continuer la (syntaxe lourde)

				   )  ;; close string-append
			   ) ;; close set! res

		     ;; continuer ici
		     (set! res (string-append
			    res
			    "<P>
                             <P>
                                <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\100%\>
                                  <tr>
                                      <th><font color=\#000080\> Auteur</font></th>
                                      <th><font color=\#000080\> Année</font></th>
                                      <th><font color=\#000080\> Réf.</font></th>
                                      <th><font color=\#000080\> P</font></th>
                                      <th><font color=\#000080\> n</font></th>
                                      <th><font color=\#000080\> T</font></th>
                                      <th><font color=\#000080\> a</font></th>
                                      <th><font color=\#000080\> e</font></th>
                                      <th><font color=\#000080\> i</font></th>
                                      <th><font color=\#000080\> o</font></th>
                                      <th><font color=\#000080\> w</font></th>
                                      <th><font color=\#000080\> 	Notes</font></th>
                                  </tr>"))
		     
		     (java.sql.ResultSet-first rs) ;; rs.movefirst

		     (while (not (java.sql.ResultSet-isAfterLast rs))
			    
			    (set! res (string-append
				       res
				       "<tr>"))
			    
			    (set! jresult (java.sql.ResultSet-getString2 rs 12))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 12 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" (string-upcase result) " &nbsp;</td>"))

			    (set! result (number->string (java.sql.ResultSet-getInt2 rs 13)))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 13 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 14))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 14 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 15))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 15 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))
			    
			    (set! jresult (java.sql.ResultSet-getString2 rs 16))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 16 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 17))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 17 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 18))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 18 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 20))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 20 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 21))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 21 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))
			    
			    (set! jresult (java.sql.ResultSet-getString2 rs 22))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 22 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 23))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 23 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 19))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 19 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>
                                                 </tr>"))

			    (java.sql.ResultSet-next rs) ;; rs.Movenext

		     ) ;; end while

		     (set! res (string-append res "</table>"))

		     ) ;; end begin else du if flagerreur 1


		   ) ;; close if flagerreur 1


	    ) ;;  fin cas dans COND : ((string=?  choixres "Orbite")

	   ((string=?  choixres "Ref")

	    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (cond : Ref")

	    (set! sqlrefere (string-append sqlrefere-begin monchoix sqlrefere-end monordreref))

	    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF :: (eu.oca.DataBase-executeQueryStatic (java.lang.String-java.lang.String8 sqlrefere))")
	    (eu.oca.DataBase-executeQueryStatic (java.lang.String-java.lang.String8 sqlrefere))

	    (set! res (string-append res "<h1 align=\"center\"><font color=\"#0000FF\"> SIDONIe - Références</font></h1>"))

	    (debug-display "BiglooCode.scm :: ResultatMesuresF : = (java.sql.ResultSet-wasNull rs):")
	    (debug-display (java.sql.ResultSet-wasNull rs))
	    (debug-newline)

	    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur = " (number->string flagerreur)))

	    (if (not (java.sql.ResultSet-first rs))
		(begin ;; empty result set
		   (set! baratin "Il n'existe pas de références pour cet objet !")
		   (set! flagerreur 1))
		(begin
		  (set! jresult (java.sql.ResultSet-getString2 rs 1))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 1 = " result))

		  (when (and (string-null? result) (string=? identificateur "Nom"))
			(set! baratin "Il n'existe pas de références pour cet objet !")
			(set! flagerreur 1))

		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur 1 = " (number->string flagerreur)))

		  (set! jresult (java.sql.ResultSet-getString2 rs 3))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 3 = " result))
		  
		  (when (and (string-null? result) (string=? identificateur "N° BD"))
			(set! baratin "Il n'existe pas de références pour cet objet !")
			(set! flagerreur 1))

		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur 3 = " (number->string flagerreur)))


		  (set! jresult (java.sql.ResultSet-getString2 rs 4))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 4 = " result))
		  
		  (when (and (string-null? result) (string=? identificateur "N° ADS"))
			(set! baratin "Il n'existe pas de références pour cet objet !")
			(set! flagerreur 1))

		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur 4 = " (number->string flagerreur)))


		  (set! jresult (java.sql.ResultSet-getString2 rs 10))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 10 = " result))

		  (when (and  (string-null? result) (string=? identificateur "N° HIP"))
			(set! baratin "Il n'existe pas de références pour cet objet !")
			(set! flagerreur 1))

		  
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : flagerreur 10 = " (number->string flagerreur)))


		  ) ;; fin begin du else
		
		) ;; fin (if (not (java.sql.ResultSet-first rs)) 
		  

	    (if (equal? flagerreur 1)
		 
		(set! res (string-append
			   res
			    "<div align=\"center\">
                                  <center>
                                           <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                             <tr>
                                                 <th width=\"82%\">
                                                     <font color=\"#0000FF\">"
			                                 baratin "<br>
                                                     </font>
                                                 </th>
                                             </tr>
                                           </table>
                                 </center>
                           </div>
                           <P>
                           <P>"))

		
		(begin  ;; else du if
		     (set! res (string-append
			    res
			    "<div align=\"center\">
                                  <center>
                                          <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                                <tr>
                                                     <th>
                                                          <font color=\"#0000FF\"> Objet <br></font>"
			                                   (field-result-set-lower-case-ending rs 1 7)
			                             "</th>"
		                                            "<td align=\"center\"><font color=\"#0000FF\"> N° BD<br></font>"
							    (field-result-set-lowercase rs 3)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> N° ADS<br></font>"
							    (field-result-set-lowercase rs 4)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> N° HIP<br></font>"
							    (field-result-set-lowercase-check-star rs 10)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\">  Type Spectral<br></font>"
							    (field-result-set-lowercase-check-minus rs 9)
							    "</td>
                                               </tr>
					       <tr>
                                                    <td align=\"center\"><font color=\"#0000FF\"> Alpha 2000<br>"
							    (begin

							      (set! result-double (java.sql.ResultSet-getDouble2 rs 5))
							      ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : result-double =")
							      ;; (debug-display result-double)
							      ;; (debug-newline)

							      (if (java.sql.ResultSet-wasNull rs)
								  (set! result "&nbsp;")
								  (begin ;; else
								    (set! iresult (floor result-double))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult)


								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : iresult =")
								    ;; (debug-display iresult)
								    ;; (debug-newline)

								    (set! resulth (fix (/ iresult 1000)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : coucou (integer? resulth) =")
								    (debug-display (integer? resulth))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (bignum? resulth) =")
								    (debug-display (bignum? resulth))
								    (debug-newline)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF :  (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth) =")
								    ;; (debug-newline)
								    ;; (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth)
								    ;; (debug-newline)

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : INTRO")

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : resulth 3 =")
								    (debug-display resulth)
								    (debug-newline)

								    (debug-display "BiglooCode.scm :: ResultatMesuresF : before code change")
								    (debug-newline)

								    (set! resulth-str #;"result will be here" #;(number->string resulth) (num->string resulth))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : after code change")
								    
								    (set! resultm (- iresult (* resulth 1000)))
								    (set! resultm (fix (/ resultm 10)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (integer? resultm) =")
								    (debug-display (integer? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (bignum? resultm) =")
								    (debug-display (bignum? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : resultm =")
								    (debug-display resultm)
								    (debug-newline)

								    (set! resultm-str (num->string resultm))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : resultm-str =")
								    (debug-display resultm-str)
								    (debug-newline)
								    
								    (set! results (- iresult (* resulth 1000) (* resultm 10)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : results =")
								    ;; (debug-display results)
								    ;; (debug-newline)
								    
								    (set! results-str (num->string (fix results)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresF : results-str =")
								    (debug-display results-str)
								    (debug-newline)

								    (when (< resulth 1)
									  (set! resulth-str "00"))
								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (< resulth 1)")

								    (when (and (>= resulth 1) (< resulth 10))
									  (set! resulth-str (string-append "0" resulth-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed  (and (>= resulth 1) (< resulth 10)")
								    (when (< resultm 10)
									  (set! resultm-str (string-append "0" resultm-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (< resultm 10)")

								    (set! result (string-append resulth-str " h " resultm-str "." results-str " mn"))))
							      (string-append "</font>" result "</td>")) ;; end begin
							   

						      "<td align=\"center\"><font color=\"#0000FF\"> Delta 2000<br>"

						        (begin

							  (set! result-double (java.sql.ResultSet-getDouble2 rs 6))
							  ;; (set! result2 result-double)
							  ;; (debug-display  "BiglooCode.scm :: ResultatMesuresF : result2 =")
							  ;; (debug-newline)
							  ;; (debug-display (real->string result2))
							  ;; (debug-newline)
							  (debug-display  "BiglooCode.scm :: ResultatMesuresF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double) = ")
							  (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double)

							  (if (java.sql.ResultSet-wasNull rs)
							      "&nbsp;"
							      (begin ;; else
								(if (< result-double 0)
								    (set! sign "-")
								    (set! sign "&nbsp;"))
								(set! aresult (abs result-double))
								(set! resultd (fix (/ aresult 100)))
								(set! resultd-str (num->string resultd))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (set! resultd-str (num->string resultd))")
								(set! resultmi (- aresult (* resultd 100)))
								(set! resultmi-str (num->string  (fix resultmi)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (set! resultmi-str (num->string (fix  resultmi)))")
								(when (< resultd 1)
								    (set! resultd-str "00"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed  (set! resultd-str \"00\")")
								(when (and (>= resultd 1) (< resultd 10))
								      (set! resultd-str (string-append "0" resultd-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (when (and (>= resultd 1) (< resultd 10)) ......")
								(when (< resultmi 10)
								      (set! resultmi-str (string-append "0" resultmi-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (when (< resultmi 10) .....")
								(set! result (string-append sign resultd-str " ° " resultmi-str " '"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed (set! result (string-append sign resultd-str ....")
								(debug-display  "BiglooCode.scm :: ResultatMesuresF : result =")
								(debug-display result)
								(debug-newline)
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresF : passed display")
								) ;; end begin else
							      ) ;; end if (java.sql.ResultSet-wasNull rs)
							  (string-append "</font>" result "</td>")) ;; end begin
							
							"<td align=\"center\"><font color=\"#0000FF\"> mag 1<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 7))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 7 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "0")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))

								"<td align=\"center\"><font color=\"#0000FF\"> mag 2<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 8))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 8 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "0")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))
							
							
							"<td align=\"center\"><font color=\"#0000FF\"> Orbite calculée ?<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 11))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 11 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "*")
								(set! result "NON"))

							  (string-append "</font>" result "</td>"))
							
							
							"</tr>
                                                  </table>
                                               </center>
                                            </div>"
				
							;; vaut mieux pas continuer la (syntaxe lourde)

				   )  ;; close string-append
			   ) ;; close set! res

		     ;; continuer ici
		     (set! res (string-append
			    res
			    "<P>
                             <P>
                                <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\100%\>
                                  <tr>
                                      <th><font color=\#000080\> Réf. </font></th>
                                      <th><font color=\#000080\> Revue </font></th>
                                      <th><font color=\#000080\> Titre </font></th>
                                  </tr>"))
		     
		     (java.sql.ResultSet-first rs) ;; rs.movefirst

		     (while (not (java.sql.ResultSet-isAfterLast rs))
			    
			    (set! res (string-append
				       res
				       "<tr>"))
			    
			    (set! jresult (java.sql.ResultSet-getString2 rs 12))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 12 Réf = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" (string-upcase result) " &nbsp;</td>"))

			    ;;(set! result (number->string (java.sql.ResultSet-getInt2 rs 13)))
			    (set! jresult (java.sql.ResultSet-getString2 rs 13))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result Revue = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 14))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresF : result 14 Titre = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>" 
                                           "</tr>"))
			    
			    (java.sql.ResultSet-next rs) ;; rs.Movenext

		     ) ;; end while

		     (set! res (string-append res "</table>"))
		     
		     ) ;; end begin else du if flagerreur 1

		   ) ;; end if flagerreur 1
		  
	    ) ;;  fin cas dans COND : ((string=?  choixres "Ref")


	   (else ;; du COND 
	    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: UNSUPPORTED CASE with choixres =" choixres))) ;; fin COND

	  ;; en ASP la connection a la BDD est fermée ici

	  ) ;; end begin
	  
	) ;; end if (or (= flagerreur 1) (= flaguni 1) (= flagexiste 1))

    ;; closing connection to database
    (if dyna
	(eu.oca.DataBase-closeDynamic db)
	(begin
	  (eu.oca.DataBase-closeStatic)
	  #;(eu.oca.DataBase-deregisterDriverStatic)))

    (set! res (string-append res 
			     "
                       <table border=\"0\" width=\"95%\">
                                 <tr>
                                       <td valign=\"top\">" 
                                            ;;"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                                           "<a href=\"../SidonieDonneesF.html\"><img src=\"../retour_blanc.gif\" border=\"0\" width=\"26\" height=\"26\"></a> 
                                          <font size=\"2\">
                                              <em>Recherche sur un objet</em>
                                          </font>
                                     </td>
                                     <td valign=\"top\">
                                          <a href=\"../ParametresF.html\">
                                              <img src=\"../retour_blanc.gif\" border=\"0\" width=\"26\" height=\"26\"></a> 
                                          <font size=\"2\">
                                               <em>Recherche statistique</em>
                                          </font>
                                     </td>"
                          ;; "</h5>" ;; /h5 was here but no h5 upside !!!
                                     "</td>
                                </tr>
                            </table>"))

    ;; (set! res (string-append res  "<br>"
    ;; 			          "<h1> "
    ;; 			                 "identificateur = " bstr_identificateur 
    ;; 			                 " , T1 = " bstr_objet 
    ;; 			                 " , choixres = " bstr_choixres
    ;; 			                 " , baraterreur = " baraterreur 
    ;; 					 " , flagerreur = " (number->string flagerreur) 
    ;; 					 " , flaguni = " (number->string flaguni) 
    ;; 					 " , flagexiste = " (number->string flagexiste)
    ;; 					 " , flagobjet = " (number->string flagobjet) 
    ;;                               "</h1>"))

    (set! res (string-append res "</body></html>"))


    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: res = " res) 
  
    (set! len (string-length res))

    (let  (
	   (bstr (make-byte* len))
	   )
      ;;(set! bstr res)
      (set! bstr ($string->bstring res))
      bstr)

    
    )


  )
 






(define (ResultatMesuresFbeta bstr_identificateur bstr_objet)
  
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: bstr_identificateur = " bstr_identificateur)
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: bstr_objet = " bstr_objet)
    
  (define len_bstr_identificateur (byte*-length bstr_identificateur))
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: len_identificateur = " len_bstr_identificateur)
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: (string? bstr_identificateur) = " (string? bstr_identificateur))

  (define identificateur (make-string len_bstr_identificateur))
  ;;(define objet "")

  (set! identificateur  bstr_identificateur)
  ;;(set! identificateur  (string-append bstr_identificateur))

  ;;(debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: (string-append \"\" bstr_identificateur) = "  (string-append "" bstr_identificateur))
  ;;(set! objet bstr_objet)

  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: identificateur = " identificateur)
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: (string? identificateur) = " (string? identificateur))
  
  (debug-display (string-append "TEST "  identificateur))
  (debug-newline)
  
  (define essai (string-append "TEST "  identificateur))
  (debug-display essai)
  (debug-newline)
    
  (define essai2 "")
  (set!  essai2 (string-append "TEST "  identificateur))
  (debug-display essai2)
  (debug-newline)
  
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: essai = " essai)
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: essai2 = " essai2)
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: identificateur = " identificateur)
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: (string? essai) = " (string? essai))
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: (string? essai2) = " (string? essai2))
  
  (define baraterreur  "Veuillez re-initialiser la page et recommencer la requète : ") ;; baratin erreur
  
  (define flagerreur 0) ;; flag erreur

  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: (string=? identificateur \"\") = "  (string=? identificateur ""))
  
  (when (string=? identificateur "") ;;(when (equal? identificateur "")
  	(set! flagerreur 1)
  	(set! baraterreur (string-append baraterreur " Vous devez choisir un identificateur ! "))
  	(display-msg-symb-nl "BiglooCode.scm :: ResultatMesuresFbeta ::" flagerreur))

  ;; (if  (string=? identificateur "");;(string=? identificateur "") ;;(when (equal? identificateur "")
  ;;     (begin
  ;; 	(set! flagerreur 1)
  ;; 	(set! baraterreur (string-append baraterreur " Vous devez choisir un identificateur ! "))
  ;; 	(display-msg-symb-nl "BiglooCode.scm :: ResultatMesuresFbeta ::" flagerreur))
  ;;     '())
  
  (display-msg-symb-nl "BiglooCode.scm :: ResultatMesuresFbeta ::" flagerreur)

  ;;(define char-set "ISO-8859-1") 
  (define char-set "UTF-8") ;; HTML 5 char set
  
  
  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: identificateur = " identificateur)
  (define res (string-append "<html> "  "<head>" "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=" char-set "\">" "<title>" "Sidonie HTML Response" "</title>" "</head>" "<body>" "<h1> " "identificateur = " bstr_identificateur " , T1 = " bstr_objet " , baraterreur = " baraterreur ", flagerreur = " (number->string flagerreur) "</h1>" "</body></html>"))
  
  ;;(debug-display-var-nl "BiglooCode.scm :: ResultatMesuresFbeta :: res = " res) 
  
  (define len (string-length res))
  (define bstr  (make-byte* len))
  (set! bstr res)
  bstr
    
  )


(define (ResultatMesuresAF bstr_identificateur bstr_objet bstr_choixres)
  
  (let* (
	 (len_bstr_identificateur (byte*-length bstr_identificateur))
	 (identificateur (make-string len_bstr_identificateur))
	 (len_bstr_objet (byte*-length bstr_objet))
	 (objet (make-string len_bstr_objet))
	 (len_bstr_choixres (byte*-length bstr_choixres))
	 (choixres (make-string len_bstr_choixres))
	 (essai "")
	 (baraterreur "Please reload the page and resume : " ) ;; baratin erreur
	 (baratexiste "The request object exist but with the following name, click submit button to continue :") ;; baratin existe
	 (baratobjet " Requested object exist but there are also objects with the same identifier (see list) !")
	 (baratuni "Several objects correspond to your request, choose one in the list and click the submit button aside it:")
	 (flagerreur 0) ;; flag erreur
	 (flaguni 0)  ;; flag unique
	 (flagexiste 0) ;; flag existe
	 (char-set "UTF-8")  ;; "ISO-8859-1") ;; HTML 5 char set 
	 (len 0)
	 (dyna #f)
	 (db (if dyna
		 (eu.oca.DataBase-new)
		 '())) ;; database
	 (monchoix "")
	 (flagnom 0)
	 (flaguni 0)
	 (flagobjet 0)
	 (requeteuni::java.lang.String  (begin
					  (set! objet bstr_objet)
					  (set! objet (convert-Nom objet))
					  ;;(eu.oca.bigloofunct.JavaForBigloo-bstring->jstring (string-append "SELECT DISTINCTROW Coordonnées.Nom FROM Coordonnées WHERE Coordonnées.Nom Like '" objet " %'"))
					  (eu.oca.bigloofunct.JavaForBigloo-bstring->jstring (string-append "SELECT DISTINCTROW Coordonnées.Nom FROM Coordonnées WHERE Coordonnées.Nom Like '" objet "%' ORDER BY Coordonnées.Nom"))))
	 (requetexiste "")
	 ;;(requetexiste::java.lang.String (java.lang.String-java.lang.String8 (string-append "SELECT DISTINCTROW Coordonnées.Nom FROM Coordonnées WHERE Coordonnées.Nom Like '" objet "'")))
	 ;;(jstr::%jstring (eu.oca.bigloofunct.JavaForBigloo-bstring->jstring "hello boy"))
	 (jstr::java.lang.String (eu.oca.bigloofunct.JavaForBigloo-bstring->jstring "hello boy")) 
	 (nombreobjets 0)
	 (objetexiste 0)
	 (rsuni::java.sql.ResultSet eu.oca.DataBase-resultSet2)
	 (rsexiste::java.sql.ResultSet eu.oca.DataBase-resultSet)
	 ;;(rs::java.sql.ResultSet eu.oca.DataBase-resultSetRequete)
	 (rs::java.sql.ResultSet eu.oca.DataBase-resultSet)
	 
	 (marequete
	  (sql-server->mysql-server-syntax 
	   (string-append
	    "SELECT DISTINCTROW Coordonnées.Nom, Coordonnées.[N° Fiche], Coordonnées.[N° BD], Coordonnées.[N° ADS]"
	    ", Coordonnées.[Alpha 2000], Coordonnées.[Delta 2000], Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre" 
	    ", Coordonnées.[N° HIP], Coordonnées.[Orb]"
	    ", Mesures.Date, Mesures.Angle, Mesures.Sépar, Mesures.[Nb Nuits], Mesures.CodeObs,"
	    " Mesures.dimension, Mesures.Instrument, Mesures.Réf, Mesures.Nota"
	    " FROM Coordonnées INNER JOIN Mesures ON Coordonnées.[N° Fiche] = Mesures.[N° Fiche] WHERE")))
	 (monordremes " ORDER BY Mesures.Date")
	 
	 (sqlorbite
	   (sql-server->mysql-server-syntax 
	   (string-append
	    "SELECT DISTINCTROW Coordonnées.Nom, Coordonnées.[N° Fiche], Coordonnées.[N° BD], Coordonnées.[N° ADS]"
	    ", Coordonnées.[Alpha 2000], Coordonnées.[Delta 2000], Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre"
	    ", Coordonnées.[N° HIP], Coordonnées.[Orb]"
	    ", orbite.Auteur, orbite.Année, orbite.référence, orbite.Période, orbite.[moyen mt], orbite.périastre"
	    ", orbite.[mi gd axe], orbite.notes, orbite.excentric, orbite.inclin, orbite.noeud, orbite.[noeud/péri]"
	    " FROM Coordonnées INNER JOIN orbite ON Coordonnées.[N° Fiche] = orbite.[N° Fiche] WHERE")))
	 (monordreorb " ORDER BY orbite.Année")
	 

	 ;; this SQL is endless on MySQL server:
	 ;; SELECT DISTINCTROW Coordonnées.Nom, Coordonnées.`N° Fiche`, Coordonnées.`N° BD`, Coordonnées.`N° ADS`, Coordonnées.`Alpha 2000`, Coordonnées.`Delta 2000`, Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre, Coordonnées.`N° HIP`, Coordonnées.`Orb`, Mesures.Réf, Références.Revue, Références.Titre FROM Coordonnées INNER JOIN (Mesures INNER JOIN Références ON Mesures.Réf = Références.refer) ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` GROUP BY Coordonnées.Nom, Coordonnées.`N° Fiche`, Coordonnées.`N° BD`, Coordonnées.`N° ADS`, Coordonnées.`Alpha 2000`, Coordonnées.`Delta 2000`, Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre, Coordonnées.`N° HIP`, Coordonnées.`Orb`, Mesures.Réf, Références.Revue, Références.Titre HAVING Coordonnées.Nom Like 'COU 1027' ORDER BY Références.Revue;
	 ;;
	 ;; must be replaced by:
	 ;;
	 ;; SELECT DISTINCTROW tmp.Nom,tmp.`N° Fiche`,tmp.`N° BD`, tmp.`N° ADS`, tmp.`Alpha 2000`, tmp.`Delta 2000`,tmp.mag1,tmp.mag2,tmp.Spectre,tmp.`N° HIP`,tmp.`Orb`,  tmp.Réf,Références.Titre FROM (SELECT DISTINCTROW Coordonnées.Nom, Mesures.Réf FROM Coordonnées INNER JOIN Mesures ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` WHERE Coordonnées.Nom Like 'a 426') tmp INNER JOIN Références ON tmp.Réf = Références.refer;
	 ;;
	 ;; SELECT DISTINCTROW tmp.Nom,tmp.`N° Fiche`, tmp.`N° BD`, tmp.`N° ADS`, tmp.`Alpha 2000`, tmp.`Delta 2000`,tmp.mag1,tmp.mag2,tmp.Spectre,tmp.`N° HIP`,tmp.`Orb`, tmp.Réf,Références.Revue,Références.Titre FROM (SELECT DISTINCTROW Coordonnées.Nom,Coordonnées.`N° Fiche`,Coordonnées.`N° BD`, Coordonnées.`N° ADS`, Coordonnées.`Alpha 2000`, Coordonnées.`Delta 2000`, Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre, Coordonnées.`N° HIP`, Coordonnées.`Orb`, Mesures.Réf FROM Coordonnées INNER JOIN Mesures ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` WHERE Coordonnées.Nom Like 'a 426') tmp INNER JOIN Références ON tmp.Réf = Références.refer;
	 ;;
	 ;;  SELECT DISTINCTROW tmp.Nom,tmp.Réf,Références.Titre FROM (SELECT DISTINCTROW Coordonnées.Nom, Mesures.Réf FROM Coordonnées INNER JOIN Mesures ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` WHERE Coordonnées.Nom Like 'a 426') tmp INNER JOIN Références ON tmp.Réf = Références.refer;
	 ;; (sqlrefere
	 ;;   (sql-server->mysql-server-syntax 
	 ;;   (string-append
	 ;;     "SELECT DISTINCTROW Coordonnées.Nom, Coordonnées.[N° Fiche], Coordonnées.[N° BD], Coordonnées.[N° ADS]"
	 ;;     ", Coordonnées.[Alpha 2000], Coordonnées.[Delta 2000], Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre"
	 ;;     ", Coordonnées.[N° HIP], Coordonnées.[Orb]"
	 ;;     ", Mesures.Réf, Références.Revue"
	 ;;     ", Références.Titre"
	 ;;     " FROM Coordonnées INNER JOIN (Mesures INNER JOIN Références ON"
	 ;;     " Mesures.Réf = Références.refer) ON Coordonnées.[N° Fiche] = Mesures.[N° Fiche]"
	 ;;     " GROUP BY Coordonnées.Nom, Coordonnées.[N° Fiche], Coordonnées.[N° BD], Coordonnées.[N° ADS]"
	 ;;     ", Coordonnées.[Alpha 2000], Coordonnées.[Delta 2000], Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre"
	 ;;     ", Coordonnées.[N° HIP], Coordonnées.[Orb]"
	 ;;     ", Mesures.Réf, Références.Revue"
	 ;;     ", Références.Titre HAVING")))

	 ;; (sqlrefere
	 ;;  "SELECT DISTINCTROW tmp.Nom,tmp.`N° Fiche`, tmp.`N° BD`, tmp.`N° ADS`, tmp.`Alpha 2000`, tmp.`Delta 2000`,tmp.mag1,tmp.mag2,tmp.Spectre,tmp.`N° HIP`,tmp.`Orb`, tmp.Réf,Références.Revue,Références.Titre FROM (SELECT DISTINCTROW Coordonnées.Nom,Coordonnées.`N° Fiche`,Coordonnées.`N° BD`, Coordonnées.`N° ADS`, Coordonnées.`Alpha 2000`, Coordonnées.`Delta 2000`, Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre, Coordonnées.`N° HIP`, Coordonnées.`Orb`, Mesures.Réf FROM Coordonnées INNER JOIN Mesures ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` WHERE Coordonnées.Nom Like 'a 426') tmp INNER JOIN Références ON tmp.Réf = Références.refer")

	 (sqlrefere "") ;; will be construct later

	 (sqlrefere-begin
	  "SELECT DISTINCTROW tmp.Nom,tmp.`N° Fiche`, tmp.`N° BD`, tmp.`N° ADS`, tmp.`Alpha 2000`, tmp.`Delta 2000`,tmp.mag1,tmp.mag2,tmp.Spectre,tmp.`N° HIP`,tmp.`Orb`, tmp.Réf,Références.Revue,Références.Titre FROM (SELECT DISTINCTROW Coordonnées.Nom,Coordonnées.`N° Fiche`,Coordonnées.`N° BD`, Coordonnées.`N° ADS`, Coordonnées.`Alpha 2000`, Coordonnées.`Delta 2000`, Coordonnées.mag1, Coordonnées.mag2, Coordonnées.Spectre, Coordonnées.`N° HIP`, Coordonnées.`Orb`, Mesures.Réf FROM Coordonnées INNER JOIN Mesures ON Coordonnées.`N° Fiche` = Mesures.`N° Fiche` WHERE")

	 (sqlrefere-end 
	   " GROUP BY Mesures.Réf) tmp INNER JOIN Références ON tmp.Réf = Références.refer GROUP BY tmp.Nom, tmp.`N° Fiche`, tmp.`N° BD`, tmp.`N° ADS`, tmp.`Alpha 2000`, tmp.`Delta 2000`, tmp.mag1, tmp.mag2, tmp.Spectre, tmp.`N° HIP`, tmp.`Orb`, Références.Revue, Références.Titre ")

	 (monordreref " ORDER BY Références.Revue")

	 (jresult::java.lang.String (java.lang.String-java.lang.String8 ""))
	 (result "")
	 (baratin "")
	 ;;(result-double #;::float 0.0)
	 (result-double '())
	 (result-double::double  0.0)
	 (result2::real 0.0)
	 (bs-result "")
	 (len-bs-result 0)
	 (str-result "")
	 (rd '())
	 (iresult 0)
	 (resulth 0) ;; hours
	 (resulth-str "") ;; hours string
	 (resultm 0) ;; minutes
	 (resultm-str "") ;; minutes string
	 (results 0) ;; seconds
	 (results-str "") ;; seconds string
	 (sign "") ;; signe
	 (aresult 0.0) ;; absolute value
	 (resultd 0)
	 (resultd-str "")
	 (resultmi 0)
	 (resultmi-str "")
	 (lang "english")
	 )

    ;;(display-msg-symb-nl  "BiglooCode.scm :: ResultatMesuresAF ::" nombreobjets ) ;; je sais pas pourquoi cette macro fais planter bigloo ici mais pas dans d'autres situations
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF ::  nombreobjets = "  nombreobjets )
    ;;(eu.oca.bigloofunct.JavaForBigloo-bstringTojstring '()) ;;"hello boy")
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: bstr_identificateur = " bstr_identificateur)
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: bstr_objet = " bstr_objet)
    
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: len_identificateur = " len_bstr_identificateur)
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: (string? bstr_identificateur) = " (string? bstr_identificateur))
    ;;(eu.oca.bigloofunct.JavaForBigloo-bstring->jstring "hello boy")
   
    (set! res (string-append
	       "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
               <html>
                     <head>
                            <meta http-equiv=\"Content-Type\" content=\"text/html; charset=" char-set "\">
                            <meta name=\"GENERATOR\" content=\"Microsoft FrontPage 5.0\">
                            <title>SIDONIe-Résultats : identifications et mesures</title>
                     </head>
                     <LINK rel=\"stylesheet\" href=\"../Style.css\" type=\"text/css\">
               <body>"))


    ;;(set! identificateur  ($bstring->string bstr_identificateur))
    (set! identificateur bstr_identificateur)
    ;;(set! identificateur  (string-append bstr_identificateur))

    ;;(debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: (string-append \"\" bstr_identificateur) = "  (string-append "" bstr_identificateur))
    
    ;;(set! objet ($bstring->string bstr_objet))
    ;;(set! choixres ($bstring->string bstr_choixres)) 

    (set! choixres bstr_choixres) 

    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: identificateur = " identificateur)
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: (string? identificateur) = " (string? identificateur))
  
    (debug-display (string-append "TEST "  identificateur))
    (debug-newline)

    (set!  essai (string-append "TEST "  identificateur))
    (debug-display essai)
    (debug-newline)

    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: essai = " essai)
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: identificateur = " identificateur)
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: (string? essai) = " (string? essai))
    
    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: (string=?  identificateur \"\" ) = "  (string=?  identificateur ""))


     ;; database driver search
    
    (debug-newline)

    (if dyna 
	(begin
	  (eu.oca.DataBase-searchDriverDynamic db)

	  (eu.oca.DataBase-connectDynamic db)

	  ;;(eu.oca.DataBase-connectDynamic db) ;; testing fool proof overconnections

	  (eu.oca.DataBase-createStatementDynamic db) ;; i put the statement it if it's true it can be reused for multiple SQL queries

	  )
	(begin 
	  (eu.oca.DataBase-searchDriverStatic)

	  (eu.oca.DataBase-connectStatic)

	  ;;(eu.oca.DataBase-connectStatic) ;; testing fool proof overconnections

	  (eu.oca.DataBase-createStatementStatic) ;; i put the statement here if it's true it can be reused for multiple SQL queries
	  ))

    (debug-newline)

    (when (string-null? identificateur) ;;(string=? identificateur "") ;;(when (equal? identificateur "")
	  (set! flagerreur 1)
	  (set! baraterreur (string-append baraterreur " You need to give an identifier ! " )))
	
    (when (string-null? objet)
	  (set! flagerreur 1)
	  (set! baraterreur (string-append baraterreur " You need to give an object's name ! " )))

    (when (string-null? choixres)
	  (set! flagerreur 1)
	  (set! baraterreur (string-append baraterreur " You need to tick one type of information box ! " )))

   
    (cond
     ((string=? identificateur "Nom")
	 (set! monchoix (string-append " Coordonnées.Nom Like '" objet "'"))
	 (when (= flagerreur 0)
	       (set! flagnom 1)
	       (set! requetexiste (string-append "SELECT DISTINCTROW Coordonnées.Nom FROM Coordonnées WHERE Coordonnées.Nom Like '" objet "'"))
	       (set! jstr (eu.oca.bigloofunct.JavaForBigloo-bstring->jstring requetexiste))
	       
	       (if dyna
		   (begin
		     (eu.oca.DataBase-executeQueryDynamic db jstr)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-getval db)")
		     (eu.oca.DataBase-getval db)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: passed")
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-getresultSet db)")
		     (eu.oca.DataBase-getresultSet db)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: passed")
		     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (%jresultset-next (eu.oca.DataBase-getresultSet db))")
		     ;; (%jresultset-next (eu.oca.DataBase-getresultSet db))
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (java.sql.ResultSet-next (eu.oca.DataBase-getresultSet db))")
		     (java.sql.ResultSet-next (eu.oca.DataBase-getresultSet db))

		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: passed")
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-val db)")
		     (eu.oca.DataBase-val db)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: passed")
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-resultSet db)")
		     (eu.oca.DataBase-resultSet db)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: passed")
		     ;; (%jresultset-next (eu.oca.DataBase-resultSet db))
		     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before let")
		     ;; (let ((reset (eu.oca.DataBase-resultSet db)))
		     ;;   ;;(%jresultset-next reset)
		     ;;   (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (%jresultset-last reset)")
		     ;;   (%jresultset-last reset)
		     ;;   (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (set! nombreobjets (%jresultset-getRow reset))")
		     ;;   (set! nombreobjets (%jresultset-getRow reset))
		     ;;   (display-msg-symb-nl  "BiglooCode.scm :: ResultatMesuresAF ::" nombreobjets )
		     ;;   )
		     ;;(%jresultset-next (eu.oca.DataBase-resultSet db))
		     )
		   (begin
		     (eu.oca.DataBase-executeQueryStatic jstr) ;; equiv requetexiste
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (java.sql.ResultSet-next eu.oca.DataBase-resultSet)")
		     (java.sql.ResultSet-next eu.oca.DataBase-resultSet)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (java.sql.ResultSet-last eu.oca.DataBase-resultSet)")

		     ;; this is for counting
		     (java.sql.ResultSet-last eu.oca.DataBase-resultSet)
		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (set! objetexiste (java.sql.ResultSet-getRow eu.oca.DataBase-resultSet))")
		     (set! objetexiste (java.sql.ResultSet-getRow eu.oca.DataBase-resultSet))
		     ;;(display-msg-symb-nl  "BiglooCode.scm :: ResultatMesuresAF ::" objetexiste ) ;; je sais pas pourquoi cette macro fais planter bigloo ici mais pas dans d'autres situations (symbol->string plante avec le front end java)
		     (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF ::  objetexiste = "  objetexiste )
		     ;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (%jresultset-next eu.oca.DataBase-resultSet)")
		     ;;(%jresultset-next eu.oca.DataBase-resultSet)
		     
		     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: testing (symbol->string 'blabla) :")
		     ;; (symbol->string 'blabla)
		     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: test done")

		     (java.sql.ResultSet-beforeFirst eu.oca.DataBase-resultSet)
		     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (set! nombreobjets (java.sql.ResultSet-beforeFirst eu.oca.DataBase-resultSet))")

		     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: passed")
		     )
		   ) ;; end if dyna
	       
	       ;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-executeQueryStatic requeteuni)")
	       ;;(eu.oca.DataBase-executeQueryStatic requeteuni)
	       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-executeQueryStatic2args requeteuni2)")
	       (eu.oca.DataBase-executeQueryStatic2args requeteuni 2)
	       ;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (java.sql.ResultSet-last eu.oca.DataBase-resultSet)")
	       ;;(java.sql.ResultSet-last eu.oca.DataBase-resultSet)
	       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (java.sql.ResultSet-last rsuni)")
	       (java.sql.ResultSet-last rsuni)
	       ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (set! nombreobjets (java.sql.ResultSet-getRow eu.oca.DataBase-resultSet))")
	       ;; (set! nombreobjets (java.sql.ResultSet-getRow eu.oca.DataBase-resultSet))
	       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (set! nombreobjets (java.sql.ResultSet-getRow rsuni))")
	       (set! nombreobjets (java.sql.ResultSet-getRow rsuni))
	       (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF ::  nombreobjets = "  nombreobjets )
			     
	       ;;(java.sql.ResultSet-beforeFirst eu.oca.DataBase-resultSet)
	       (java.sql.ResultSet-beforeFirst rsuni)
	       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: passed-2")
	       
	       (when (> nombreobjets 1)
		     (set! flaguni 1))

	       (when (and (= objetexiste 0) (= nombreobjets 1))
		     (set! flagexiste 1))

	       (when (and (= objetexiste 1) (> nombreobjets 1))
		     (set! flagobjet 1))))

     ((string=? identificateur "N° ADS")
      (set! monchoix (sql-server->mysql-server-syntax (string-append " Coordonnées.[N° ADS] Like '" objet "'"))))
     
     ((string=? identificateur "N° BD")
      (set! monchoix (sql-server->mysql-server-syntax (string-append " Coordonnées.[N° BD] Like '" objet "'"))))

     ((string=? identificateur "N° HIP")
      (set! monchoix (sql-server->mysql-server-syntax (string-append  " Coordonnées.[N° HIP] Like '" objet "'"))))

     (else
      (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: UNSUPPORTED CASE with identificateur =" identificateur)))

    ;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: forcing flagexiste = 1")
    ;;(set! flagexiste 1)

    ;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: forcing flaguni = 1")
    ;;(set! flaguni 1)

    (if (or (= flagerreur 1) (= flaguni 1) (= flagexiste 1))

	(begin

	  (when (= flagerreur 1)
		(set! res (insert-baratin-in-HTML-english-short baraterreur res)))

	  
	  (when (= flagexiste 1)
		(set! res (insert-baratin-in-HTML-english baratexiste res))

		(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: nom :: (when (= flagexiste 1) :: before loop !")

		(let [(the-loop-on-resultset-function
		      ;; (the-loop-on-resultset-function-creator (lambda (x) x)))]
		       (the-loop-on-resultset-function-creator (create-function-form-around-string identificateur choixres lang)))]
		  
		  (the-loop-on-resultset-function rsuni))

		;;(the-loop-on-resultset rsuni)

		;; (java.sql.ResultSet-first rsuni)
		
		;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: nom :: (when (= flagexiste 1) |   2   | :: before loop !")
		
		;; (letrec ((resultat "UN RESULTAT")
		;; 	 (loop (lambda ()
		;; 		 (if (java.sql.ResultSet-isAfterLast rsuni)
		;; 		     '()
		;; 		     (let ((jresultat::java.lang.String #;(java.lang.String-java.lang.String8 "a result") (java.sql.ResultSet-getString2 rsuni 0))
		;; 			   (bstr_tmp '()))
		;; 		       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before (set! bstr_tmp (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresultat))")
		;; 		       (set! bstr_tmp (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresultat)) 
		;; 		       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before (set! resultat jresultat)")
		;; 		       (set! resultat bstr_tmp) ;; a revoir quand utilise (convertir avec une procedure java en byte char puis scheme string je pense)
		;; 		       (debug-display-var-nl   "BiglooCode.scm :: ResultatMesuresAF :: resultat = " resultat)
		;; 		       (when (string-null? resultat)
		;; 			     (set! resultat "&nbsp;"))
		;; 		       (set! res (string-append
		;; 				  res
		;; 				  "<tr>
                ;;                                        <td>"
		;; 				             (string-set-lower-case-ending resultat 7) " &nbsp;
                ;;                                        </td>
                ;;                                    </tr>"))
		;; 		       (java.sql.ResultSet-next rsuni)
		;; 		       (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: looping !")
		;; 		       (loop))))))
		;;   (loop))
		 

		(set! res (string-append
			   res
			   "</table>"))

		) ;; (when (= flagexiste 1)


	  (when (= flaguni 1)

		;;(letrec [(the-loop-on-resultset-function (the-loop-on-resultset-function-creator
		(let [(the-loop-on-resultset-function (the-loop-on-resultset-function-creator
						       (create-function-form-around-string identificateur choixres lang)))]

		  (proc-barat-form-post-submit baratuni rsuni lang the-loop-on-resultset-function)))


	  (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before (when (and (= flagerreur 0) (= flagobjet 0) (= flagnom 1))")
	  (when (and (= flagerreur 0) (= flagobjet 0) (= flagnom 1))
		(set! rsexiste eu.oca.DataBase-resultSet)
		(java.sql.ResultSet-close rsexiste)
	      
		;;(set! rsexiste (class-nil rsexiste))
		;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before (class-nil rsexiste)")
		;; (class-nil rsexiste) ;; au cas marche pas utiliser la fonction java setResultSetNull
		(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before (eu.oca.DataBase-setResultSetNull)")
		(eu.oca.DataBase-setResultSetNull)

		;; (java.sql.ResultSet-close rsuni)
		;; (class-nil rsuni)
		(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before (eu.oca.DataBase-setResultSet2Null)")
		(eu.oca.DataBase-setResultSet2Null)
		)
	  
	  ) ;; begin

	;; else du (if (or (= flagerreur 1) (= flaguni 1) (= flagexiste 1))
	
	(begin
	  (when (= flagobjet 1)
	      (proc-barat-english baratobjet rsuni))

	  (when (= flagnom 1)
		(set! rsexiste eu.oca.DataBase-resultSet)
		(java.sql.ResultSet-close rsexiste)

		;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before (set! rsexiste (class-nil rsexiste))")
		;;(set! rsexiste (class-nil rsexiste))
		;;(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before (class-nil rsexiste)")
		;;(class-nil rsexiste) ;; au cas marche pas utiliser la fonction java setResultSetNull		
		(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before (eu.oca.DataBase-setResultSetNull)")
		(eu.oca.DataBase-setResultSetNull)

		;; (java.sql.ResultSet-close rsuni)
		;; (class-nil rsuni)

		(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: before (eu.oca.DataBase-setResultSet2Null)")
		(eu.oca.DataBase-setResultSet2Null))


	  (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: choixres =")
	  (debug-display choixres)
	  (debug-newline)

	  ;; un COND assez gros ..... correspond au case du code ASP
	  
	  (cond
	   
	   ((string=?  choixres "Ident")
	    
	    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (cond : Ident")

	    (set! marequete (string-append marequete monchoix monordremes))

	     ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-executeQueryStaticStringString
	     ;;  (java.lang.String-java.lang.String8 marequete)
	     ;;  (java.lang.String-java.lang.String8 \"Requete\")))")
	     ;; (eu.oca.DataBase-executeQueryStaticStringString
	     ;;  (java.lang.String-java.lang.String8 marequete)
	     ;;  (java.lang.String-java.lang.String8 "Requete"))

	     (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-executeQueryStatic (java.lang.String-java.lang.String8 marequete))")
	     (eu.oca.DataBase-executeQueryStatic
	      (java.lang.String-java.lang.String8 marequete))
	     
	     (set! res (string-append res "<h1 align=\"center\"><font color=\"#0000FF\"> SIDONIe - Identifications and measurements</font></h1>"))


	     (if (not (java.sql.ResultSet-first rs))
		 (then-block ;; empty result set
		  (set! baratin "this object doesn't exist in the database or is misspelled !" )
		  (set! flagerreur 1))

		 (else-block
		  (java.sql.ResultSet-first rs)

		  (set! jresult (java.sql.ResultSet-getString2 rs 1))
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result = " result))
	     
		  (debug-display "BiglooCode.scm :: ResultatMesuresAF : = (java.sql.ResultSet-wasNull rs) 1 :")
		  (debug-display (java.sql.ResultSet-wasNull rs))
		  (debug-newline)
		  
		  
		  (when (and (string-null? result) (string=? identificateur "Nom"))
			(set! baratin "this object doesn't exist in the database or is misspelled !" )
			(set! flagerreur 1))))



	     (set! bs-result (eu.oca.bigloofunct.JavaForBigloo-jdouble->bstring (eu.oca.bigloofunct.JavaForBigloo-pi2dec)))
	     (debug-display "BiglooCode.scm :: ResultatMesuresAF : bs-result = ")
	     (debug-display bs-result)
	     (debug-newline)

	     (if (not (java.sql.ResultSet-first rs))
		 (then-block ;; empty result set
		  (set! baratin "this object doesn't exist in the database or is misspelled !" )
		  (set! flagerreur 1))

		 (else-block
		  
		  (set! bs-result (eu.oca.bigloofunct.JavaForBigloo-jdouble->bstring (java.sql.ResultSet-getDouble2 rs 3)))
		  (debug-display "BiglooCode.scm :: ResultatMesuresAF : bs-result =")
		  (debug-display bs-result)
		  (debug-display "|")
		  (debug-newline)
		  (debug-display "BiglooCode.scm :: ResultatMesuresAF : = (java.sql.ResultSet-wasNull rs) 3 :")
		  (debug-display (java.sql.ResultSet-wasNull rs))
		  (debug-newline)

		  ;; (set! len-bs-result (byte*-length bs-result))
		  ;; (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF : len-bs-result = " len-bs-result)
		  ;; (set! bs-result (make-string len-bs-result))
		  ;; (set! bs-result (eu.oca.bigloofunct.JavaForBigloo-jdouble->bstring (java.sql.ResultSet-getDouble2 rs 3)))
		  ;; (debug-display "BiglooCode.scm :: ResultatMesuresAF : bs-result = ")
		  ;; (debug-display bs-result)
		  ;; (debug-newline)

		  ;; seems useless
		  ;;(debug-display-nl "BiglooCode.scm :: ResultatMesuresAF : before  (set! result-double .....)")
		  
		  ;;(set! result-double (java.sql.ResultSet-getDouble2 rs 3))
		  
		  ;; seems useless
		  ;;(set! result-double (eu.oca.bigloofunct.JavaForBigloo-pi2dec))

		  ;; (set! result-double (eu.oca.bigloofunct.JavaForBigloo-piFloat))
		  ;; (debug-display-nl "BiglooCode.scm :: ResultatMesuresAF : before  (set! result2 .......)")
		  ;; (set! result2 (+fl result-double 0.0))
		  ;; (debug-display "BiglooCode.scm :: ResultatMesuresAF : result2 = ")
		  ;; (debug-display result2)
		  ;; (debug-newline)
		  ;; (debug-display-nl "BiglooCode.scm :: ResultatMesuresAF : before display")

		  ;; seems useless
		  ;;(debug-display "BiglooCode.scm :: ResultatMesuresAF : result-double = ")

		  ;;(debug-display result-double)
		  ;;(printf "~a" result-double)
		  ;;(printf "~s" result-double)

		  ;; seems useless
		  ;;(debug-display (double->ieee-string result-double))
		  ;;(debug-newline)

		  ;;(debug-display (real->string result-double))
		  ;;(debug-newline)
		  ;;(debug-display-nl "BiglooCode.scm :: ResultatMesuresAF : before display-var-nl")
		  ;;(debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF : result-double = " result-double)
		  (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: (string? bs-result) = " (string? bs-result))
		  
		  ;; (debug-display "BiglooCode.scm :: ResultatMesuresAF : (debug-display (string->real bs-result)) =")
		  ;; (debug-newline)
		  ;; (debug-display (string->number (string-append " " bs-result)))
		  ;; (debug-newline)
		  
		  (set! result-double (string->real bs-result))
	     
		  (set! str-result bs-result)
		  


		  ;; buggy bigloo language needs to comment below:

		  ;; (let* ((sp (string-split str-result "."))
		  ;; 	 (irss (car sp))
		  ;; 	 (frss (cadr sp))
		  ;; 	 (irs (string->number irss))
		  ;; 	 (frs (string->number frss))
		  ;; 	 (len-frss (string-length frss))
		  ;; 	 (expo (expt 10 len-frss))
		  ;; 	 (frc-rs (/ frs expo))
		  ;; 	 (rsf (+ irs frc-rs))
		  ;; 	 )
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF : irss = " irss)
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF : frss = " frss)
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF : irs = " irs)
		  ;;   (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF : frs = " frs)
		  ;;   ;;(debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF : rsf = " rsf)
		  ;;   (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL rsf)
		  ;;   )

		  (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (real? result-double) =")
		  (debug-display (real? result-double))
		  (debug-newline)
		  (set! result2 result-double)
		  ;;(set! str-result (real->string result2))
		  ;;(+ result-double 1)
		  ;;(debug-display result2)
		  ;;(real->string result2)
		  
		  (when (and (java.sql.ResultSet-wasNull rs) (string=? identificateur "N° BD"))
			(set! baratin "this object doesn't exist in the database or its BD number is misspelled !")
			(set! flagerreur 1))))



	     (if (not (java.sql.ResultSet-first rs))
		 (then-block ;; empty result set
		  (set! baratin "this object doesn't exist in the database or is misspelled !" )
		  (set! flagerreur 1))

		 (else-block

		  (set! jresult (java.sql.ResultSet-getString2 rs 3))
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 3 = " result))

		  (when (and  (string-null? result)  (string=? identificateur "N° BD"))
			(set! baratin "this object doesn't exist in the database or its BD number is misspelled !")
			(set! flagerreur 1))))


	     
	     (if (not (java.sql.ResultSet-first rs))
		 (then-block ;; empty result set
		  (set! baratin "this object doesn't exist in the database or is misspelled !" )
		  (set! flagerreur 1))

		 (else-block

		  (set! bs-result (eu.oca.bigloofunct.JavaForBigloo-jdouble->bstring (java.sql.ResultSet-getDouble2 rs 4)))
		  (debug-display "BiglooCode.scm :: ResultatMesuresAF : bs-result 4 =")
		  (debug-display bs-result)
		  (debug-display "|")
		  (debug-newline)

		  (debug-display "BiglooCode.scm :: ResultatMesuresAF : = (java.sql.ResultSet-wasNull rs) 4 :")
		  (debug-display (java.sql.ResultSet-wasNull rs))
		  (debug-newline)

		  (when (and (java.sql.ResultSet-wasNull rs) (string=? identificateur "N° ADS"))
			(set! baratin "this object doesn't exist in the database or its ADS number is misspelled !")
			(set! flagerreur 1))))

	     (if (not (java.sql.ResultSet-first rs))
		 (then-block ;; empty result set
		  (set! baratin "this object doesn't exist in the database or is misspelled !" )
		  (set! flagerreur 1))

		 (else-block

		  (set! jresult (java.sql.ResultSet-getString2 rs 4))
	     
		  (when (not (java.sql.ResultSet-wasNull rs))
			(set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			(debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 4 = " result))
			
			(when (and  (string-null? result) (string=? identificateur "N° ADS"))
			      (set! baratin "this object doesn't exist in the database or its ADS number is misspelled !")
			      (set! flagerreur 1)))))




	     ;; (set! bs-result (eu.oca.bigloofunct.JavaForBigloo-jdouble->bstring (java.sql.ResultSet-getDouble2 rs 9)))
	     ;; (debug-display "BiglooCode.scm :: ResultatMesuresAF : bs-result 9 =")
	     ;; (debug-display bs-result)
	     ;; (debug-display "|")
	     ;; (debug-newline)

	     (if (not (java.sql.ResultSet-first rs))
		 (then-block ;; empty result set
		  (set! baratin "this object doesn't exist in the database or is misspelled !" )
		  (set! flagerreur 1))

		 (else-block
		  
		  (set! jresult (java.sql.ResultSet-getString2 rs 10))
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 10 = " result))


		  (debug-display "BiglooCode.scm :: ResultatMesuresAF : = (java.sql.ResultSet-wasNull rs) 10 :")
		  (debug-display (java.sql.ResultSet-wasNull rs))
		  (debug-newline)
		  
		  (when (and (java.sql.ResultSet-wasNull rs) (string=? identificateur "N° HIP"))
			(set! baratin "this object doesn't exist in the database or its HIP number is misspelled !")
			(set! flagerreur 1))

		  (when (and  (string-null? result) (string=? identificateur "N° HIP"))
			(set! baratin "this object doesn't exist in the database or its HIP number is misspelled !")
			(set! flagerreur 1))))

	     
	     (if (equal? flagerreur 1)
		 
		   (set! res (string-append
			      res
			    "<div align=\"center\">
                                  <center>
                                           <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                             <tr>
                                                 <th width=\"82%\">
                                                     <font color=\"#0000FF\">"
			                                 baratin "<br>
                                                     </font>
                                                 </th>
                                             </tr>
                                           </table>
                                 </center>
                           </div>
                           <P>
                           <P>"))

		
		   (begin  ;; else du if
		     (set! res (string-append
			    res
			    "<div align=\"center\">
                                  <center>
                                          <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                                <tr>
                                                     <th>
                                                          <font color=\"#0000FF\"> Object <br></font>"
			                                   (field-result-set-lower-case-ending rs 1 7)
			                             "</th>"
		                                            "<td align=\"center\"><font color=\"#0000FF\"> BD #<br></font>"
							    (field-result-set-lowercase rs 3)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> ADS #<br></font>"
							    (field-result-set-lowercase rs 4)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> HIP #<br></font>"
							    (field-result-set-lowercase-check-star rs 10)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\">  Spectral Type<br></font>"
							    (field-result-set-lowercase-check-minus rs 9)
							    "</td>
                                               </tr>
					       <tr>
                                                    <td align=\"center\"><font color=\"#0000FF\"> Alpha 2000<br>"
							    (begin

							      (set! result-double (java.sql.ResultSet-getDouble2 rs 5))
							      ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : result-double =")
							      ;; (debug-display result-double)
							      ;; (debug-newline)

							      (if (java.sql.ResultSet-wasNull rs)
								  (set! result "&nbsp;")
								  (begin ;; else
								    (set! iresult (floor result-double))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult)


								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : iresult =")
								    ;; (debug-display iresult)
								    ;; (debug-newline)

								    (set! resulth (fix (/ iresult 1000)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (integer? resulth) =")
								    (debug-display (integer? resulth))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (bignum? resulth) =")
								    (debug-display (bignum? resulth))
								    (debug-newline)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF :  (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth) =")
								    ;; (debug-newline)
								    ;; (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth)
								    ;; (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : resulth 1 =")
								    (debug-display resulth)
								    (debug-newline)

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : before change code 1")

								    (set! resulth-str #;"result will be here" #;(number->string resulth) (num->string resulth))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : after change code 1")

								    (set! resultm (- iresult (* resulth 1000)))
								    (set! resultm (fix (/ resultm 10)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (integer? resultm) =")
								    (debug-display (integer? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (bignum? resultm) =")
								    (debug-display (bignum? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : resultm =")
								    (debug-display resultm)
								    (debug-newline)

								    (set! resultm-str (num->string resultm))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : resultm-str =")
								    (debug-display resultm-str)
								    (debug-newline)
								    
								    (set! results (- iresult (* resulth 1000) (* resultm 10)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : results =")
								    ;; (debug-display results)
								    ;; (debug-newline)
								    
								    (set! results-str (num->string (fix results)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : results-str =")
								    (debug-display results-str)
								    (debug-newline)

								    (when (< resulth 1)
									  (set! resulth-str "00"))
								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (< resulth 1)")

								    (when (and (>= resulth 1) (< resulth 10))
									  (set! resulth-str (string-append "0" resulth-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed  (and (>= resulth 1) (< resulth 10)")
								    (when (< resultm 10)
									  (set! resultm-str (string-append "0" resultm-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (< resultm 10)")

								    (set! result (string-append resulth-str " h " resultm-str "." results-str " mn"))))
							      (string-append "</font>" result "</td>")) ;; end begin
							   

						      "<td align=\"center\"><font color=\"#0000FF\"> Delta 2000<br>"

						        (begin

							  (set! result-double (java.sql.ResultSet-getDouble2 rs 6))
							  ;; (set! result2 result-double)
							  ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : result2 =")
							  ;; (debug-newline)
							  ;; (debug-display (real->string result2))
							  ;; (debug-newline)
							  (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double) = ")
							  (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double)

							  (if (java.sql.ResultSet-wasNull rs)
							      "&nbsp;"
							      (begin ;; else
								(if (< result-double 0)
								    (set! sign "-")
								    (set! sign "&nbsp;"))
								(set! aresult (abs result-double))
								(set! resultd (fix (/ aresult 100)))
								(set! resultd-str (num->string resultd))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (set! resultd-str (num->string resultd))")
								(set! resultmi (- aresult (* resultd 100)))
								(set! resultmi-str (num->string  (fix resultmi)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (set! resultmi-str (num->string (fix  resultmi)))")
								(when (< resultd 1)
								    (set! resultd-str "00"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed  (set! resultd-str \"00\")")
								(when (and (>= resultd 1) (< resultd 10))
								      (set! resultd-str (string-append "0" resultd-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (when (and (>= resultd 1) (< resultd 10)) ......")
								(when (< resultmi 10)
								      (set! resultmi-str (string-append "0" resultmi-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (when (< resultmi 10) .....")
								(set! result (string-append sign resultd-str " ° " resultmi-str " '"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (set! result (string-append sign resultd-str ....")
								(debug-display  "BiglooCode.scm :: ResultatMesuresAF : result =")
								(debug-display result)
								(debug-newline)
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed display")
								) ;; end begin else
							      ) ;; end if (java.sql.ResultSet-wasNull rs)
							  (string-append "</font>" result "</td>")) ;; end begin

							"<td align=\"center\"><font color=\"#0000FF\"> mag 1<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 7))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 7 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "00.")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))

							"<td align=\"center\"><font color=\"#0000FF\"> mag 2<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 8))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 8 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "00.")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))

							"<td align=\"center\"><font color=\"#0000FF\"> Calculated Orbit ?<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 11))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 11 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))
							  
							  (if (string=? result "*")
							      (set! result "NO")
							      (set! result "YES"))

							  (string-append "</font>" result "</td>"))

					        "</tr>
                                         </table>
                                     </center>
                               </div>"
			       ) ;; end de string-append , bizarre emacs le voit pas 
			   ) ;; end (set! res ...


		     (set! res (string-append
			    res
		       "<P>
                        <P>
                        <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">
                            <tr>
                                <th><font color=\"#000080\"> Date </font></th>
                                <th><font color=\"#000080\"> Angle </font></th>
                                <th><font color=\"#000080\"> Separ. </font></th>
                                <th><font color=\"#000080\"> Nights </font></th>
                                <th><font color=\"#000080\"> Code </font></th>
                                <th><font color=\"#000080\"> Instr. </font></th>
                                <th><font color=\"#000080\"> Dim. </font></th>
                                <th><font color=\"#000080\"> Ref. </font></th>
                                <th><font color=\"#000080\"> Notes </font></th>
                            </tr>"))


		 ;; (let loop ((l '(1 2 3)))
		 ;;   (if (java.sql.ResultSet-isAfterLast rsuni)
		 ;;       '()
		 ;;       (begin
		 ;; 	 (set! res (string-append
		 ;; 		    res
		 ;; 		    " A "))
		 ;; 	 (java.sql.ResultSet-next rsuni)
		 ;; 	 (loop))))
		 
		 (java.sql.ResultSet-first rs) ;; rs.movefirst

		 (let loop ((end-flag (java.sql.ResultSet-isAfterLast rs)))
		   (when (not end-flag) ;; not rs.eof
			 (set! res (string-append res "<tr>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 12))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 12 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			       (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 13))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 13 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			       (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 14))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 14 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			       (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! result (number->string (java.sql.ResultSet-getInt2 rs 15)))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 15 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			     (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 16))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 16 = " result))
			 (if (java.sql.ResultSet-wasNull rs)
			     (set! result "&nbsp;")
			     (set! result (string-upcase result)))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 18))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 18 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			       (set! result "&nbsp;"))
			 (when (string=? result "t")
			       (set! result (string-upcase result)))
			 (when (string=? result "l")
			       (set! result (string-upcase result)))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 17))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 17 = " result))
			 (when (java.sql.ResultSet-wasNull rs)
			       (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))
			 
			 (set! jresult (java.sql.ResultSet-getString2 rs 19))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 19 = " result))
			 (if (java.sql.ResultSet-wasNull rs)
			     (set! result "&nbsp;")
			     (set! result (string-upcase result)))
			 (set! res (string-append res "<td>" result " &nbsp;</td>"))

			 (set! jresult (java.sql.ResultSet-getString2 rs 20))
			 (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			 (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 20 = " result))
			 (when (or (java.sql.ResultSet-wasNull rs) (string-null? result))
			       (set! result "&nbsp;"))
			 (set! res (string-append res "<td>" result " &nbsp;</td></tr>"))

			 (java.sql.ResultSet-next rs) ;; rs.Movenext
			 (loop (java.sql.ResultSet-isAfterLast rs)))) ;; Loop
		 
		 (set! res (string-append
			    res
			    "</table>"))
		 
		 ) ;; end (begin ... du else du if
		   
	       ) ;; end (if (equal? flagerreur 1) ..... else   begin ...

	     ) ;;  fin cas dans COND : ((string=?  choixres "Ident")

	   ((string=?  choixres "Orbite")

	    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (cond : Orbite")

	    (set! sqlorbite (string-append sqlorbite monchoix monordreorb))

	    ;; (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-executeQueryStaticStringString
	    ;;   (java.lang.String-java.lang.String8 sqlorbite)
	    ;;   (java.lang.String-java.lang.String8 \"Orbite\")))")
	    ;; (eu.oca.DataBase-executeQueryStaticStringString
	    ;;   (java.lang.String-java.lang.String8 sqlorbite)
	    ;;   (java.lang.String-java.lang.String8 "Orbite"))

	    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-executeQueryStatic (java.lang.String-java.lang.String8 sqlorbite))")
	    (eu.oca.DataBase-executeQueryStatic (java.lang.String-java.lang.String8 sqlorbite))

	    (set! res (string-append res "<h1 align=\"center\"><font color=\"#0000FF\"> SIDONIe - Orbit Parameters</font></h1>"))

	    (debug-display "BiglooCode.scm :: ResultatMesuresAF : = (java.sql.ResultSet-wasNull rs):")
	    (debug-display (java.sql.ResultSet-wasNull rs))
	    (debug-newline)

	    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur = " (number->string flagerreur)))

	    (if (not (java.sql.ResultSet-first rs))
		(begin ;; empty result set
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF :  empty result set"))
		  (set! baratin "No calculated orbit for this object !" )
		  (set! flagerreur 1))
		(begin
		  (set! jresult (java.sql.ResultSet-getString2 rs 1))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 1 = " result))
		  
		  (when (and (string-null? result) (string=? identificateur "Nom"))
			(set! baratin "No calculated orbit for this object !")
			(set! flagerreur 1))
		  
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur 1 = " (number->string flagerreur)))
		  
		  (set! jresult (java.sql.ResultSet-getString2 rs 3))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 3 = " result))
		  
		  (when (and (string-null? result) (string=? identificateur "N° BD"))
			(set! baratin "No calculated orbit for this object !")
			(set! flagerreur 1))
		  
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur 3 = " (number->string flagerreur)))
		  
		  
		  (set! jresult (java.sql.ResultSet-getString2 rs 4))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 4 = " result))
		  
		  (when (and (string-null? result) (string=? identificateur "N° ADS"))
			(set! baratin "No calculated orbit for this object !" )
			(set! flagerreur 1))
		  
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur 4 = " (number->string flagerreur)))

		  
		  (set! jresult (java.sql.ResultSet-getString2 rs 10))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 10 = " result))
		  
		  (when (and  (string-null? result) (string=? identificateur "N° HIP"))
			(set! baratin "No calculated orbit for this object !")
			(set! flagerreur 1))
		  
		  
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur 10 = " (number->string flagerreur)))
		  
		  
		  (set! jresult (java.sql.ResultSet-getString2 rs 11))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 11 Orb = " result))
		  (when (java.sql.ResultSet-wasNull rs)
			(set! baratin "Cet objet n'a pas d'orbite calculée !")
			(set! flagerreur 1))

		  ) ;; fin begin du else
		
		) ;; fin (if (not (java.sql.ResultSet-first rs)) 
		  
		  
	    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur 11 = " (number->string flagerreur)))

	    (if (equal? flagerreur 1)
		      
		(set! res (string-append
			   res
			    "<div align=\"center\">
                                  <center>
                                           <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                             <tr>
                                                 <th width=\"82%\">
                                                     <font color=\"#0000FF\">"
			                                 baratin "<br>
                                                     </font>
                                                 </th>
                                             </tr>
                                           </table>
                                 </center>
                           </div>
                           <P>
                           <P>"))

		
		(begin  ;; else du if
		  (set! res (string-append
			     res
			     "<div align=\"center\">
                                  <center>
                                          <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                                <tr>
                                                     <th>
                                                          <font color=\"#0000FF\"> Object <br></font>"
			                                   (field-result-set-lower-case-ending rs 1 7)
			                             "</th>"
		                                            "<td align=\"center\"><font color=\"#0000FF\"> BD #<br></font>"
							    (field-result-set-lowercase rs 3)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> ADS #<br></font>"
							    (field-result-set-lowercase rs 4)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> HIP #<br></font>"
							    (field-result-set-lowercase-check-star rs 10)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> Spectral Type<br></font>"
							    (field-result-set-lowercase-check-minus rs 9)
							    "</td>
                                               </tr>
					       <tr>
                                                    <td align=\"center\"><font color=\"#0000FF\"> Alpha 2000<br>"
							    (begin

							      (set! result-double (java.sql.ResultSet-getDouble2 rs 5))
							      ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : result-double =")
							      ;; (debug-display result-double)
							      ;; (debug-newline)

							      (if (java.sql.ResultSet-wasNull rs)
								  (set! result "&nbsp;")
								  (begin ;; else
								    (set! iresult (floor result-double))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult)


								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : iresult =")
								    ;; (debug-display iresult)
								    ;; (debug-newline)

								    (set! resulth (fix (/ iresult 1000)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (integer? resulth) 2 =")
								    (debug-display (integer? resulth))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (bignum? resulth) 2 =")
								    (debug-display (bignum? resulth))
								    (debug-newline)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF :  (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth) =")
								    ;; (debug-newline)
								    ;; (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth)
								    ;; (debug-newline)
								    
								    ;; (let ((bt1 16)
								    ;; 	  (bt2 0))
								    ;;   (display-expr-nl (bignum? bt1))
								    ;;   (display-msg-var-nl "bt1 =" bt1)
								    ;;   (debug-newline)
								    ;;   (display-expr-nl (bignum? bt2))
								    ;;   (display-msg-var-nl "bt1 =" bt2))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : resulth 2 =")
								    (debug-display resulth)
								    (debug-newline)

								    (set! resulth-str #;"result will be here" #;(number->string resulth) (num->string resulth))
								    (set! resultm (- iresult (* resulth 1000)))
								    (set! resultm (fix (/ resultm 10)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (integer? resultm) =")
								    (debug-display (integer? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (bignum? resultm) =")
								    (debug-display (bignum? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : resultm =")
								    (debug-display resultm)
								    (debug-newline)

								    (set! resultm-str (num->string resultm))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : resultm-str =")
								    (debug-display resultm-str)
								    (debug-newline)
								    
								    (set! results (- iresult (* resulth 1000) (* resultm 10)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : results =")
								    ;; (debug-display results)
								    ;; (debug-newline)
								    
								    (set! results-str (num->string (fix results)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : results-str =")
								    (debug-display results-str)
								    (debug-newline)

								    (when (< resulth 1)
									  (set! resulth-str "00"))
								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (< resulth 1)")

								    (when (and (>= resulth 1) (< resulth 10))
									  (set! resulth-str (string-append "0" resulth-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed  (and (>= resulth 1) (< resulth 10)")
								    (when (< resultm 10)
									  (set! resultm-str (string-append "0" resultm-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (< resultm 10)")

								    (set! result (string-append resulth-str " h " resultm-str "." results-str " mn"))))
							      (string-append "</font>" result "</td>")) ;; end begin
							   

						      "<td align=\"center\"><font color=\"#0000FF\"> Delta 2000<br>"

						      (begin

							  (set! result-double (java.sql.ResultSet-getDouble2 rs 6))
							  ;; (set! result2 result-double)
							  ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : result2 =")
							  ;; (debug-newline)
							  ;; (debug-display (real->string result2))
							  ;; (debug-newline)
							  (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double) = ")
							  (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double)

							  (if (java.sql.ResultSet-wasNull rs)
							      "&nbsp;"
							      (begin ;; else
								(if (< result-double 0)
								    (set! sign "-")
								    (set! sign "&nbsp;"))
								(set! aresult (abs result-double))
								(set! resultd (fix (/ aresult 100)))
								(set! resultd-str (num->string resultd))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (set! resultd-str (num->string resultd))")
								(set! resultmi (- aresult (* resultd 100)))
								(set! resultmi-str (num->string  (fix resultmi)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (set! resultmi-str (num->string (fix  resultmi)))")
								(when (< resultd 1)
								    (set! resultd-str "00"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed  (set! resultd-str \"00\")")
								(when (and (>= resultd 1) (< resultd 10))
								      (set! resultd-str (string-append "0" resultd-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (when (and (>= resultd 1) (< resultd 10)) ......")
								(when (< resultmi 10)
								      (set! resultmi-str (string-append "0" resultmi-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (when (< resultmi 10) .....")
								(set! result (string-append sign resultd-str " ° " resultmi-str " '"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (set! result (string-append sign resultd-str ....")
								(debug-display  "BiglooCode.scm :: ResultatMesuresAF : result =")
								(debug-display result)
								(debug-newline)
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed display")
								) ;; end begin else
							      ) ;; end if (java.sql.ResultSet-wasNull rs)
							  (string-append "</font>" result "</td>")) ;; end begin
							
							"<td align=\"center\"><font color=\"#0000FF\"> mag 1<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 7))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 7 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "0")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))

								"<td align=\"center\"><font color=\"#0000FF\"> mag 2<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 8))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 8 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "0")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))
							
							
							"<td align=\"center\"><font color=\"#0000FF\">Calculated Orbit ?<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 11))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 11 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (if (string=? result "*")
							      (set! result "NON")
							      (set! result "YES"))

							  (string-append "</font>" result "</td>"))
							
							
							"</tr>
                                                  </table>
                                               </center>
                                            </div>"
				
							;; vaut mieux pas continuer la (syntaxe lourde)

				   )  ;; close string-append
			   ) ;; close set! res

		     ;; continuer ici
		     (set! res (string-append
			    res
			    "<P>
                             <P>
                                <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\100%\>
                                  <tr>
                                      <th><font color=\#000080\> Author</font></th>
                                      <th><font color=\#000080\> Year</font></th>
                                      <th><font color=\#000080\> Ref.</font></th>
                                      <th><font color=\#000080\> P</font></th>
                                      <th><font color=\#000080\> n</font></th>
                                      <th><font color=\#000080\> T</font></th>
                                      <th><font color=\#000080\> a</font></th>
                                      <th><font color=\#000080\> e</font></th>
                                      <th><font color=\#000080\> i</font></th>
                                      <th><font color=\#000080\> o</font></th>
                                      <th><font color=\#000080\> w</font></th>
                                      <th><font color=\#000080\> 	Notes</font></th>
                                  </tr>"))
		     
		     (java.sql.ResultSet-first rs) ;; rs.movefirst

		     (while (not (java.sql.ResultSet-isAfterLast rs))
			    
			    (set! res (string-append
				       res
				       "<tr>"))
			    
			    (set! jresult (java.sql.ResultSet-getString2 rs 12))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 12 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" (string-upcase result) " &nbsp;</td>"))

			    (set! result (number->string (java.sql.ResultSet-getInt2 rs 13)))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 13 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 14))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 14 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 15))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 15 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))
			    
			    (set! jresult (java.sql.ResultSet-getString2 rs 16))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 16 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 17))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 17 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 18))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 18 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 20))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 20 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 21))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 21 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))
			    
			    (set! jresult (java.sql.ResultSet-getString2 rs 22))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 22 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 23))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 23 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 19))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 19 orbit = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>
                                                 </tr>"))

			    (java.sql.ResultSet-next rs) ;; rs.Movenext

		     ) ;; end while

		     (set! res (string-append res "</table>"))

		     ) ;; end begin else du if flagerreur 1


		   ) ;; close if flagerreur 1


	    ) ;;  fin cas dans COND : ((string=?  choixres "Orbite")

	   ((string=?  choixres "Ref")

	    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (cond : Ref")

	    (set! sqlrefere (string-append sqlrefere-begin monchoix sqlrefere-end monordreref))

	    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF :: (eu.oca.DataBase-executeQueryStatic (java.lang.String-java.lang.String8 sqlrefere))")
	    (eu.oca.DataBase-executeQueryStatic (java.lang.String-java.lang.String8 sqlrefere))

	    (set! res (string-append res "<h1 align=\"center\"><font color=\"#0000FF\"> SIDONIe - References</font></h1>"))

	    (debug-display "BiglooCode.scm :: ResultatMesuresAF : = (java.sql.ResultSet-wasNull rs):")
	    (debug-display (java.sql.ResultSet-wasNull rs))
	    (debug-newline)

	    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur = " (number->string flagerreur)))

	    (if (not (java.sql.ResultSet-first rs))
		(begin ;; empty result set
		   (set! baratin "No references for this object !")
		   (set! flagerreur 1))
		(begin
		  (set! jresult (java.sql.ResultSet-getString2 rs 1))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 1 = " result))

		  (when (and (string-null? result) (string=? identificateur "Nom"))
			(set! baratin "No references for this object !")
			(set! flagerreur 1))

		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur 1 = " (number->string flagerreur)))

		  (set! jresult (java.sql.ResultSet-getString2 rs 3))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 3 = " result))
		  
		  (when (and (string-null? result) (string=? identificateur "N° BD"))
			(set! baratin "No references for this object !")
			(set! flagerreur 1))

		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur 3 = " (number->string flagerreur)))


		  (set! jresult (java.sql.ResultSet-getString2 rs 4))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 4 = " result))
		  
		  (when (and (string-null? result) (string=? identificateur "N° ADS"))
			(set! baratin  "No references for this object !")
			(set! flagerreur 1))

		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur 4 = " (number->string flagerreur)))


		  (set! jresult (java.sql.ResultSet-getString2 rs 10))
		  (display-wasnull rs)
		  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 10 = " result))

		  (when (and  (string-null? result) (string=? identificateur "N° HIP"))
			(set! baratin "No references for this object !")
			(set! flagerreur 1))

		  
		  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : flagerreur 10 = " (number->string flagerreur)))


		  ) ;; fin begin du else
		
		) ;; fin (if (not (java.sql.ResultSet-first rs)) 
		  

	    (if (equal? flagerreur 1)
		 
		(set! res (string-append
			   res
			    "<div align=\"center\">
                                  <center>
                                           <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                             <tr>
                                                 <th width=\"82%\">
                                                     <font color=\"#0000FF\">"
			                                 baratin "<br>
                                                     </font>
                                                 </th>
                                             </tr>
                                           </table>
                                 </center>
                           </div>
                           <P>
                           <P>"))

		
		(begin  ;; else du if
		     (set! res (string-append
			    res
			    "<div align=\"center\">
                                  <center>
                                          <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                                <tr>
                                                     <th>
                                                          <font color=\"#0000FF\"> Object <br></font>"
			                                   (field-result-set-lower-case-ending rs 1 7)
			                             "</th>"
		                                            "<td align=\"center\"><font color=\"#0000FF\"> BD #<br></font>"
							    (field-result-set-lowercase rs 3)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> ADS #<br></font>"
							    (field-result-set-lowercase rs 4)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> HIP #<br></font>"
							    (field-result-set-lowercase-check-star rs 10)
							    "</td>"
							    "<td align=\"center\"><font color=\"#0000FF\"> Spectral Type<br></font>"
							    (field-result-set-lowercase-check-minus rs 9)
							    "</td>
                                               </tr>
					       <tr>
                                                    <td align=\"center\"><font color=\"#0000FF\"> Alpha 2000<br>"
							    (begin

							      (set! result-double (java.sql.ResultSet-getDouble2 rs 5))
							      ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : result-double =")
							      ;; (debug-display result-double)
							      ;; (debug-newline)

							      (if (java.sql.ResultSet-wasNull rs)
								  (set! result "&nbsp;")
								  (begin ;; else
								    (set! iresult (floor result-double))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL iresult)


								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : iresult =")
								    ;; (debug-display iresult)
								    ;; (debug-newline)

								    (set! resulth (fix (/ iresult 1000)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : coucou (integer? resulth) =")
								    (debug-display (integer? resulth))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (bignum? resulth) =")
								    (debug-display (bignum? resulth))
								    (debug-newline)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF :  (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth) =")
								    ;; (debug-newline)
								    ;; (eu.oca.bigloofunct.JavaForBigloo-displayInt resulth)
								    ;; (debug-newline)

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : INTRO")

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : resulth 3 =")
								    (debug-display resulth)
								    (debug-newline)

								    (debug-display "BiglooCode.scm :: ResultatMesuresAF : before code change")
								    (debug-newline)

								    (set! resulth-str #;"result will be here" #;(number->string resulth) (num->string resulth))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : after code change")
								    
								    (set! resultm (- iresult (* resulth 1000)))
								    (set! resultm (fix (/ resultm 10)))

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (integer? resultm) =")
								    (debug-display (integer? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (bignum? resultm) =")
								    (debug-display (bignum? resultm))
								    (debug-newline)

								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : resultm =")
								    (debug-display resultm)
								    (debug-newline)

								    (set! resultm-str (num->string resultm))
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : resultm-str =")
								    (debug-display resultm-str)
								    (debug-newline)
								    
								    (set! results (- iresult (* resulth 1000) (* resultm 10)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results) = ")
								    (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL results)

								    ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : results =")
								    ;; (debug-display results)
								    ;; (debug-newline)
								    
								    (set! results-str (num->string (fix results)))
								    
								    (debug-display  "BiglooCode.scm :: ResultatMesuresAF : results-str =")
								    (debug-display results-str)
								    (debug-newline)

								    (when (< resulth 1)
									  (set! resulth-str "00"))
								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (< resulth 1)")

								    (when (and (>= resulth 1) (< resulth 10))
									  (set! resulth-str (string-append "0" resulth-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed  (and (>= resulth 1) (< resulth 10)")
								    (when (< resultm 10)
									  (set! resultm-str (string-append "0" resultm-str)))

								    (debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (< resultm 10)")

								    (set! result (string-append resulth-str " h " resultm-str "." results-str " mn"))))
							      (string-append "</font>" result "</td>")) ;; end begin
							   

						      "<td align=\"center\"><font color=\"#0000FF\"> Delta 2000<br>"

						        (begin

							  (set! result-double (java.sql.ResultSet-getDouble2 rs 6))
							  ;; (set! result2 result-double)
							  ;; (debug-display  "BiglooCode.scm :: ResultatMesuresAF : result2 =")
							  ;; (debug-newline)
							  ;; (debug-display (real->string result2))
							  ;; (debug-newline)
							  (debug-display  "BiglooCode.scm :: ResultatMesuresAF : (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double) = ")
							  (eu.oca.bigloofunct.JavaForBigloo-displayDoubleNL result-double)

							  (if (java.sql.ResultSet-wasNull rs)
							      "&nbsp;"
							      (begin ;; else
								(if (< result-double 0)
								    (set! sign "-")
								    (set! sign "&nbsp;"))
								(set! aresult (abs result-double))
								(set! resultd (fix (/ aresult 100)))
								(set! resultd-str (num->string resultd))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (set! resultd-str (num->string resultd))")
								(set! resultmi (- aresult (* resultd 100)))
								(set! resultmi-str (num->string  (fix resultmi)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (set! resultmi-str (num->string (fix  resultmi)))")
								(when (< resultd 1)
								    (set! resultd-str "00"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed  (set! resultd-str \"00\")")
								(when (and (>= resultd 1) (< resultd 10))
								      (set! resultd-str (string-append "0" resultd-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (when (and (>= resultd 1) (< resultd 10)) ......")
								(when (< resultmi 10)
								      (set! resultmi-str (string-append "0" resultmi-str)))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (when (< resultmi 10) .....")
								(set! result (string-append sign resultd-str " ° " resultmi-str " '"))
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed (set! result (string-append sign resultd-str ....")
								(debug-display  "BiglooCode.scm :: ResultatMesuresAF : result =")
								(debug-display result)
								(debug-newline)
								(debug-display-nl  "BiglooCode.scm :: ResultatMesuresAF : passed display")
								) ;; end begin else
							      ) ;; end if (java.sql.ResultSet-wasNull rs)
							  (string-append "</font>" result "</td>")) ;; end begin
							
							"<td align=\"center\"><font color=\"#0000FF\"> mag 1<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 7))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 7 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "0")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))

								"<td align=\"center\"><font color=\"#0000FF\"> mag 2<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 8))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 8 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (when (string=? result "0")
								(set! result "&nbsp;"))

							  (string-append "</font>" result "</td>"))
							
							
							"<td align=\"center\"><font color=\"#0000FF\"> Calculated Orbit ?<br>"
							
							(begin
							  (set! jresult (java.sql.ResultSet-getString2 rs 11))
							  (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
							  (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 11 = " result))

							  (when (java.sql.ResultSet-wasNull rs)
								(set! result "&nbsp;"))

							  (if (string=? result "*")
							      (set! result "NON")
							      (set! result "YES"))

							  (string-append "</font>" result "</td>"))
							
							
							"</tr>
                                                  </table>
                                               </center>
                                            </div>"
				
							;; vaut mieux pas continuer la (syntaxe lourde)

				   )  ;; close string-append
			   ) ;; close set! res

		     ;; continuer ici
		     (set! res (string-append
			    res
			    "<P>
                             <P>
                                <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\100%\>
                                  <tr>
                                      <th><font color=\#000080\> Ref. </font></th>
                                      <th><font color=\#000080\> Journal </font></th>
                                      <th><font color=\#000080\> Title </font></th>
                                  </tr>"))
		     
		     (java.sql.ResultSet-first rs) ;; rs.movefirst

		     (while (not (java.sql.ResultSet-isAfterLast rs))
			    
			    (set! res (string-append
				       res
				       "<tr>"))
			    
			    (set! jresult (java.sql.ResultSet-getString2 rs 12))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 12 Réf = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" (string-upcase result) " &nbsp;</td>"))

			    ;;(set! result (number->string (java.sql.ResultSet-getInt2 rs 13)))
			    (set! jresult (java.sql.ResultSet-getString2 rs 13))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result Revue = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>"))

			    (set! jresult (java.sql.ResultSet-getString2 rs 14))
			    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
			    (debug-display-nl (string-append "BiglooCode.scm :: ResultatMesuresAF : result 14 Titre = " result))
			    (when (java.sql.ResultSet-wasNull rs)
				  (set! result "&nbsp;"))
			    (set! res (string-append res "<td>" result " &nbsp;</td>" 
                                           "</tr>"))
			    
			    (java.sql.ResultSet-next rs) ;; rs.Movenext

		     ) ;; end while

		     (set! res (string-append res "</table>"))
		     
		     ) ;; end begin else du if flagerreur 1

		   ) ;; end if flagerreur 1
		  
	    ) ;;  fin cas dans COND : ((string=?  choixres "Ref")


	   (else ;; du COND 
	    (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: UNSUPPORTED CASE with choixres =" choixres))) ;; fin COND

	  ;; en ASP la connection a la BDD est fermée ici

	  ) ;; end begin
	  
	) ;; end if (or (= flagerreur 1) (= flaguni 1) (= flagexiste 1))

    ;; closing connection to database
    (if dyna
	(eu.oca.DataBase-closeDynamic db)
	(begin
	  (eu.oca.DataBase-closeStatic)
	  #;(eu.oca.DataBase-deregisterDriverStatic)))

    (set! res (string-append res 
			     "
                       <table border=\"0\" width=\"95%\">
                                 <tr>
                                       <td valign=\"top\">" 
                                            ;;"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                                           "<a href=\"../SidonieObject.htm\"><img src=\"../retour_blanc.gif\" border=\"0\" width=\"26\" height=\"26\"></a> 
                                          <font size=\"2\">
                                              <em> Search on an object</em>
                                          </font>
                                     </td>
                                     <td valign=\"top\">
                                          <a href=\"../SidonieStatistic.htm\">
                                              <img src=\"../retour_blanc.gif\" border=\"0\" width=\"26\" height=\"26\"></a> 
                                          <font size=\"2\">
                                               <em> Statistical search</em>
                                          </font>
                                     </td>"
                          ;; "</h5>" ;; /h5 was here but no h5 upside !!!
                                     "</td>
                                </tr>
                            </table>"))

    ;; (set! res (string-append res  "<br>"
    ;; 			          "<h1> "
    ;; 			                 "identificateur = " bstr_identificateur 
    ;; 			                 " , T1 = " bstr_objet 
    ;; 			                 " , choixres = " bstr_choixres
    ;; 			                 " , baraterreur = " baraterreur 
    ;; 					 " , flagerreur = " (number->string flagerreur) 
    ;; 					 " , flaguni = " (number->string flaguni) 
    ;; 					 " , flagexiste = " (number->string flagexiste)
    ;; 					 " , flagobjet = " (number->string flagobjet) 
    ;;                               "</h1>"))

    (set! res (string-append res "</body></html>"))


    ;;(debug-display-var-nl "BiglooCode.scm :: ResultatMesuresAF :: res = " res) 
  
    (set! len (string-length res))

    (let  (
	   (bstr (make-byte* len))
	   )
      ;;(set! bstr res)
      (set! bstr ($string->bstring res))
      bstr)

    
    )


  )


(define (insert-baratin-in-HTML-french-short baratin loc-str)
  (string-append loc-str "<h1 align=\"center\">
                           <font color=\"#0000FF\">SIDONIe - Résultats : Identifications et mesures</font>
                           </h1>
                           <div align=\"center\">
                              <center>
                                  <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                        <tr>
                                             <th width=\"80%\">
                                                 <font color=\"#0000FF\">"
                                                       baratin "<br>
                                                 </font>
                                             </th>
                                        </tr>
                                  </table>
                              </center>
                          </div>"))


(define (insert-baratin-in-HTML-english-short baratin loc-str)
  (string-append loc-str "<h1 align=\"center\">
                           <font color=\"#0000FF\">SIDONIe - Results : Identifications and measurements</font>
                           </h1>
                           <div align=\"center\">
                              <center>
                                  <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                        <tr>
                                             <th width=\"80%\">
                                                 <font color=\"#0000FF\">"
                                                       baratin "<br>
                                                 </font>
                                             </th>
                                        </tr>
                                  </table>
                              </center>
                          </div>"))


(define (insert-baratin-in-HTML-french baratin loc-str)
  
  (string-append (insert-baratin-in-HTML-french-short baratin loc-str)
		         "<P>
                          <P>
                          <table border=\"1\" cellpadding=\"0\" align=\"center\" cellspacing=\"0\" width=\"20%\" >
                          <tr>
                              <th><font color=\"#000080\" > Objets </font></th>
                          </tr>"))

(define (insert-baratin-in-HTML-english baratin loc-str)
  
  (string-append (insert-baratin-in-HTML-french-short baratin loc-str)
		         "<P>
                          <P>
                          <table border=\"1\" cellpadding=\"0\" align=\"center\" cellspacing=\"0\" width=\"20%\" >
                          <tr>
                              <th><font color=\"#000080\" > Objects </font></th>
                          </tr>"))


;; (define (the-loop-on-resultset rs)

;;   (java.sql.ResultSet-first rs)
		
;;   (debug-display-nl  "BiglooCode.scm :: the-loop-on-resultset :: before loop !")
		
;;   (letrec ((loop (lambda ()
;; 		   (if (java.sql.ResultSet-isAfterLast rs)
;; 		       '()
;; 		       (begin 
;; 			       (debug-display-nl  "BiglooCode.scm :: the-loop-on-resultset :: passed  (java.sql.ResultSet-isAfterLast rs) dans else")
;; 			       (let (
			     
;; 				     (jresultat::java.lang.String #;(java.lang.String-java.lang.String8 "a result") (java.sql.ResultSet-getString2 rs 1 #;0))
;; 				     (resultat "UN RESULTAT"))
				 
;; 				 (debug-display-nl  "BiglooCode.scm :: the-loop-on-resultset :: before (set! resultat (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresultat))")
;; 				 (set! resultat (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresultat))
;; 				 (debug-display-var-nl   "BiglooCode.scm :: the-loop-on-resultset :: resultat = " resultat)
;; 				 (when (string-null? resultat)
;; 				       (set! resultat "&nbsp;"))
;; 				 (set! res (string-append
;; 					    res
;; 						  "<tr>
;;                                                        <td>"
;; 						             (string-set-lower-case-ending resultat 7) " &nbsp;
;;                                                        </td>
;;                                                    </tr>"))
;; 				 (java.sql.ResultSet-next rs)
;; 				 (debug-display-nl  "BiglooCode.scm :: the-loop-on-resultset :: looping !")
;; 				 (loop)))))))
;; 	   (loop)))

;; defined here create a runtime error in bigloo
;;(define the-loop-on-resultset (the-loop-on-resultset-function-creator (lambda (x) x)))


(define (the-loop-on-resultset-function-creator f)
  (lambda (rs)
    (java.sql.ResultSet-first rs)
		
    (debug-display-nl  "BiglooCode.scm :: the-loop-on-resultset* :: before loop !")
		
    (letrec ((loop (lambda ()
		     (if (java.sql.ResultSet-isAfterLast rs)
			 '()
			 (begin 
			   (debug-display-nl  "BiglooCode.scm :: the-loop-on-resultset* :: passed  (java.sql.ResultSet-isAfterLast rs) dans else")
			   (let (
				 
				 (jresultat::java.lang.String #;(java.lang.String-java.lang.String8 "a result") (java.sql.ResultSet-getString2 rs 1 #;0))
				 (resultat "UN RESULTAT"))
			     
			     (debug-display-nl  "BiglooCode.scm :: the-loop-on-resultset* :: before (set! resultat (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresultat))")
			     (set! resultat (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresultat))
			     (debug-display-var-nl   "BiglooCode.scm :: the-loop-on-resultset* :: resultat = " resultat)
			     (when (string-null? resultat)
				   (set! resultat "&nbsp;"))
			     (set! res (string-append
					res
					"<tr>
                                             <td>"
					              (f (string-set-lower-case-ending resultat 7)) " &nbsp;
                                             </td>
                                         </tr>"))
			     (java.sql.ResultSet-next rs)
			     (debug-display-nl  "BiglooCode.scm :: the-loop-on-resultset* :: looping !")
			     (loop)))))))
      (loop))))


;;(define the-loop-on-resultset-form (the-loop-on-resultset-function-creator (create-function-form-around-string identificateur choixres lang)))

(define (create-function-form-around-string identificateur choixres lang)
  (lambda (objet)
    (create-html-form-string objet identificateur choixres lang)))
		
(define (create-html-form-string objet identificateur choixres lang)

  (let [(url-action (if (string=? lang "french")
			"ResultatMesuresF"
			"ResultatMesuresAF"))
	(name-button (if (string=? lang "french")
			 "Soumettre"
			 "Submit"))]

    (string-append "<form action=\"" url-action "\" method=\"post\">
                          <input type=\"text\" size=\"10\" name=\"T1\" readonly=\"true\" value=\"" objet "\"></td>
                          <input type=\"hidden\" name=\"identificateur\" value=\"" identificateur "\">
                          <input type=\"hidden\" name=\"choixres\" value=\"" choixres "\">
                      <td><input type=\"submit\" name=\"T2\" value=\"" name-button "\">
                    </form>")))


(define (proc-barat baratin rs)

  (debug-display-var-nl  "BiglooCode.scm :: proc-barat :: baratin :: " baratin)
  (set! res (insert-baratin-in-HTML-french baratin res))
		
  (debug-display-nl  "BiglooCode.scm :: proc-barat :: before loop !")

  (let [(the-loop-on-resultset-function
		       (the-loop-on-resultset-function-creator (lambda (x) x)))]

		  (the-loop-on-resultset-function rs))

  ;;(the-loop-on-resultset rs)
		
  (set! res (string-append
	     res
	     "</table>")))




(define (proc-barat-form-post-submit baratin rs lang the-loop-on-resultset-function)

  (if (string=? lang "french")
      (set! res (insert-baratin-in-HTML-french baratin res))
      (set! res (insert-baratin-in-HTML-english baratin res)))

  
  (the-loop-on-resultset-function rs)

		
  (set! res (string-append
	                   res
	                   "</table>")))


(define (proc-barat-english baratin rs)
  (set! res (string-append
			   res
			   "<h1 align=\"center\">
                           <font color=\"#0000FF\">SIDONIe - Results : Identifications and measurements</font>
                           </h1>
                           <div align=\"center\">
                              <center>
                                  <table width=\"85%\" border=\"3\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">
                                        <tr>
                                             <th width=\"80%\">
                                                 <font color=\"#0000FF\">"
                                                       baratin "<br>
                                                 </font>
                                             </th>
                                        </tr>
                                  </table>
                              </center>
                          </div>
		          <P>
                          <P>
                          <table border=\"1\" cellpadding=\"0\" align=\"center\" cellspacing=\"0\" width=\"20%\" >
                          <tr>
                              <th><font color=\"#000080\" > Objects </font></th>
                          </tr>"))

  (java.sql.ResultSet-first rs)
		
  (debug-display-nl  "BiglooCode.scm :: proc-barat-english :: before loop !")
		
  (letrec ((loop (lambda ()
		   (if (java.sql.ResultSet-isAfterLast rs)
		       '()
		       (let ((jresultat::java.lang.String #;(java.lang.String-java.lang.String8 "a result") (java.sql.ResultSet-getString2 rs 1 #;0))
			     (resultat "UN RESULTAT"))
			     ;;(bstr_tmp '()))
			 (debug-display-nl  "BiglooCode.scm :: proc-barat :: before (set! resultat (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresultat))")
			 (set! resultat (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresultat)) 
			 (debug-display-var-nl   "BiglooCode.scm :: proc-barat :: resultat = " resultat)
			 (when (string-null? resultat)
			       (set! resultat "&nbsp;"))
			 (set! res (string-append
						  res
						  "<tr>
                                                       <td>"
						             (string-set-lower-case-ending resultat 7) " &nbsp;
                                                       </td>
                                                   </tr>"))
			 (java.sql.ResultSet-next rs)
			 (debug-display-nl  "BiglooCode.scm :: proc-barat :: looping !")
			 (loop))))))
    (loop))
		
  (set! res (string-append
	                   res
	                   "</table>")))


(define (BACKUP-html-print-2000-Coordinates alpha delta exist-alpha exist-delta) ;; TODO traiter les cas ou ils existent pas
  (let* ((coordinates-2000 "")
	 (alpha-str (if exist-alpha 
			      (format 
			            ;;(num->string (fix alpha)) ;;(format alpha "~5,0d") ;; a string
			            "~5,0d"
				    (fix alpha))
			      "UNKNOWN ALPHA"))
			
	 (delta-abs-str (begin
			      (debug-display-var-nl "BiglooCode.scm :: ResultatMesuresF :: html-print-2000-Coordinates :: alpha-str = " alpha-str) 
			      (if exist-delta
				         (format
					         ;;(num->string (fix delta)) ;;(format (abs delta) "~4,0d")
					         ;;(fix delta)
						 "~4,0d"
						 (fix delta))
					 "UNKNOWN DELTA")))
	 (delta-sign "+")
	 (prefix-HTML-str "<br><center><p style=\"color:#808080\">Coordonn&eacute;es 2000 : ")
	 (postfix-HTML-str "</p></center><br>")
	 (code-HTML ""))
    
    (when (and exist-delta 
	       (< delta 0))
	  (set! delta-sign "-"))

    ;; coordinates 2000
    (set! coordinates-2000
	  (string-append 
	                alpha-str delta-sign delta-abs-str))
			

    (set! code-HTML
	  (string-append 
	                 prefix-HTML-str
	                 coordinates-2000
			 postfix-HTML-str))
    
    (set! res (string-append
	                    res
			    code-HTML))))


(define (html-print-2000-Coordinates alpha delta) 
  (let* ((coordinates-2000 "")
	 (alpha-str (format "~5,0d" alpha))
			    
			
	 (delta-abs-str	(format	"~4,0d"	
				(abs delta)))
	 (delta-sign (if (< delta 0) 
			 "-"
			 "+"))
	 ;;(prefix-HTML-str "<br><center><p style=\"color:#808080\">Coordonn&eacute;es 2000 : ")
	 (prefix-HTML-str "<br><center><p style=\"color:#808080\">INDEX WDS : ")
	 (postfix-HTML-str "</p></center><br>")
	 (code-HTML ""))
    
    (debug-display-var-nl   "BiglooCode.scm :: html-print-2000-Coordinates :: delta = " delta)
    (debug-display-var-nl   "BiglooCode.scm :: html-print-2000-Coordinates :: delta-sign = " delta-sign)

    ;; coordinates 2000
    (set! coordinates-2000
	  (string-append 
	                alpha-str delta-sign delta-abs-str))
			

    (set! code-HTML
	  (string-append 
	                 prefix-HTML-str
	                 coordinates-2000
			 postfix-HTML-str))
    
    (set! res (string-append
	                    res
			    code-HTML))))


(define (sql-server->mysql-server-syntax query) ;; replace [ ] by `
  (string-replace (string-replace query #\[ #\`) #\] #\`))

;; extract field n from result set and return an HTML string in upper case
(define (field-result-set rs n)

  (let ((jresult::java.lang.String (java.lang.String-java.lang.String8 ""))
	(result ""))
    
    (set! jresult (java.sql.ResultSet-getString2 rs n))
    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
    (debug-display-nl (string-append "BiglooCode.scm :: field-result-set : result = " result))
    
    (debug-display "BiglooCode.scm :: field-result-set : = (java.sql.ResultSet-wasNull rs) :")
    (debug-display (java.sql.ResultSet-wasNull rs))
    (debug-newline)
    
    (if (java.sql.ResultSet-wasNull rs)
	"&nbsp;" 
	(string-upcase result))))


;; extract field n from result set and return an HTML string in upper case and lower case starting at position x
(define (field-result-set-lower-case-ending rs n x)

  (let ((jresult::java.lang.String (java.lang.String-java.lang.String8 ""))
	(result "")
	(len 0)) ;; length of string
    
    (set! jresult (java.sql.ResultSet-getString2 rs n))
    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
    (debug-display-nl (string-append "BiglooCode.scm :: field-result-set : result = " result))
    
    (debug-display "BiglooCode.scm :: field-result-set : = (java.sql.ResultSet-wasNull rs) :")
    (debug-display (java.sql.ResultSet-wasNull rs))
    (debug-newline)
    
    (if (java.sql.ResultSet-wasNull rs)
	"&nbsp;" 
	(else-block
	  (set! len (string-length result))
	  (if (>= x len)
	      (string-upcase result)
	      (else-block
	       (string-append (string-upcase (substring result 0 x))
			      (substring result x))))))))


(define (string-set-lower-case-ending str x)
  (if (>= x (string-length str))
      (string-upcase str)
      (else-block ;; a supprimer car il y a que une instruction
       (string-append (string-upcase (substring str 0 x))
		      (substring str x)))))


;; extract field n from result set and renturn an HTML string in lower
(define (field-result-set-lowercase rs n)

  (let ((jresult::java.lang.String (java.lang.String-java.lang.String8 ""))
	(result ""))
	

    
    (set! jresult (java.sql.ResultSet-getString2 rs n))
    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
    (debug-display-nl (string-append "BiglooCode.scm :: field-result-set : result = " result))
    
    (debug-display "BiglooCode.scm :: field-result-set : = (java.sql.ResultSet-wasNull rs) :")
    (debug-display (java.sql.ResultSet-wasNull rs))
    (debug-newline)
    
    (if (java.sql.ResultSet-wasNull rs)
	"&nbsp;" 
	result)))


;; extract field n from result set and renturn an HTML string in lower case - check star 
(define (field-result-set-lowercase-check-star rs n)

  (let ((jresult::java.lang.String (java.lang.String-java.lang.String8 ""))
	(result ""))
    
    (set! jresult (java.sql.ResultSet-getString2 rs n))
    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
    (debug-display-nl (string-append "BiglooCode.scm :: field-result-set : result = " result))
    
    (debug-display "BiglooCode.scm :: field-result-set : = (java.sql.ResultSet-wasNull rs) :")
    (debug-display (java.sql.ResultSet-wasNull rs))
    (debug-newline)
    
    (if (or (java.sql.ResultSet-wasNull rs) (string=? result "*")) 
	"&nbsp;" 
	result)))


;; extract field n from result set and renturn an HTML string in lower case - check minus
(define (field-result-set-lowercase-check-minus rs n)

  (let ((jresult::java.lang.String (java.lang.String-java.lang.String8 ""))
	(result ""))
    
    (set! jresult (java.sql.ResultSet-getString2 rs n))
    (set! result (eu.oca.bigloofunct.JavaForBigloo-jstring->bstring jresult))
    (debug-display-nl (string-append "BiglooCode.scm :: field-result-set : result = " result))
    
    (debug-display "BiglooCode.scm :: field-result-set : = (java.sql.ResultSet-wasNull rs) :")
    (debug-display (java.sql.ResultSet-wasNull rs))
    (debug-newline)
    
    (if (or (java.sql.ResultSet-wasNull rs) (string=? result "-")) 
	"&nbsp;" 
	result)))


(define (fix x)
  (debug-display-nl "BiglooCode.scm :: entering fix")
  (let ((r (inexact->exact (truncate x))))
    (debug-display "BiglooCode.scm :: fix :: r =")
    (debug-display r)
    (debug-newline)
    r))


(define (num->string n)
  (if (bignum? n)
      (bignum->string n)
      (number->string n)))

(define (get-char str)
  (string-ref str 0))


;;(trim-leading "    tttt") -> tttt
(define (trim-leading str)
  (define i (string-skip str #\space))
  (substring str i))

;; (trim-trailing "####  ") -> ####
(define (trim-trailing str)
  (define i (string-skip-right str #\space))
  (substring str 0 (+ i 1)))


;;(begin (display "|") (display (trim-both "    #####     ")) (display "|") (newline)) -> |#####|
(define (trim-both str)
  (trim-trailing (trim-leading str)))


;; convert name of binary (double star stellar object) to the WDS (Washington Double Star) catalog format with composant appended at the end
(define (convert-Nom s) ;; Nom is variable 'objet'

  ;; call the pregexp-match function
  ;;
  ;; first, some examples from the REPL tests:
  ;; (pregexp-match "^[[:space:]]*([[:alpha:]]{1,6})[[:space:]]*([[:digit:]]{1,6})[[:space:]]*([[:alpha:]-:,[:space:]]{0,5})[[:space:]]*$" "mca 75a b") -> (mca 75a b mca 75 a b)
  ;; (pregexp-match "^[[:space:]]*([[:alpha:]]{1,6})[[:space:]]*([[:digit:]]{1,6})[[:space:]]*([[:alpha:]-:,[:space:]]{0,5})[[:space:]]*$" "COU 14 AB") -> (COU 14 AB COU 14 AB)
  ;; (pregexp-match "^[[:space:]]*([[:alpha:]]{1,6})[[:space:]]*([[:digit:]]{1,6})[[:space:]]*([[:alpha:]-:,[:space:]]{0,5})[[:space:]]*$" "C1OU14AB") -> #f
  ;; (pregexp-match "^[[:space:]]*([[:alpha:]]{1,6})[[:space:]]*([[:digit:]]{1,6})[[:space:]]*([[:alpha:]-:,[:space:]]{0,5})[[:space:]]*$" "COU 14") -> (COU 14 COU 14 )
  ;; (pregexp-match "^[[:space:]]*([[:alpha:]]{1,6})[[:space:]]*([[:digit:]]{1,6})[[:space:]]*([[:alpha:]-:,[:space:]]{0,5})[[:space:]]*$" "COU") -> #f 

  ;; (pregexp-match "^[[:space:]]*([[:alpha:]]{1,6})[[:space:]]*([[:digit:]]{1,6})[[:space:]]*([[:alpha:]-:,[:space:]]{0,5})[[:space:]]*$" "H 5 32 Aa-B") -> #f
  ;; (pregexp-match "^[[:space:]]*([[:alpha:]]{1,6})[[:space:]]*([[:digit:]]{1,6})[[:space:]]*([[:alpha:]-:,[:space:]]{0,5})[[:space:]]*$" "alpha ori") -> #f

  ;;(define reg-exp "^[[:space:]]*([[:alpha:]]{1,6})[[:space:]]*([[:digit:]]{1,6})[[:space:]]*([[:alpha:]-:,[:space:]]{0,5})[[:space:]]*$")

  (define reg-exp-some-spaces "[[:space:]]*")

  (define reg-exp-Discoverer "([[:alpha:]]{1,6})") ;; ex.: COU
  
  ;;(define reg-exp-Components "([[:alpha:]-:,[:space:]]{0,5})") ;; examples: a b , Aa-B , AB
  ;;(define reg-exp-Components "[[[:alpha:]]*[-:,[:space:]]?[[:alpha:]]*]{0,5}") ;; examples: a b , Aa-B , AB
  ;;(define reg-exp-Components "^[[:alpha:]]?[[:alpha:]-:,[:space:]]{0,3}[[:alpha:]]?$") ;; examples: a b , Aa-B , AB
  ;;(define reg-exp-Components "T[[:alpha:]][[:alpha:]-:,[:space:]]{0,3}[[:alpha:]]$") ;; examples: a b , Aa-B , AB
  ;;(define reg-exp-Components "[[:alpha:]][[:alpha:]-:,[:space:]]{0,3}[[:alpha:]]$") ;; examples: a b , Aa-B , AB
  ;;(define reg-exp-Components "T[[:alpha:]][[:alpha:]-:,[:space:]]{0,3}[[:alpha:]]") ;; examples: a b , Aa-B , AB
  ;;(define reg-exp-Components "([[:alpha:]][[:alpha:]-:,[:space:]]{0,3}[[:alpha:]])") ;; examples: a b , Aa-B , AB
  
  ;;(define reg-exp-Components "([[:alpha:]][[:alpha:]-:,[:space:]]{0,3}[[:alpha:]])") ;; examples: a b , Aa-B , AB
  ;;(define reg-exp-Components "([[:alpha:][[:alpha:]-:,[:space:]]{0,3}[:alpha:]]?)") ;; examples: a b , Aa-B , AB
  
  ;;(define reg-exp-Components "(^$|[[:alpha:]][[:alpha:]-:,[:space:]]{0,3}[[:alpha:]])")
  
  (define reg-exp-Components-simple "([[:alpha:]-:,[:space:]]{0,5})")
  ;;(define reg-exp-Components-simple "([[:alpha:]-:,[:space:]]{1,5})")
  (define reg-exp-Components-refined "([[:alpha:]][[:alpha:]-:,[:space:]]{0,3}[[:alpha:]])")
  
  ;; (pregexp-match reg-exp-Components "Aa-B") -> (Aa-B Aa-B)
  ;; (pregexp-match reg-exp-Components "A B") -> (A B A B)
  ;; (pregexp-match reg-exp-Components "AB") -> (AB AB)

  (define reg-exp-simple-Number "^([[:digit:]]{1,6})$") ;; (pregexp-match reg-exp-simple-Number "123456789") -> #f
  ;; (pregexp-match reg-exp-simple-Number "1234") -> (1234)

  ;;(define reg-exp-space-separated-Numbers "[[:digit:]]{1,4}[[:space:]][[:digit:]]{1,4}")
  ;;(define reg-exp-space-separated-Numbers "([[:digit:]]{1,4}[[:space:]]?[[:digit:]]{1,4})")
  ;;(define reg-exp-space-separated-Numbers "([[:digit:]]{1,4}[[:space:]]*[[:digit:]]{1,4})")
  (define reg-exp-space-separated-Numbers "([[:digit:]]{1,4}[[:space:]]*[[:digit:]]{0,4})")

  (define reg-exp-Numbers (string-append "([" reg-exp-simple-Number "|" reg-exp-space-separated-Numbers "])"))
  ;;(define reg-exp-Numbers (string-append "([" reg-exp-simple-Number "|" reg-exp-space-separated-Numbers "])"))

  ;;(define reg-exp-Discoverer-Numbers (string-append "^" reg-exp-Discoverer reg-exp-some-spaces reg-exp-Numbers "$"))

  (define reg-exp-spaces-Discoverer-Numbers-spaces (string-append reg-exp-some-spaces reg-exp-Discoverer reg-exp-some-spaces reg-exp-Numbers reg-exp-some-spaces))

  ;;(define reg-exp-spaces-Discoverer-Numbers-spaces (string-append "^" reg-exp-some-spaces reg-exp-Discoverer reg-exp-some-spaces reg-exp-Numbers reg-exp-some-spaces "$"))

  

  (define reg-exp-spaces-Discoverer-Number-or-Numbers-spaces-Components (string-append "^" reg-exp-some-spaces reg-exp-Discoverer reg-exp-some-spaces reg-exp-Numbers reg-exp-some-spaces  reg-exp-Components-simple))

  ;;(define reg-exp "^[[:space:]]*([[:alpha:]]{1,6})[[:space:]]*([[:digit:]]{1,6})[[:space:]]*([[:alpha:]-:,[:space:]]{0,5})[[:space:]]*$")

  (define reg-exp-spaces-Discoverer-Number-spaces-Components (string-append "^" reg-exp-some-spaces reg-exp-Discoverer reg-exp-some-spaces reg-exp-simple-Number reg-exp-some-spaces  reg-exp-Components-simple "$"))

  ;; (pregexp-match reg-exp-spaces-Discoverer-Number-spaces-Components "H 5 32 Aa-B") -> 

  ;;(define reg-exp-spaces-Discoverer-Number-spaces-Components-spaces (string-append "^" reg-exp-some-spaces reg-exp-Discoverer reg-exp-some-spaces reg-exp-simple-Number reg-exp-some-spaces  reg-exp-Components-simple reg-exp-some-spaces "$"))

  ;;(define reg-exp-spaces-Discoverer-Number-spaces-Components-spaces (string-append "^" reg-exp-some-spaces reg-exp-Discoverer reg-exp-some-spaces reg-exp-simple-Number reg-exp-some-spaces  reg-exp-Components-simple reg-exp-some-spaces))
  
  (define reg-exp-spaces-Discoverer-Numbers-spaces-Components-spaces (string-append "^" reg-exp-some-spaces reg-exp-Discoverer reg-exp-some-spaces reg-exp-space-separated-Numbers  reg-exp-some-spaces  reg-exp-Components-simple reg-exp-some-spaces))

  ;;(define reg-exp-spaces-Discoverer-Number-or-Numbers-spaces-Components-spaces (string-append "^" reg-exp-some-spaces reg-exp-Discoverer reg-exp-some-spaces reg-exp-Numbers reg-exp-some-spaces  reg-exp-Components-simple reg-exp-some-spaces))

  (define reg-exp-number6 "[[:digit:]]{1,6}")

  (define pm-objet (pregexp-match reg-exp-spaces-Discoverer-Numbers-spaces-Components-spaces s))
  ;;(define pm-objet (pregexp-match reg-exp-spaces-Discoverer-Number-or-Numbers-spaces-Components-spaces s))
  
  (display-nl "BiglooCode.scm :: convert-Nom : pm-objet =")
  
  (display-regex-match pm-objet)

  (if pm-objet ;; valid Name
      (let* ((cluster-list (rest pm-objet))
	     (discoverer (first cluster-list))
	     (number-tmp (second cluster-list))
	     (reg-exp-digit-space (begin
				    (debug-display "BiglooCode.scm :: convert-Nom : number-tmp :")
				    (debug-display number-tmp)
				    (debug-display-nl "|")
				    (debug-display-nl "BiglooCode.scm :: convert-Nom : in affectation of reg-exp-digit-space")
				    "^[[:digit:]]{1,6}[[:space:]]+$"))
	     (pm-objet-5 (pregexp-match reg-exp-digit-space number-tmp))
	     (number (if (begin ;; on  va tester si on a un nombre simple et si c'est ça on raccourçi de tous les espaces
			   (debug-display "BiglooCode.scm :: convert-Nom : pm-objet-5 :")
			   (debug-display-nl pm-objet-5)
			   pm-objet-5)
			 (let ((pm-objet4 (pregexp-match #;"[[:digit:]]{1,6}" reg-exp-number6 number-tmp)))
			   (debug-display "BiglooCode.scm :: convert-Nom :  pm-objet4 first = ")
			   (debug-display-nl pm-objet4)
			   (if pm-objet4  ;; if number
			       (begin
				 (display "BiglooCode.scm :: convert-Nom :  pm-objet4 = ")
				 (display-all-results-of-regex-match pm-objet4)
				 (first pm-objet4)) ;; "123     " -> "123"
			       (display-nl "BiglooCode.scm :: convert-Nom :  pm-objet4 : false"))) ;; end let
			 ;; else
			 (begin 
			   (debug-display "BiglooCode.scm :: convert-Nom : number-tmp :")
			   (debug-display-nl number-tmp)
			   number-tmp)))
	     (component (begin
			  (debug-display "BiglooCode.scm :: convert-Nom : number =")
			  (debug-display-nl number)
			  (third cluster-list)))
	     (pm-objet3 (pregexp-match reg-exp-simple-Number number))) ;; simple number? or two numbers
	     
	;; body of let
	(display-nl "BiglooCode.scm :: convert-Nom : pm-objet3 =")
	(if pm-objet3
	    (display-all-results-of-regex-match pm-objet3)
	    (display-nl pm-objet3))

	(if pm-objet3 ;; simple number?
	    
	    ;; attention le  nombre de clusters est toujours de 3 mais certaines chaines peuvent etre vides 
	    (if (string-null? component) ;; no component
		(concat_7 discoverer number) ;; return this string
		
		;; checking the component more precisely with reg-exp-Components-refined
		(let* ((pm-objet2 (pregexp-match reg-exp-Components-refined component))
		       (fine-component (when pm-objet2
					     (second pm-objet2))))
		  (if pm-objet2
		      (string-append (concat_7 discoverer number) fine-component)
		      (concat_7 discoverer number))))

	    ;; else we return s (not a simple number)
	    s)
	) ;; end let*
	      
      ;; else we simply return the input unchanged
      s))


(define display-result-one-regex-match (lambda (x) (begin (display "[") (display x) (display "]") (newline))))


;; BiglooCode.scm :: convert-Nom : pm-objet =
;; [H 5 32 Aa-B]
;; [H]
;; [5 32]
;; [Aa-B]
(define (display-all-results-of-regex-match L) (map display-result-one-regex-match L))

(define (display-regex-match rm)
  (if rm
      (display-all-results-of-regex-match rm)
      (display-nl rm)))
    
(define (concat_7 str1 str2)
  ;; DECLARE spc VARCHAR(7) DEFAULT SPACER(7-(LENGTH(str1)+LENGTH(str2)));
  (define spc (spacer (- 7 (+ (string-length str1)
			      (string-length str2)))))
  ;; RETURN CONCAT(str1,spc,str2);
  (string-append str1 spc str2))

;; return a string of n spaces
(define (spacer n)
  (if (= n 0)
      ""
      (string-append " " (spacer (- n 1)))))


