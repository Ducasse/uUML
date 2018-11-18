Class {
	#name : #UMLEnd,
	#superclass : #UMLNamedEntity,
	#instVars : [
		'entity',
		'multiplicity'
	],
	#category : #uUML
}

{ #category : #'instance creation' }
UMLEnd class >> entity: anUMLClass [

	^ self new entity: anUMLClass
]

{ #category : #'instance creation' }
UMLEnd class >> entity: anUMLClass multiplicity: aString [

	^ self new entity: anUMLClass; multiplicity: aString
]

{ #category : #accessing }
UMLEnd >> entity [
	^ entity
]

{ #category : #accessing }
UMLEnd >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
UMLEnd >> multiplicity [
	^ multiplicity
]

{ #category : #accessing }
UMLEnd >> multiplicity: anObject [
	multiplicity := anObject
]
