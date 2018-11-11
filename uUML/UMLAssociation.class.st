Class {
	#name : #UMLAssociation,
	#superclass : #UMLNamedEntity,
	#category : #uUML
}

{ #category : #collaborations }
UMLAssociation >> for: anUMLClass atLeast: anInteger [ 

	anUMLClass associationAt: anUMLClass add: self.
]
