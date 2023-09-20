!classDefinition: #LuzDeAvance category: 'SemaforoV2'!
Object subclass: #LuzDeAvance
	instanceVariableNames: 'morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!LuzDeAvance methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:27:51'!
apagar
	morph color: Color black.! !

!LuzDeAvance methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:22:19'!
createMorph

	morph := EllipseMorph new
		color: Color black;
		yourself.
		
	morph openInWorld.! !

!LuzDeAvance methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:27:10'!
prender
	morph color: Color green.! !


!classDefinition: #LuzDeDetencion category: 'SemaforoV2'!
Object subclass: #LuzDeDetencion
	instanceVariableNames: 'morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!LuzDeDetencion methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:26:41'!
apagar
	morph color: Color black.! !

!LuzDeDetencion methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:21:56'!
createMorph

	morph := EllipseMorph new
		color: Color black;
		yourself.
		
	morph openInWorld.! !

!LuzDeDetencion methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:21:41'!
prender
	morph color: Color red.! !


!classDefinition: #LuzDePrecaucion category: 'SemaforoV2'!
Object subclass: #LuzDePrecaucion
	instanceVariableNames: 'morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!LuzDePrecaucion methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 14:55:16'!
apagar
	morph color: Color black.! !

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

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 16:33:58'!
detenerTransitoEnCorrientes

	reguladorDeCorrientes prenderLuzDePrecaucion.
	(Delay for: 1 * second) wait.
	reguladorDeCorrientes apagarLuzDePrecaucion.
	
	reguladorDeCorrientes apagarLuzDeAvance.	
	reguladorDeCorrientes prenderLuzDeDetencion! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 16:33:56'!
detenerTransitoEnMaipu

	reguladorDeMaipu prenderLuzDePrecaucion.
	(Delay for: 1 * second) wait.
	reguladorDeMaipu apagarLuzDePrecaucion.
	
	reguladorDeMaipu apagarLuzDeAvance. 
	reguladorDeMaipu prenderLuzDeDetencion! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 14:28:05'!
enviarAvisoDeEncendido

	5 timesRepeat: [ 	self titilarLucesDePrecaucion 	]! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 14:51:15'!
initialize

	reguladorDeMaipu := Regulador new.
	reguladorDeCorrientes := Regulador new.! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 16:33:42'!
permitirTransitoEnCorrientes

	reguladorDeCorrientes prenderLuzDePrecaucion.
	(Delay for: 1 * second) wait.
	reguladorDeCorrientes apagarLuzDePrecaucion.
	
	reguladorDeCorrientes apagarLuzDeDetencion.
	reguladorDeCorrientes prenderLuzDeAvance.
	(Delay for: 3 * second) wait! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 16:33:45'!
permitirTransitoEnMaipu

	reguladorDeMaipu prenderLuzDePrecaucion.
	(Delay for: 1 * second) wait.
	reguladorDeMaipu apagarLuzDePrecaucion.
	
	reguladorDeMaipu apagarLuzDeDetencion.
	reguladorDeMaipu prenderLuzDeAvance.
	(Delay for: 3 * second) wait! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 16:29:14'!
prender

	self enviarAvisoDeEncendido.
	reguladorDeCorrientes prenderLuzDePrecaucion.
	2 timesRepeat: [ self regularTransito ].
	
	reguladorDeMaipu apagarLuzDeAvance.
	reguladorDeCorrientes apagarLuzDeDetencion.
	self enviarAvisoDeEncendido.! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 16:32:51'!
regularTransito

	self detenerTransitoEnMaipu.
	self permitirTransitoEnCorrientes.
	self detenerTransitoEnCorrientes.
	self permitirTransitoEnMaipu.
! !

!Semaforo methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 15:26:02'!
titilarLucesDePrecaucion

	reguladorDeMaipu prenderLuzDePrecaucion.
	reguladorDeCorrientes prenderLuzDePrecaucion.
	(Delay for: 0.5 * second) wait.
	reguladorDeMaipu apagarLuzDePrecaucion.
	reguladorDeCorrientes apagarLuzDePrecaucion.
	(Delay for: 0.5 * second) wait! !
