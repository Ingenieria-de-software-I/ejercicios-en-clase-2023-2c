'From Cuis 6.0 [latest update: #5481] on 31 October 2022 at 8:41:50 pm'!
!classDefinition: #JuegoDeLaVidaTest category: 'JuegoDeLaVida'!
TestCase subclass: #JuegoDeLaVidaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JuegoDeLaVida'!

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 10/31/2022 20:40:32'!
test01_a
	self assert: Tablero new celulasVivas isEmpty! !

!JuegoDeLaVidaTest methodsFor: 'as yet unclassified' stamp: 'JMB 10/31/2022 20:41:04'!
test01_b
	self assert: Celula new estaViva! !
