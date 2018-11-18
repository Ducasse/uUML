Class {
	#name : #MUMLTest,
	#superclass : #TestCase,
	#instVars : [
		'lab',
		'student'
	],
	#category : #uUML
}

{ #category : #'tests associations' }
MUMLTest >> setUp [

	lab := UMLClass <~ 'Lab'
				instVar: 'topic'.
	
	student := UMLClass <~ 'Student'
					instVar: 'ID'.
	
]

{ #category : #'tests associations' }
MUMLTest >> testAssociationManyToMany [

	| follows |
	follows := UMLAssociation <~ 'enrolment'
						many: student toMany: lab.
				
	self assert: (follows endForName: lab name) entity name equals: 'Lab'.
	self assert: (follows endForName: lab name) multiplicity equals: '*'.
	
	self assert: (follows endForName: student name) entity name equals: 'Student'.			
	self assert: (follows endForName: student name) multiplicity equals: '*'.
	
	self assert: ((lab relationsWith: student name) includes: follows).	
	self assert: ((student relationsWith: lab name) includes: follows).	

	
	
						
]

{ #category : #'tests associations' }
MUMLTest >> testAssociationOneToMany [

	| follows |
	follows := UMLAssociation <~ 'enrolment'
						one: student toMany: lab.
				
	self assert: (follows endForName: lab name) entity name equals: 'Lab'.
	self assert: (follows endForName: lab name) multiplicity equals: '*'.
	
	self assert: (follows endForName: student name) entity name equals: 'Student'.			
	self assert: (follows endForName: student name) multiplicity equals: '1'.
	
	self assert: ((lab relationsWith: student name) includes: follows).	
	self assert: ((student relationsWith: lab name) includes: follows).	

	
	
						
]

{ #category : #'tests associations' }
MUMLTest >> testAssociationRangeAndLeast [ 

	| follows |
	"a student can only enrol in 6 to 8 labs and a lab requires at least 2 students"
	follows := UMLAssociation <~ 'enrolment'
						between: student and: lab;
						for: student atLeast: 2;
						for: lab range: (6 to: 8).
				
	self assert: (follows endForName: lab name) entity name equals: 'Lab'.
	self assert: (follows endForName: lab name) multiplicity equals: (6 to: 8).
	
	self assert: (follows endForName: student name) entity name equals: 'Student'.			
	self assert: (follows endForName: student name) multiplicity equals: '2..*'.
	
	self assert: ((lab relationsWith: student name) includes: follows).	
	self assert: ((student relationsWith: lab name) includes: follows).	

	
	
						
]

{ #category : #tests }
MUMLTest >> testDefineASimpleClass [

	| uUMLClass |
	uUMLClass := UMLClass named: 'ComixSerie'.
	uUMLClass instVar: 'name'.
	uUMLClass instVar: 'ongoing'.
	
	self assert: uUMLClass name equals: 'ComixSerie'.
	self assert: (uUMLClass includesVariable: 'name').
	self assert: (uUMLClass includesVariable: 'ongoing').
	self assert: uUMLClass variables asArray equals: #('name' 'ongoing').
	self assert: uUMLClass operations isEmpty.
	self assert: (uUMLClass printString beginsWith: 'u~ComixSerie')
]

{ #category : #tests }
MUMLTest >> testDefineASimpleClassHandlingDouble [

	| uUMLClass |
	uUMLClass := UMLClass named: 'ComixSerie'.
	uUMLClass instVar: 'name'.
	uUMLClass instVar: 'ongoing'.
	uUMLClass instVar: 'name'.
	
	self assert: (uUMLClass includesVariable: 'name').
	self assert: (uUMLClass includesVariable: 'ongoing').
	self assert: uUMLClass variables asArray equals: #('name' 'ongoing').
	
]

{ #category : #tests }
MUMLTest >> testDefineSimpleHierarchy [

	| root child |
	root := UMLClass <~ 'PRElement'
				instVar: 'contents'.
	
	child := UMLClass <~ 'PRParagraph'
				instVar: 'label'.
	
	child extends: root.
	self assert: (root includesSubclass: child).
	self assert: child superclass equals: root. 
	
	
	
]

{ #category : #tests }
MUMLTest >> testDefineSimpleHierarchyHandlingDouble [

	| root child |
	root := UMLClass <~ 'PRElement'
				instVar: 'contents'.
	
	child := UMLClass <~ 'PRParagraph'
				instVar: 'label'.
	
	child extends: root.
	child extends: root.
	self assert: root subclasses size equals: 1.
	self assert: child superclass equals: root. 
	
	
	
]

{ #category : #tests }
MUMLTest >> testDefineSimpleHierarchyHandlingDouble2 [

	| root child child2 |
	root := UMLClass <~ 'PRElement'
				instVar: 'contents'.
	
	child := UMLClass <~ 'PRParagraph'
				instVar: 'label'.
	
	child2 := UMLClass <~ 'PRLink'
				instVar: 'label'.
				
	child extends: root.
	child2 extends: root. 
	child extends: root.
	self assert: root subclasses size equals: 2.
	self assert: child superclass equals: root. 
	
	
	
]

{ #category : #'tests associations' }
MUMLTest >> testSimpleAssociation [ 

	| follows |
	follows := UMLAssociation <~ 'enrolment'.
	follows between: student and: lab.
	
	self assert: (follows endForName: lab name) entity name equals: 'Lab'.
	self assert: (follows endForName: student name) entity name equals: 'Student'.		
	
	self assert: ((lab relationsWith: student name) includes: follows).
	self assert: ((student relationsWith: lab name) includes: follows).
	

]
