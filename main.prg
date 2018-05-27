&&*---------------------------------------------------------------------------*
*       �                                                         �
*       � VFPToolBar - Otra alternativa de menu para VFP.
*       �                                                         �
&&*---------------------------------------------------------------------------*
*       �                                                         �
*       �                                                         �
*       � Desarrollado por Irwin Rodr�guez
*       � Inicio 2017                                             �
*       � Barquisimeto, Lara, Venezuela
*       �                                                         �
&&*---------------------------------------------------------------------------*
&&*---------------------------------------------------------------------------*

*--------------------------------------------------------------------------------------*
* MAIN.PRG
*--------------------------------------------------------------------------------------*
LOCAL lcPath
SET BELL OFF
SET HOURS TO 24
m.lcPath = ADDBS(JUSTPATH(SYS(16,1)))
SET DEFAULT TO (m.lcPath)
SET CLASS TO vcx\VFPToolBar.vcx ADDITIVE
On Error Do ErrorHandler With Program(),Lineno(),Error(),Message()

DO FORM FORMS\MAIN
READ EVENTS

RELEASE CLASSLIB vcx\VFPToolBar.vcx
CLOSE DATABASES ALL
CLEAR ALL
*--------------------------------------------------------------------------------------*

&&*-----------------------------------------------------------------------------------------------*
&&*... Intercepta y maneja los errores del Sistema en Tiempo de Ejecuci�n
&&*-----------------------------------------------------------------------------------------------*
PROCEDURE ErrorHandler
	PARAMETERS tcProgram, tnLine, tnNumError, tcMensaje
	IF MESSAGEBOX("ERROR " + ALLTRIM(STR(tnNumError)) + " " + tcMensaje + " " + tcProgram + STR(tnLine) + CHR(13) + "�Desea continuar con la aplicaci�n?",4+32,"Winsoft") = 7
		CANCEL
		CLOSE ALL
		QUIT
	ELSE &&Messagebox("ERROR " + Alltrim(Str(tnNumError)) + " " + tcMensaje + " " + tcProgram + Str(tnLine) + Chr(13) + "�Desea continuar con la aplicaci�n?",4+32,"Winsoft") = 7
	ENDIF &&Messagebox("ERROR " + Alltrim(Str(tnNumError)) + " " + tcMensaje + " " + tcProgram + Str(tnLine) + Chr(13) + "�Desea continuar con la aplicaci�n?",4+32,"Winsoft") = 7
ENDPROC