Class {
	#name : #UMLAssociation,
	#superclass : #UMLNamedEntity,
	#instVars : [
		'ends'
	],
	#category : #uUML
}

{ #category : #collaborations }
UMLAssociation >> between: anUMLClass and: anotherUMLClass [
	"Defines an association between two classes. There is no order. This method should always be invoked."
	
	self declareAssociationBetween: anotherUMLClass and: anUMLClass.
	
	ends at: anUMLClass name put: (UMLEnd entity: anUMLClass).
	ends at: anotherUMLClass name put: (UMLEnd entity:anotherUMLClass).
]

{ #category : #private }
UMLAssociation >> declareAssociationBetween: anotherUMLClass and: anUMLClass [
	anUMLClass associationAt: anotherUMLClass add: self.
	anotherUMLClass associationAt: anUMLClass add: self
]

{ #category : #accessing }
UMLAssociation >> endForName: anUMLClassName [

	^ ends at: anUMLClassName
]

{ #category : #private }
UMLAssociation >> endOf: anUMLClass [

	^ ends at: anUMLClass name
]

{ #category : #accessing }
UMLAssociation >> ends [
	^ ends values
]

{ #category : #collaborations }
UMLAssociation >> for: anUMLClass atLeast: anInteger [ 
	"Precondition: between:and: has been invoked"

	(self endOf: anUMLClass) multiplicity: (anInteger asString, '..*')

]

{ #category : #collaborations }
UMLAssociation >> for: anUMLClass range: anInterval [ 
	
	(self endOf: anUMLClass)  multiplicity: anInterval

]

{ #category : #initialization }
UMLAssociation >> initialize [
	super initialize. 
	ends := Dictionary new
]

{ #category : #collaborations }
UMLAssociation >> many: anUMLClass toMany: anotherUMLClass [
	"Defines an association between two classes. There is no order. This method should always be invoked."

	self declareAssociationBetween: anotherUMLClass and: anUMLClass.
	ends
		at: anUMLClass name
		put: (UMLEnd entity: anUMLClass multiplicity: '*').
	ends
		at: anotherUMLClass name
		put: (UMLEnd entity: anotherUMLClass multiplicity: '*')
]

{ #category : #collaborations }
UMLAssociation >> one: anUMLClass toMany: anotherUMLClass [
	"Defines an association between two classes. There is no order. This method should always be invoked."
	
	self declareAssociationBetween: anotherUMLClass and: anUMLClass.
	
	ends at: anUMLClass name put: (UMLEnd entity: anUMLClass multiplicity: '1').
	ends at: anotherUMLClass name put: (UMLEnd entity: anotherUMLClass multiplicity: '*').
]

{ #category : #private }
UMLAssociation >> other: anUMLClass [

	^ (ends at: (self otherEndThan: anUMLClass name))
]

{ #category : #private }
UMLAssociation >> otherEndThan: aName [

	^ (ends keys reject: [ :a | a = aName ]) first
]
