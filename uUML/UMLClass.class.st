"
(UMLClass named: 'UMLClass')
	instVar: 'variables';
	instVar: 'operations'
	
UMLClass <~ 'UMLClass'
	instVar: 'variables';
	instVar: 'operations'
"
Class {
	#name : #UMLClass,
	#superclass : #Object,
	#instVars : [
		'variables',
		'operations',
		'name'
	],
	#category : #uUML
}

{ #category : #'instance creation' }
UMLClass class >> <~ aString [ 
	^ self new name: aString ; yourself
]

{ #category : #example }
UMLClass class >> myself [
	<sampleInstance>
	
	^ (UMLClass named: 'UMLClass')
		instVar: 'variables';
		instVar: 'operations'
]

{ #category : #'instance creation' }
UMLClass class >> named: aString [ 
	^ self new name: aString ; yourself
]

{ #category : #testing }
UMLClass >> includesOperation: aString [ 
	^ operations includes: aString
]

{ #category : #testing }
UMLClass >> includesVariable: aString [ 
	^ variables includes: aString
]

{ #category : #initialization }
UMLClass >> initialize [

	super initialize. 
	variables := OrderedCollection new. 
	operations := OrderedCollection new.
]

{ #category : #variables }
UMLClass >> instVar: aString [ 
	"Add a new class"
	variables add: aString
]

{ #category : #accessing }
UMLClass >> name [
	^ name
]

{ #category : #accessing }
UMLClass >> name: aString [ 
	name := aString
]

{ #category : #variables }
UMLClass >> operation: aString [ 
	"Add a new method named aString"
	operations add: aString
]

{ #category : #accessing }
UMLClass >> operations [ 
	"since this is not a problem expose collection instead of providing an iterator"
	^ operations
]

{ #category : #printing }
UMLClass >> printOn: aStream [

	aStream 
		nextPutAll: name;
		cr
]

{ #category : #accessing }
UMLClass >> variables [ 
	"since this is not a problem expose collection instead of providing an iterator"
	^ variables
]
