!classDefinition: #LuzDePrecaucionDeCorrientes category: 'Semaforo'!
DenotativeObjectMorph subclass: #LuzDePrecaucionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzDePrecaucionDeCorrientes class' category: 'Semaforo'!
LuzDePrecaucionDeCorrientes class
	instanceVariableNames: ''!

!LuzDePrecaucionDeCorrientes class methodsFor: 'morph' stamp: 'LL 9/8/2023 20:21:53'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzDePrecaucionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 20:21:53'!
apagar
	self color: Color black.! !

!LuzDePrecaucionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 20:21:53'!
prender
	
	self color: Color yellow.! !


!LuzDePrecaucionDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'LL 9/10/2023 14:22:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #LuzDePrecaucionDeMaipu category: 'Semaforo'!
DenotativeObjectMorph subclass: #LuzDePrecaucionDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzDePrecaucionDeMaipu class' category: 'Semaforo'!
LuzDePrecaucionDeMaipu class
	instanceVariableNames: ''!

!LuzDePrecaucionDeMaipu class methodsFor: 'morph' stamp: 'LL 9/8/2023 19:37:43'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzDePrecaucionDeMaipu class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 19:40:27'!
apagar
	self color: Color black.! !

!LuzDePrecaucionDeMaipu class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 19:39:45'!
prender
	
	self color: Color yellow.! !


!LuzDePrecaucionDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'LL 9/10/2023 14:22:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #ReguladorDeCorrientes category: 'Semaforo'!
DenotativeObjectMorph subclass: #ReguladorDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReguladorDeCorrientes class' category: 'Semaforo'!
ReguladorDeCorrientes class
	instanceVariableNames: ''!

!ReguladorDeCorrientes class methodsFor: 'morph' stamp: 'LL 9/8/2023 20:18:43'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!ReguladorDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 20:38:12'!
apagarLuzDePrecaucion

	LuzDePrecaucionDeCorrientes apagar.! !

!ReguladorDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 20:38:00'!
prenderLuzDePrecaucion

	LuzDePrecaucionDeCorrientes prender.! !


!ReguladorDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'LL 9/10/2023 14:22:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #ReguladorDeMaipu category: 'Semaforo'!
DenotativeObjectMorph subclass: #ReguladorDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReguladorDeMaipu class' category: 'Semaforo'!
ReguladorDeMaipu class
	instanceVariableNames: ''!

!ReguladorDeMaipu class methodsFor: 'morph' stamp: 'LL 9/8/2023 19:38:06'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!ReguladorDeMaipu class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 20:38:20'!
apagarLuzDePrecaucion

	LuzDePrecaucionDeMaipu apagar.! !

!ReguladorDeMaipu class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 20:37:13'!
prenderLuzDePrecaucion

	LuzDePrecaucionDeMaipu prender.! !


!ReguladorDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'LL 9/10/2023 14:22:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SemaforoDeMaipuYCorrientes category: 'Semaforo'!
DenotativeObject subclass: #SemaforoDeMaipuYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeMaipuYCorrientes class' category: 'Semaforo'!
SemaforoDeMaipuYCorrientes class
	instanceVariableNames: ''!

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 13:04:37'!
enviarAvisoDeEncendido

	5 timesRepeat: [ 	self titilarLucesDePrecaucion 	]! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 20:27:19'!
prender

	self enviarAvisoDeEncendido! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 20:15:55'!
regularTransito! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'LL 9/8/2023 20:39:50'!
titilarLucesDePrecaucion

	ReguladorDeMaipu prenderLuzDePrecaucion.
	ReguladorDeCorrientes prenderLuzDePrecaucion.
	(Delay for: 0.5 * second) wait.
	ReguladorDeMaipu apagarLuzDePrecaucion.
	ReguladorDeCorrientes apagarLuzDePrecaucion.
	(Delay for: 0.5 * second) wait! !

LuzDePrecaucionDeCorrientes initializeAfterFileIn!
LuzDePrecaucionDeMaipu initializeAfterFileIn!
ReguladorDeCorrientes initializeAfterFileIn!
ReguladorDeMaipu initializeAfterFileIn!