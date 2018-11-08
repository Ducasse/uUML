Class {
	#name : #BaselineOfuUML,
	#superclass : #BaselineOf,
	#category : #BaselineOfuUML
}

{ #category : #baseline }
BaselineOfuUML >> baseline: spec [
	<baseline>
	
	spec 
		baseline: 'UniqueOrdered' with: [
				spec repository: 'github://Ducasse/Containers-UniqueOrdered/src'
				].	
	spec 
		package: #'uUML' 
		with: [ spec requires: #(#'UniqueOrdered') ]
]
