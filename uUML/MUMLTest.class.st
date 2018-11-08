Class {
	#name : #MUMLTest,
	#superclass : #TestCase,
	#category : #uUML
}

{ #category : #tests }
MUMLTest >> testDefineASimpleClass [

	| uUMLClass |
	uUMLClass := UMLClass named: 'ComixSerie'.
	uUMLClass instVar: 'name'.
	uUMLClass instVar: 'ongoing'.
	
	self assert: uUMLClass name equals: 'ComixSerie'.
	self assert: (uUMLClass includesVariable: 'name').
	self assert: (uUMLClass includesVariable: 'ongoing').
	self assert: uUMLClass variables asArray equals: #('name' 'ongoing') 
]
