!classDefinition: #JuegoDeLaVidaTest category: 'JuegoDeLaVida'!
TestCase subclass: #JuegoDeLaVidaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JuegoDeLaVida'!

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 18:14:32'!
test01
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@2}.
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 10/24/2022 22:13:19'!
test02
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3}.
	
	juego siguienteGeneracion.
	
	self assert: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 18:21:40'!
test03
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2.}.
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 10/24/2022 22:56:13'!
test04
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3}.
	juego siguienteGeneracion.
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !


!classDefinition: #JuegoDeLaVida category: 'JuegoDeLaVida'!
Object subclass: #JuegoDeLaVida
	instanceVariableNames: 'celulasVivas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JuegoDeLaVida'!

!JuegoDeLaVida methodsFor: 'initialization' stamp: 'JMB 9/23/2023 19:28:45'!
initializeConCelulasVivas: unaCelulas
	celulasVivas := unaCelulas.! !


!JuegoDeLaVida methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 19:28:45'!
estaViva: unaCelula
	^ celulasVivas includes: unaCelula! !

!JuegoDeLaVida methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 19:28:45'!
siguienteGeneracion
	 | celulasQueSobreviven |
	celulasQueSobreviven := celulasVivas select: [ :unaCelula | 
		(unaCelula eightNeighbors intersection: celulasVivas) size > 1 ].
	celulasVivas := celulasQueSobreviven! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JuegoDeLaVida class' category: 'JuegoDeLaVida'!
JuegoDeLaVida class
	instanceVariableNames: ''!

!JuegoDeLaVida class methodsFor: 'instance creation' stamp: 'JMB 10/24/2022 21:09:33'!
conCelulasVivas: unaCelula
	^self new initializeConCelulasVivas: unaCelula ! !
