#*=====================================================================*/
#*    serrano/prgm/project/bigloo/examples/Jbigl/Makefile             */
#*    -------------------------------------------------------------    */
#*    Author      :  Manuel Serrano                                    */
#*    Creation    :  Tue Jan 30 15:19:19 1996                          */
#*    Last change :  Dim  6 dec 2015 10:35:08 CET (mattei)             */
#*    Copyright   :  1996-2004 Manuel Serrano, see LICENSE file        */
#*    -------------------------------------------------------------    */
#*    The makefile to build socket                                     */
#*=====================================================================*/

#*---------------------------------------------------------------------*/
#*    The default configuration                                        */
#*---------------------------------------------------------------------*/
include ../../Makefile.config

#*---------------------------------------------------------------------*/
#*    flags                                                            */
#*---------------------------------------------------------------------*/
BIGLOO          = $(BOOTBINDIR)/bigloo
BGLOPTFLAGS	= -O +rm -shapem -jvm-purify
BFLAGS		= $(BGLOPTFLAGS)

#*---------------------------------------------------------------------*/
#*    Objects and sources                                              */
#*---------------------------------------------------------------------*/

#*--- scm -------------------------------------------------------------*/
SCM_FILE	= BiglooCode #bigloocode #main

SCM_OBJ		= $(SCM_FILE:%=%.class)
SCM_SRC		= $(SCM_OBJ:%.class=%.scm)
SCM_PKG		= eu/oca/bigloofunct

#*--- java ------------------------------------------------------------*/
JVM_FILE	= JavaForBigloo

JVM_OBJ		= $(JVM_FILE:%=%.class)
JVM_SRC		= $(JVM_OBJ:%.class=%.java)

#*---------------------------------------------------------------------*/
#*    All objects and sources                                          */
#*---------------------------------------------------------------------*/
OBJ		= $(SCM_OBJ) $(JVM_OBJ) 
SRC		= $(JVM_SRC) $(SCM_SRC)

POPULATION	= $(SRC:%=examples/Jbigl/%) \
                  examples/Jbigl/Makefile \
                  examples/Jbigl/README

#*---------------------------------------------------------------------*/
#*    the goals.                                                       */
#*---------------------------------------------------------------------*/
java-test: $(OBJ)
	$(BIGLOO) -jvm $(OBJ) -o java-test

test: java-test
	./java-test

pop:
	@ echo $(POPULATION)

#*---------------------------------------------------------------------*/
#*    Cleaning                                                         */
#*---------------------------------------------------------------------*/
.PHONY: clean

clean:
	@ find . \( -name '*[~%]' \
                 -o -name '.??*[~%]' \
                 -o -name '#*#' \
                 -o -name '?*#' \
                 -o -name \*core \) \
                 -type f -exec $(RM) {} \;   
	@- $(RM) -f $(OBJ)
	@- $(RM) -f java-test *.jas *.jast *.jar
	$(RM) -f $(SCM_PKG)/*.class

#*---------------------------------------------------------------------*/
#*    Suffixes                                                         */
#*---------------------------------------------------------------------*/
.SUFFIXES:
.SUFFIXES: .scm .java .class

#*---------------------------------------------------------------------*/
#*    .java.class                                                      */
#*---------------------------------------------------------------------*/
#*    added -d . flag  for creation of directory for java package      */
#*---------------------------------------------------------------------*/
.java.class:
	echo $*.java:
	(export CLASSPATH=.:$(BOOTLIBDIR)/bigloo_s.zip:$$CLASSPATH; \
           $(JAVAC) $(JCFLAGS) -d . -Xdiags:verbose $*.java)

#*---------------------------------------------------------------------*/
#*    .scm.class                                                       */
#*---------------------------------------------------------------------*/
.scm.class:
	$(BIGLOO) -jvm -c $(BFLAGS) $*.scm -o $(SCM_PKG)/$*.class

