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
	#superclass : #UMLNamedEntity,
	#instVars : [
		'variables',
		'operations',
		'subclasses',
		'superclass',
		'associations'
	],
	#category : #uUML
}

{ #category : #example }
UMLClass class >> comixSerie [
	<sampleInstance>
	
	| uUMLClass |
	uUMLClass := UMLClass named: 'ComixSerie'.
	uUMLClass instVar: 'name'.
	uUMLClass instVar: 'ongoing'.
	^ uUMLClass
]

{ #category : #example }
UMLClass class >> myself [
	<sampleInstance>
	
	^ (UMLClass named: 'UMLClass')
		instVar: 'variables';
		instVar: 'operations'
]

{ #category : #associations }
UMLClass >> associationAt: anUMLClass add: aRelation [

	associations at: anUMLClass name add: aRelation
]

{ #category : #inheritance }
UMLClass >> extends: aClass [
	"Add myself to the subclass of aClass"
	aClass subclasses add: self.
	self superclass: aClass.
]

{ #category : #testing }
UMLClass >> includesOperation: aString [ 
	^ operations includes: aString
]

{ #category : #testing }
UMLClass >> includesSubclass: aString [ 
	^ subclasses includes: aString
]

{ #category : #testing }
UMLClass >> includesVariable: aString [ 
	^ variables includes: aString
]

{ #category : #initialization }
UMLClass >> initialize [

	super initialize. 
	variables := CTUniqueOrderedCollection new. 
	operations := CTUniqueOrderedCollection new.
	subclasses := CTUniqueOrderedCollection new.
	associations := CTOrderedMultiMap new.
	
]

{ #category : #'variables / operations' }
UMLClass >> instVar: aString [ 
	"Add a new class"
	variables add: aString
]

{ #category : #associations }
UMLClass >> isInRelationWith: aName [

	
]

{ #category : #'variables / operations' }
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
		nextPutAll: 'u~';
		nextPutAll: name;
		cr
]

{ #category : #associations }
UMLClass >> relationsWith: aName [

	^ associations allAt: aName ifAbsent: [ #() ]

	
]

{ #category : #inheritance }
UMLClass >> subclass: anUMLClass [ 
	
]

{ #category : #accessing }
UMLClass >> subclasses [ 
	^ subclasses
]

{ #category : #accessing }
UMLClass >> superclass [
	^ superclass
]

{ #category : #inheritance }
UMLClass >> superclass: aClass [

	superclass := aClass
]

{ #category : #accessing }
UMLClass >> variables [ 
	"since this is not a problem expose collection instead of providing an iterator"
	^ variables
]
