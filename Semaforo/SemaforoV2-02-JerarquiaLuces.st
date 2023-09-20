!classDefinition: #Luz category: 'SemaforoV2'!
Object subclass: #Luz
	instanceVariableNames: 'morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!Luz methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 16:44:02'!
apagar
	morph color: Color black.! !

!Luz methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 16:44:30'!
createMorph

	morph := EllipseMorph new
		color: Color black;
		yourself.
		
	morph openInWorld.! !


!classDefinition: #LuzDeAvance category: 'SemaforoV2'!
Luz subclass: #LuzDeAvance
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!LuzDeAvance methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:27:10'!
prender
	morph color: Color green.! !


!classDefinition: #LuzDeDetencion category: 'SemaforoV2'!
Luz subclass: #LuzDeDetencion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!LuzDeDetencion methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:21:41'!
prender
	morph color: Color red.! !


!classDefinition: #LuzDePrecaucion category: 'SemaforoV2'!
Luz subclass: #LuzDePrecaucion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!LuzDePrecaucion methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 14:55:07'!
prender
	
	morph color: Color yellow.! !


!LuzDePrecaucion methodsFor: 'morph' stamp: 'LL 9/10/2023 14:36:24'!
createMorph

	morph := EllipseMorph new
		color: Color black;
		yourself.
		
	morph openInWorld.! !


!classDefinition: #Regulador category: 'SemaforoV2'!
Object subclass: #Regulador
	instanceVariableNames: 'morph luzDePrecaucion luzDeDetencion luzDeAvance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!Regulador methodsFor: 'morph' stamp: 'LL 9/10/2023 14:40:21'!
createMorph

	morph := LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself.
		
	morph openInWorld.
! !


!Regulador methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:27:34'!
apagarLuzDeAvance
	luzDeAvance apagar! !

!Regulador methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:26:27'!
apagarLuzDeDetencion
	luzDeDetencion apagar! !

!Regulador methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 14:52:41'!
apagarLuzDePrecaucion

	luzDePrecaucion apagar.! !

!Regulador methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:22:36'!
initialize

	luzDePrecaucion := LuzDePrecaucion new.
	luzDeDetencion := LuzDeDetencion new.
	luzDeAvance := LuzDeAvance new.! !

!Regulador methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:26:57'!
prenderLuzDeAvance
	luzDeAvance prender.! !

!Regulador methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:16:38'!
prenderLuzDeDetencion
	luzDeDetencion prender.! !

!Regulador methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 14:52:31'!
prenderLuzDePrecaucion

	luzDePrecaucion prender.! !


!classDefinition: #Semaforo category: 'SemaforoV2'!
Object subclass: #Semaforo
	instanceVariableNames: 'reguladorDeMaipu reguladorDeCorrientes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 14:28:05'!
enviarAvisoDeEncendido

	5 timesRepeat: [ 	self titilarLucesDePrecaucion 	]! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 14:51:15'!
initialize

	reguladorDeMaipu := Regulador new.
	reguladorDeCorrientes := Regulador new.! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 16:41:41'!
prender

	self enviarAvisoDeEncendido.

	2 timesRepeat: [ self regularElTransito ].! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 16:40:21'!
regularElTransito

	reguladorDeMaipu prenderLuzDePrecaucion.
	(Delay for: 1 * second) wait.
	reguladorDeMaipu apagarLuzDePrecaucion.
	reguladorDeMaipu apagarLuzDeAvance.
	reguladorDeMaipu prenderLuzDeDetencion.
	
	reguladorDeCorrientes prenderLuzDePrecaucion.
	(Delay for: 1 * second) wait.
	reguladorDeCorrientes apagarLuzDePrecaucion.
	reguladorDeCorrientes apagarLuzDeDetencion.
	reguladorDeCorrientes prenderLuzDeAvance.
	(Delay for: 3 * second) wait.
	
	reguladorDeCorrientes prenderLuzDePrecaucion.
	(Delay for: 1 * second) wait.
	reguladorDeCorrientes apagarLuzDePrecaucion.
	reguladorDeCorrientes apagarLuzDeAvance.
	reguladorDeCorrientes prenderLuzDeDetencion.

	reguladorDeMaipu prenderLuzDePrecaucion.
	(Delay for: 1 * second) wait.
	reguladorDeMaipu apagarLuzDePrecaucion.
	reguladorDeMaipu apagarLuzDeDetencion.
	reguladorDeMaipu prenderLuzDeAvance.
	(Delay for: 3 * second) wait.! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:26:02'!
titilarLucesDePrecaucion

	reguladorDeMaipu prenderLuzDePrecaucion.
	reguladorDeCorrientes prenderLuzDePrecaucion.
	(Delay for: 0.5 * second) wait.
	reguladorDeMaipu apagarLuzDePrecaucion.
	reguladorDeCorrientes apagarLuzDePrecaucion.
	(Delay for: 0.5 * second) wait! !
