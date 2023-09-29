!classDefinition: #JuegoDeLaVidaTest category: 'JuegoDeLaVida'!
TestCase subclass: #JuegoDeLaVidaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JuegoDeLaVida'!

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 9/23/2023 18:11:41'!
test01
	| juego |
	juego := JuegoDeLaVida conCelulaViva: 1@2.
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !


!classDefinition: #JuegoDeLaVida category: 'JuegoDeLaVida'!
Object subclass: #JuegoDeLaVida
	instanceVariableNames: 'celula'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JuegoDeLaVida'!

!JuegoDeLaVida methodsFor: 'initialization' stamp: 'JMB 10/31/2022 20:28:34'!
initializeConCelulaViva: unaCelula 
	celula := unaCelula.! !


!JuegoDeLaVida methodsFor: 'as yet unclassified' stamp: 'JMB 10/31/2022 20:29:03'!
estaViva: aPoint 
	^ false! !

!JuegoDeLaVida methodsFor: 'as yet unclassified' stamp: 'JMB 10/31/2022 20:28:47'!
siguienteGeneracion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JuegoDeLaVida class' category: 'JuegoDeLaVida'!
JuegoDeLaVida class
	instanceVariableNames: ''!

!JuegoDeLaVida class methodsFor: 'instance creation' stamp: 'JMB 10/31/2022 20:28:23'!
conCelulaViva: unaCelula
	^self new initializeConCelulaViva: unaCelula! !
