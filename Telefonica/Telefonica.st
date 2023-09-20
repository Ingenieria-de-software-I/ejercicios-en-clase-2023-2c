!classDefinition: #TestXXX category: 'Telefonica'!
TestCase subclass: #TestXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica'!

!TestXXX methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:04:35'!
test01

	| factura facturador llamadas unNumeroDeDestino unNumeroDeOrigen unaHoraDeFin unaHoraDeInicio |
	facturador := Facturador new.
	
	unNumeroDeOrigen := NumeroDeTelefono codigoDePais: 54 codigoDeArea: 11 numero: 44445555.
	unNumeroDeDestino := NumeroDeTelefono codigoDePais: 54 codigoDeArea: 11 numero: 44445556.
	unaHoraDeInicio := May/18/2023 at: 18:00.
	unaHoraDeFin := unaHoraDeInicio next: 10 * minute.
	
	llamadas := OrderedCollection with: (Llamada desde: unNumeroDeOrigen hacia: unNumeroDeDestino empezando: unaHoraDeInicio finalizando: unaHoraDeFin).
	
	factura := facturador facturaDe: llamadas durante: May, 2023.
	
	self assert: factura total equals: 50 * peso.
		! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:04:40'!
test02

	| factura facturador llamadas unNumeroDeDestino unNumeroDeOrigen unaHoraDeFin unaHoraDeInicio |
	facturador := Facturador new.
	
	unNumeroDeOrigen := NumeroDeTelefono codigoDePais: 54 codigoDeArea: 11 numero: 44445555.
	unNumeroDeDestino := NumeroDeTelefono codigoDePais: 54 codigoDeArea: 12 numero: 44445556.
	unaHoraDeInicio := May/18/2023 at: 18:00.
	unaHoraDeFin := unaHoraDeInicio next: 10 * minute.
	
	llamadas := OrderedCollection with: (Llamada desde: unNumeroDeOrigen hacia: unNumeroDeDestino empezando: unaHoraDeInicio finalizando: unaHoraDeFin).
	
	factura := facturador facturaDe: llamadas durante: May, 2023.
	
	self assert: factura total equals: 100 * peso.
		! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:04:45'!
test03

	| factura facturador llamadas unNumeroDeDestino unNumeroDeOrigen unaHoraDeFin unaHoraDeInicio |
	facturador := Facturador new.
	
	unNumeroDeOrigen := NumeroDeTelefono codigoDePais: 54 codigoDeArea: 11 numero: 44445555.
	unNumeroDeDestino := NumeroDeTelefono codigoDePais: 1 codigoDeArea: 12 numero: 44445556.
	unaHoraDeInicio := May/18/2023 at: 18:00.
	unaHoraDeFin := unaHoraDeInicio next: 10 * minute.
	
	llamadas := OrderedCollection with: (Llamada desde: unNumeroDeOrigen hacia: unNumeroDeDestino empezando: unaHoraDeInicio finalizando: unaHoraDeFin).
	
	factura := facturador facturaDe: llamadas durante: May, 2023.
	
	self assert: factura total equals: 200 * peso.
		! !


!classDefinition: #Factura category: 'Telefonica'!
Object subclass: #Factura
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica'!

!Factura methodsFor: 'initialization' stamp: 'LL 9/19/2023 20:47:29'!
initializeCon: unTotal 
	total := unTotal.! !


!Factura methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 20:47:38'!
total
	^total! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Factura class' category: 'Telefonica'!
Factura class
	instanceVariableNames: ''!

!Factura class methodsFor: 'instance creation' stamp: 'LL 9/19/2023 20:47:10'!
con: total
	^self new initializeCon: total ! !


!classDefinition: #Facturador category: 'Telefonica'!
Object subclass: #Facturador
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica'!

!Facturador methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 23:00:09'!
costoDe: unaLlamada
.
	^(TarifadorDeLlamada para: unaLlamada) tarifar: unaLlamada.! !

!Facturador methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 20:56:34'!
facturaDe: llamadas durante: unaPeriodoDeFacturacion 

	| total |
	total := llamadas sum: [ :unaLlamada | self costoDe: unaLlamada ].

	^Factura con: total.! !


!classDefinition: #Llamada category: 'Telefonica'!
Object subclass: #Llamada
	instanceVariableNames: 'numeroDeOrigen numeroDeDestino horaDeInicio horaDeFin'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica'!

!Llamada methodsFor: 'initialization' stamp: 'LL 9/19/2023 20:30:49'!
initializeDesde: unNumeroDeOrigen hacia: unNumeroDeDestino empezando: unaHoraDeInicio finalizando: unaHoraDeFin 
	numeroDeOrigen := unNumeroDeOrigen.
	numeroDeDestino := unNumeroDeDestino.
	horaDeInicio := unaHoraDeInicio.
	horaDeFin := unaHoraDeFin.! !


!Llamada methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 20:46:59'!
duracion
	^horaDeInicio distanceTo: horaDeFin.! !

!Llamada methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 20:55:46'!
esInternacional
	^numeroDeOrigen codigoDePais ~= numeroDeDestino codigoDePais! !

!Llamada methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 20:44:35'!
esLocal
	^numeroDeOrigen codigoDePais = numeroDeDestino codigoDePais and: [ numeroDeOrigen codigoDeArea = numeroDeDestino codigoDeArea ].! !

!Llamada methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 20:52:47'!
esNacional
	^numeroDeOrigen codigoDePais = numeroDeDestino codigoDePais and: [numeroDeOrigen codigoDeArea ~= numeroDeDestino codigoDeArea ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Llamada class' category: 'Telefonica'!
Llamada class
	instanceVariableNames: ''!

!Llamada class methodsFor: 'instance creation' stamp: 'LL 9/19/2023 20:38:46'!
desde: unNumeroDeOrigen hacia: unNumeroDeDestino empezando: unaHoraDeInicio finalizando: unaHoraDeFin
	unNumeroDeOrigen = unNumeroDeDestino ifTrue: [ self error: 'destino y origen deben ser distintos' ].
	unaHoraDeFin <= unaHoraDeInicio ifTrue: [ self error: 'la hora de fin no puede ser anterior a la de inicio'].

	^self new initializeDesde: unNumeroDeOrigen hacia: unNumeroDeDestino empezando: unaHoraDeInicio finalizando: unaHoraDeFin.! !


!classDefinition: #NumeroDeTelefono category: 'Telefonica'!
Object subclass: #NumeroDeTelefono
	instanceVariableNames: 'codigoDePais codigoDeArea numero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica'!

!NumeroDeTelefono methodsFor: 'initialization' stamp: 'LL 9/19/2023 20:30:09'!
initializeCodigoDePais: unCodigoDePais codigoDeArea: unCodigoDeArea numero: unNumero 
	codigoDePais := unCodigoDePais.
	codigoDeArea := unCodigoDeArea.
	numero := unNumero.! !


!NumeroDeTelefono methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 20:46:22'!
codigoDeArea
	^codigoDeArea! !

!NumeroDeTelefono methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 20:46:09'!
codigoDePais
	^codigoDePais! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NumeroDeTelefono class' category: 'Telefonica'!
NumeroDeTelefono class
	instanceVariableNames: ''!

!NumeroDeTelefono class methodsFor: 'instance creation' stamp: 'LL 9/19/2023 20:29:42'!
codigoDePais: unCodigoDePais codigoDeArea: unCodigoDeArea numero: unNumero 
	^self new initializeCodigoDePais: unCodigoDePais codigoDeArea: unCodigoDeArea numero: unNumero ! !


!classDefinition: #TarifadorDeLlamada category: 'Telefonica'!
Object subclass: #TarifadorDeLlamada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica'!

!TarifadorDeLlamada methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:17:43'!
tarifar: unaLlamada

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TarifadorDeLlamada class' category: 'Telefonica'!
TarifadorDeLlamada class
	instanceVariableNames: ''!

!TarifadorDeLlamada class methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:18:14'!
esPara: unaLlamada

	self subclassResponsibility! !

!TarifadorDeLlamada class methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:13:09'!
para: unaLlamada

	^(self subclasses detect: [ :unaClaseDeTarifador | unaClaseDeTarifador esPara: unaLlamada ]) new.! !


!classDefinition: #TarifadorDeLlamadaInternacional category: 'Telefonica'!
TarifadorDeLlamada subclass: #TarifadorDeLlamadaInternacional
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica'!

!TarifadorDeLlamadaInternacional methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:14:59'!
tarifar: unaLlamada 
	^200 * peso! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TarifadorDeLlamadaInternacional class' category: 'Telefonica'!
TarifadorDeLlamadaInternacional class
	instanceVariableNames: ''!

!TarifadorDeLlamadaInternacional class methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:13:33'!
esPara: unaLlamada

	^unaLlamada esInternacional! !


!classDefinition: #TarifadorDeLlamadaLocal category: 'Telefonica'!
TarifadorDeLlamada subclass: #TarifadorDeLlamadaLocal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica'!

!TarifadorDeLlamadaLocal methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:14:26'!
tarifar: unaLlamada 
	^5*peso/minute * unaLlamada duracion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TarifadorDeLlamadaLocal class' category: 'Telefonica'!
TarifadorDeLlamadaLocal class
	instanceVariableNames: ''!

!TarifadorDeLlamadaLocal class methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:13:41'!
esPara: unaLlamada

	^unaLlamada esLocal! !


!classDefinition: #TarifadorDeLlamadaNacional category: 'Telefonica'!
TarifadorDeLlamada subclass: #TarifadorDeLlamadaNacional
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Telefonica'!

!TarifadorDeLlamadaNacional methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:14:45'!
tarifar: unaLlamada 
	^100 * peso! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TarifadorDeLlamadaNacional class' category: 'Telefonica'!
TarifadorDeLlamadaNacional class
	instanceVariableNames: ''!

!TarifadorDeLlamadaNacional class methodsFor: 'as yet unclassified' stamp: 'LL 9/19/2023 21:13:48'!
esPara: unaLlamada

	^unaLlamada esNacional! !
