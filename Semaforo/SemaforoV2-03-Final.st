!classDefinition: #LuzDeRegulador category: 'SemaforoV2'!
Object subclass: #LuzDeRegulador
	instanceVariableNames: 'morph color'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!LuzDeRegulador methodsFor: 'public' stamp: 'LL 9/10/2023 21:03:45'!
apagar

	morph color: Color black.! !

!LuzDeRegulador methodsFor: 'public' stamp: 'LL 9/10/2023 20:52:15'!
prender

	morph color: color.! !


!LuzDeRegulador methodsFor: 'initialization' stamp: 'LL 9/10/2023 20:51:44'!
inicializarCon: unColorDeLuz

	color := unColorDeLuz.! !


!LuzDeRegulador methodsFor: 'morph' stamp: 'LL 9/10/2023 20:47:34'!
createMorph

	morph := EllipseMorph new
		color: Color black;
		yourself.
		
	morph openInWorld.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzDeRegulador class' category: 'SemaforoV2'!
LuzDeRegulador class
	instanceVariableNames: ''!

!LuzDeRegulador class methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 20:55:57'!
deAvance

	^self new inicializarCon: Color green.! !

!LuzDeRegulador class methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 20:56:09'!
deDetencion

	^self new inicializarCon: Color red.! !

!LuzDeRegulador class methodsFor: 'as yet unclassified' stamp: 'LL 9/10/2023 20:56:23'!
dePrecaucion

	^self new inicializarCon: Color yellow.! !


!classDefinition: #Regulador category: 'SemaforoV2'!
Object subclass: #Regulador
	instanceVariableNames: 'morph luzDePrecaucion luzDeDetencion luzDeAvance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!Regulador methodsFor: 'public' stamp: 'LL 9/10/2023 14:52:41'!
apagarLuzDePrecaucion

	luzDePrecaucion apagar.! !

!Regulador methodsFor: 'public' stamp: 'LL 9/10/2023 21:13:01'!
detenerTransito

	self enviarSeñalDePrecaucion.
	
	self apagarLuzDeAvance.	
	self prenderLuzDeDetencion.! !

!Regulador methodsFor: 'public' stamp: 'LL 9/10/2023 21:12:43'!
permitirTransito

	self enviarSeñalDePrecaucion.
	
	self apagarLuzDeDetencion.
	self prenderLuzDeAvance.
	(Delay for: 3 * second) wait! !

!Regulador methodsFor: 'public' stamp: 'LL 9/10/2023 14:52:31'!
prenderLuzDePrecaucion

	luzDePrecaucion prender.! !


!Regulador methodsFor: 'morph' stamp: 'LL 9/10/2023 14:40:21'!
createMorph

	morph := LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself.
		
	morph openInWorld.
! !


!Regulador methodsFor: 'initialization' stamp: 'LL 9/10/2023 20:56:59'!
initialize

	luzDePrecaucion := LuzDeRegulador dePrecaucion.
	luzDeDetencion := LuzDeRegulador deDetencion.
	luzDeAvance := LuzDeRegulador deAvance.! !


!Regulador methodsFor: 'private' stamp: 'LL 9/10/2023 21:13:36'!
apagarLuzDeAvance

	luzDeAvance apagar! !

!Regulador methodsFor: 'private' stamp: 'LL 9/10/2023 21:13:42'!
apagarLuzDeDetencion

	luzDeDetencion apagar! !

!Regulador methodsFor: 'private' stamp: 'LL 9/10/2023 21:12:43'!
enviarSeñalDePrecaucion

	self prenderLuzDePrecaucion.
	(Delay for: 1 * second) wait.
	self apagarLuzDePrecaucion! !

!Regulador methodsFor: 'private' stamp: 'LL 9/10/2023 21:13:50'!
prenderLuzDeAvance

	luzDeAvance prender.! !

!Regulador methodsFor: 'private' stamp: 'LL 9/10/2023 21:13:51'!
prenderLuzDeDetencion

	luzDeDetencion prender.! !


!classDefinition: #Semaforo category: 'SemaforoV2'!
Object subclass: #Semaforo
	instanceVariableNames: 'reguladorDeMaipu reguladorDeCorrientes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemaforoV2'!

!Semaforo methodsFor: 'public' stamp: 'LL 9/10/2023 16:29:14'!
prender

	self enviarAvisoDeEncendido.
	reguladorDeCorrientes prenderLuzDePrecaucion.
	2 timesRepeat: [ self regularTransito ].
	
	reguladorDeMaipu apagarLuzDeAvance.
	reguladorDeCorrientes apagarLuzDeDetencion.
	self enviarAvisoDeEncendido.! !


!Semaforo methodsFor: 'initialization' stamp: 'LL 9/10/2023 14:51:15'!
initialize

	reguladorDeMaipu := Regulador new.
	reguladorDeCorrientes := Regulador new.! !


!Semaforo methodsFor: 'private' stamp: 'LL 9/10/2023 14:28:05'!
enviarAvisoDeEncendido

	5 timesRepeat: [ 	self titilarLucesDePrecaucion 	]! !

!Semaforo methodsFor: 'private' stamp: 'LL 9/10/2023 21:09:30'!
regularTransito

	reguladorDeMaipu detenerTransito.
	reguladorDeCorrientes permitirTransito.
	reguladorDeCorrientes detenerTransito.
	reguladorDeMaipu permitirTransito.
! !

!Semaforo methodsFor: 'private' stamp: 'LL 9/10/2023 15:26:02'!
titilarLucesDePrecaucion

	reguladorDeMaipu prenderLuzDePrecaucion.
	reguladorDeCorrientes prenderLuzDePrecaucion.
	(Delay for: 0.5 * second) wait.
	reguladorDeMaipu apagarLuzDePrecaucion.
	reguladorDeCorrientes apagarLuzDePrecaucion.
	(Delay for: 0.5 * second) wait! !
