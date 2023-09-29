!classDefinition: #JuegoDeLaVidaTest category: 'JuegoDeLaVida'!
TestCase subclass: #JuegoDeLaVidaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JuegoDeLaVida'!

!JuegoDeLaVidaTest methodsFor: 'tests' stamp: 'JBurella 9/29/2023 20:17:19'!
test01CelulasVivasConMenosDeDosVecinasVivasMuerenEnLaSiguienteGeneracion
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2} conTableroDe: 3 por: 3 .
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'tests' stamp: 'JMB 9/23/2023 22:15:40'!
test02CelulasVivasConDosVecinasVivasSobrevivenALaSiguienteGeneracion
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3} conTableroDe: 3 por: 3 .
	
	juego siguienteGeneracion.
	
	self assert: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'tests' stamp: 'JMB 9/28/2023 23:47:48'!
test03EnCadaGeneracionLasCelulasSobrevivenResucitanOMueren
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3} conTableroDe: 3 por: 3 .
	juego siguienteGeneracion.
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'tests' stamp: 'JMB 9/29/2023 00:26:53'!
test04CelulasConMasDeTresVecinasVivasMuerenEnLaSiguienteGeneracion
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3. 2@1. 2@2} conTableroDe: 3 por: 3 .
	
	juego siguienteGeneracion.
	
	self deny: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'tests' stamp: 'JMB 9/23/2023 22:29:56'!
test05CelulasVivasConTresVecinasVivasSobrevivenALaSiguienteGeneracion
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@2. 1@3. 2@1.} conTableroDe: 3 por: 3 .
	
	juego siguienteGeneracion.
	
	self assert: (juego estaViva: 1@2)! !

!JuegoDeLaVidaTest methodsFor: 'tests' stamp: 'JBurella 9/29/2023 20:32:54'!
test06NoPuedeHaberUnJuegoConCelulasEnUnaPosicionHorizontalSuperiorAlAnchoDelTablero
	self 
		should: [ JuegoDeLaVida conCelulasVivas: {4@1.} conTableroDe: 3 por: 4. ]
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [ : anError | self assert: anError messageText equals: JuegoDeLaVida mensajeDeErrorCelulasFueraDeRango ]! !

!JuegoDeLaVidaTest methodsFor: 'tests' stamp: 'JMB 9/28/2023 23:49:08'!
test07NoPuedeHaberUnJuegoConCelulasEnUnaPosicionHorizontalInferiorAUno
	self 
		should: [ JuegoDeLaVida conCelulasVivas: {0@1} conTableroDe: 3 por: 3. ]
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [ : anError | self assert: anError messageText equals: JuegoDeLaVida mensajeDeErrorCelulasFueraDeRango ]! !

!JuegoDeLaVidaTest methodsFor: 'tests' stamp: 'JBurella 9/29/2023 20:32:47'!
test08NoPuedeHaberUnJuegoConCelulasEnUnaPosicionVerticalalSuperiorAlAltoDelTablero
	self 
		should: [ JuegoDeLaVida conCelulasVivas: {1@4} conTableroDe: 4 por: 3. ]
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [ : anError | self assert: anError messageText equals: JuegoDeLaVida mensajeDeErrorCelulasFueraDeRango ]! !

!JuegoDeLaVidaTest methodsFor: 'tests' stamp: 'JMB 9/28/2023 23:50:15'!
test09NoPuedeHaberUnJuegoConCelulasEnUnaPosicionVerticalInferiorAUno
	self 
		should: [ JuegoDeLaVida conCelulasVivas: {1@0} conTableroDe: 3 por: 3. ]
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [ : anError | self assert: anError messageText equals: JuegoDeLaVida mensajeDeErrorCelulasFueraDeRango ]! !

!JuegoDeLaVidaTest methodsFor: 'tests' stamp: 'JMB 9/23/2023 22:40:26'!
test10CelulasMuertasConTresVecinasVivasResucitanEnLaSiguienteGeneracion
	| juego |
	juego := JuegoDeLaVida conCelulasVivas: {1@1. 1@3. 2@2.} conTableroDe: 3 por: 3.
	
	juego siguienteGeneracion.
	
	self assert: (juego estaViva: 1@2)! !


!classDefinition: #JuegoDeLaVida category: 'JuegoDeLaVida'!
Object subclass: #JuegoDeLaVida
	instanceVariableNames: 'celulasVivas ancho alto'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JuegoDeLaVida'!

!JuegoDeLaVida methodsFor: 'initialization' stamp: 'JMB 9/23/2023 20:52:41'!
initializeConCelulasVivas: unasCelulasVivas conTableroDe: unAncho por: unAlto 
	celulasVivas := unasCelulasVivas.
	ancho := unAncho.
	alto := unAlto.! !


!JuegoDeLaVida methodsFor: 'privado' stamp: 'JMB 9/23/2023 21:36:39'!
cantidadDeVecinosDe: unaCelula

	^ (unaCelula eightNeighbors intersection: celulasVivas) size! !

!JuegoDeLaVida methodsFor: 'privado' stamp: 'JMB 9/23/2023 22:03:55'!
celulasMuertas
	^ self celulasReject: [ : unaCelula | (self estaViva: unaCelula) ].! !

!JuegoDeLaVida methodsFor: 'privado' stamp: 'JMB 9/23/2023 21:45:37'!
celulasQueResucitanParaLaSiguienteGeneracion

	^ self celulasMuertas select: [ : unaCelula | self debeResucitar: unaCelula  ]! !

!JuegoDeLaVida methodsFor: 'privado' stamp: 'JMB 9/23/2023 21:46:24'!
celulasQueSobrevivenALaSiguienteGeneracion

	^ celulasVivas select: [ :unaCelula | 		self debeSobrevivir: unaCelula]! !

!JuegoDeLaVida methodsFor: 'privado' stamp: 'JBurella 9/29/2023 20:09:24'!
celulasReject: unBloque
	| celulas |
	celulas := OrderedCollection new.	
	1 to: ancho do: [ : x | 		1 to: alto do: [ : y | 
			(unBloque value: x@y) ifFalse: [ celulas add: x@y ] ]
		].
	^ celulas! !

!JuegoDeLaVida methodsFor: 'privado' stamp: 'JMB 9/23/2023 21:38:58'!
debeResucitar: unaCelula

	^ (self cantidadDeVecinosDe: unaCelula) = 3! !

!JuegoDeLaVida methodsFor: 'privado' stamp: 'JMB 9/29/2023 00:23:46'!
debeSobrevivir: unaCelula

	^ (self cantidadDeVecinosDe: unaCelula) between: 2 and: 3! !


!JuegoDeLaVida methodsFor: 'generaciones' stamp: 'JMB 9/23/2023 21:46:27'!
siguienteGeneracion
	 celulasVivas := self celulasQueSobrevivenALaSiguienteGeneracion union: self celulasQueResucitanParaLaSiguienteGeneracion! !


!JuegoDeLaVida methodsFor: 'testing' stamp: 'JMB 9/23/2023 19:28:45'!
estaViva: unaCelula
	^ celulasVivas includes: unaCelula! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JuegoDeLaVida class' category: 'JuegoDeLaVida'!
JuegoDeLaVida class
	instanceVariableNames: ''!

!JuegoDeLaVida class methodsFor: 'instance creation' stamp: 'JMB 9/28/2023 23:59:28'!
conCelulasVivas: unasCelulasVivas conTableroDe: unAncho por: unAlto  
	self assertLasCelulas: unasCelulasVivas estanEntre: unAncho y: unAlto.
	
	^self new initializeConCelulasVivas: unasCelulasVivas conTableroDe: unAncho por: unAlto  ! !


!JuegoDeLaVida class methodsFor: 'mensajes de error' stamp: 'JMB 10/24/2022 23:54:43'!
mensajeDeErrorCelulasFueraDeRango
	^ 'Celula fuera de rango' ! !


!JuegoDeLaVida class methodsFor: 'private' stamp: 'JMB 9/29/2023 00:20:21'!
assertLasCelulas: unasCelulasVivas estanEntre: unAncho y: unAlto

	(unasCelulasVivas allSatisfy: [ : unaCelula | unaCelula between: 1@1 and: unAncho@unAlto ])
		ifFalse: [ self error: self mensajeDeErrorCelulasFueraDeRango ]! !
