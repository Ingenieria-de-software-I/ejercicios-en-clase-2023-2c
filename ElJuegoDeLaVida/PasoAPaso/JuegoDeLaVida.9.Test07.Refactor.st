!classDefinition: #JuegoDeLaVidaTest category: 'JuegoDeLaVida'!
TestCase subclass: #JuegoDeLaVidaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JuegoDeLaVida'!

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 21:03:17'!
test01
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@2} conTableroDe: 3 por: 3 .
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 21:03:12'!
test02
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3} conTableroDe: 3 por: 3 .
	
	juego siguienteGeneracion.
	
	self assert: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 21:03:27'!
test03
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2.} conTableroDe: 3 por: 3 .
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 21:03:35'!
test04
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3} conTableroDe: 3 por: 3 .
	juego siguienteGeneracion.
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 21:03:44'!
test05
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3. 2@1. 2@2} conTableroDe: 3 por: 3 .
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 21:03:53'!
test06
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3. 2@1.} conTableroDe: 3 por: 3 .
	
	juego siguienteGeneracion.
	
	self assert: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 20:47:55'!
test07
	self 
		should: [ JuegoDeLaVida conCelulasVivas: {4@1.} conTableroDe: 3 por: 3. ]
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [ : anError | self assert: anError messageText equals: JuegoDeLaVida mensajeDeErrorCelulasFueraDeRango ]! !


!classDefinition: #JuegoDeLaVida category: 'JuegoDeLaVida'!
Object subclass: #JuegoDeLaVida
	instanceVariableNames: 'celulasVivas unasCelulasVivas_CHANGE_ME ancho alto'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JuegoDeLaVida'!

!JuegoDeLaVida methodsFor: 'initialization' stamp: 'JMB 9/23/2023 19:28:45'!
initializeConCelulasVivas: unaCelulas
	celulasVivas := unaCelulas.! !

!JuegoDeLaVida methodsFor: 'initialization' stamp: 'JMB 9/23/2023 20:52:41'!
initializeConCelulasVivas: unasCelulasVivas conTableroDe: unAncho por: unAlto 
	celulasVivas := unasCelulasVivas.
	ancho := unAncho.
	alto := unAlto.! !


!JuegoDeLaVida methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 19:28:45'!
estaViva: unaCelula
	^ celulasVivas includes: unaCelula! !

!JuegoDeLaVida methodsFor: 'as yet unclassified' stamp: 'JMB 10/24/2022 23:25:04'!
siguienteGeneracion
	 | celulasQueSobreviven |
	celulasQueSobreviven := celulasVivas select: [ :unaCelula | 
		(unaCelula eightNeighbors intersection: celulasVivas) size between: 2 and: 3].
	celulasVivas := celulasQueSobreviven! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JuegoDeLaVida class' category: 'JuegoDeLaVida'!
JuegoDeLaVida class
	instanceVariableNames: ''!

!JuegoDeLaVida class methodsFor: 'instance creation' stamp: 'JMB 9/23/2023 20:54:21'!
conCelulasVivas: unasCelulasVivas conTableroDe: unAncho por: unAlto
	
	(unasCelulasVivas allSatisfy: [ : unaCelula | unaCelula x <= unAncho ])
		ifFalse: [ self error: self mensajeDeErrorCelulasFueraDeRango ].
	^self new initializeConCelulasVivas: unasCelulasVivas conTableroDe: unAncho por: unAlto ! !


!JuegoDeLaVida class methodsFor: 'as yet unclassified' stamp: 'JMB 10/24/2022 23:54:43'!
mensajeDeErrorCelulasFueraDeRango
	^ 'Celula fuera de rango' ! !
