Class {
	#name : #UMLNamedEntity,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #uUML
}

{ #category : #'instance creation' }
UMLNamedEntity class >> <~ aString [ 
	^ self new name: aString ; yourself
]

{ #category : #'instance creation' }
UMLNamedEntity class >> named: aString [ 
	^ self new name: aString ; yourself
]

{ #category : #accessing }
UMLNamedEntity >> name [
	^ name
]

{ #category : #accessing }
UMLNamedEntity >> name: aString [ 
	name := aString
]
