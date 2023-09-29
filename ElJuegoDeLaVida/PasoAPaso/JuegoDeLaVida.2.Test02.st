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


!classDefinition: #JuegoDeLaVida category: 'JuegoDeLaVida'!
Object subclass: #JuegoDeLaVida
	instanceVariableNames: 'celulas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JuegoDeLaVida'!

!JuegoDeLaVida methodsFor: 'initialization' stamp: 'JMB 9/23/2023 19:25:45'!
initializeConCelulasVivas: unaCelulas
	celulas := unaCelulas.! !


!JuegoDeLaVida methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 19:25:45'!
estaViva: unaCelula
	^ celulas size > 1! !

!JuegoDeLaVida methodsFor: 'as yet unclassified' stamp: 'JMB 10/24/2022 21:10:02'!
siguienteGeneracion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JuegoDeLaVida class' category: 'JuegoDeLaVida'!
JuegoDeLaVida class
	instanceVariableNames: ''!

!JuegoDeLaVida class methodsFor: 'instance creation' stamp: 'JMB 10/24/2022 21:09:33'!
conCelulasVivas: unaCelula
	^self new initializeConCelulasVivas: unaCelula ! !
