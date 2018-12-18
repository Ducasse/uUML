Class {
	#name : #BaselineOfuUML,
	#superclass : #BaselineOf,
	#category : #BaselineOfuUML
}

{ #category : #baseline }
BaselineOfuUML >> baseline: spec [
	<baseline>
	
	spec 
		baseline: 'ContainersUniqueOrdered' with: [
				spec repository: 'github://Ducasse/Containers-UniqueOrdered:v1.0.0/src'
				].	
	spec 
		baseline: 'ContainersOrderedMultiMap' with: [
				spec repository: 'github://Ducasse/Containers-OrderedMultimap:v1.0.0/src'
				].				
	spec 
		package: #'uUML' 
		with: [ spec requires: #(#'ContainersUniqueOrdered' #'ContainersOrderedMultiMap') ]
]
