!classDefinition: #Semaforo category: 'Semaforo'!
DenotativeObject subclass: #Semaforo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Semaforo class' category: 'Semaforo'!
Semaforo class
	instanceVariableNames: 'colorActual listaDeColores'!

!Semaforo class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 19:19:30'!
cambiarEstado

	listaDeColores next.! !

!Semaforo class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 19:18:52'!
initialize

	listaDeColores := CircularReadStream on: {Color red. Color yellow. Color green. Color yellow.} moving: NullUnit.! !

!Semaforo class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 19:14:48'!
mostrarColor

	^colorActual! !


!Semaforo class methodsFor: '--** private fileout/in **--' stamp: 'LL 9/8/2023 19:30:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	colorActual := nil.
	listaDeColores := (CircularReadStream basicNew instVarAt: 1 put: ((Array new: 4) at: 1 put: (Color r: 0.898 g: 0.000 b: 0.000); at: 2 put: (Color r: 1.000 g: 1.000 b: 0.078); at: 3 put: (Color r: 0.082 g: 0.690 b: 0.102); at: 4 put: (Color r: 1.000 g: 1.000 b: 0.078); yourself); instVarAt: 2 put: 1; instVarAt: 3 put: NullUnit; instVarAt: 4 put: nil; instVarAt: 5 put: nil; yourself).! !

Semaforo initialize!
Semaforo initializeAfterFileIn!