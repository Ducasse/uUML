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

	ends add: anUMLClass.
	ends add: anotherUMLClass.
]

{ #category : #initialization }
UMLAssociation >> ends [
	^ ends
]

{ #category : #collaborations }
UMLAssociation >> for: anUMLClass atLeast: anInteger [ 
	self atLeast: anInteger.
	anUMLClass associationAt: anUMLClass add: self.
]

{ #category : #initialization }
UMLAssociation >> initialize [

	ends := OrderedCollection new
]
