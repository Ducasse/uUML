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
				spec repository: 'github://Ducasse/Containers-UniqueOrdered/src'
				].	
	spec 
		baseline: 'ContainersOrderedMultiMap' with: [
				spec repository: 'github://Ducasse/Containers-OrderedMultimap/src'
				].				
	spec 
		package: #'uUML' 
		with: [ spec requires: #(#'ContainersUniqueOrdered' #'ContainersOrderedMultiMap') ]
]
