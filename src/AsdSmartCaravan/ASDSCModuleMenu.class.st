Class {
	#name : 'ASDSCModuleMenu',
	#superclass : 'WAComponent',
	#instVars : [
		'moduleTasks'
	],
	#category : 'AsdSmartCaravan-Components',
	#package : 'AsdSmartCaravan',
	#tag : 'Components'
}

{ #category : 'accessing' }
ASDSCModuleMenu >> moduleTasks [

		^ Array
		  with: ASDSCInstallModuleTaskLicht
		  with: ASDSCInstallModuleTaskHeizung
		  with: ASDSCInstallModuleTaskTuerVerieglung
		  "with: ASDSCInstallModuleTaskWebCam"
]

{ #category : 'rendering' }
ASDSCModuleMenu >> renderContentOn: html [

	html mdlCardActions
		border;
		with: [ 
			html mdlList: [ 
					self moduleTasks do: [ :each | 
							html mdlListItem: [ 
									html mdlListPrimaryContent: [ 
											html mdlListItemTextBody: each label ].
									html mdlListSecondaryContent: [ 
											html mdlListItemSecondaryAction with: [ 
													html anchor
														callback: [ self show: each new ];
														with: [ 
															html mdlButton
																fab;
																miniFab;
																with: [ html mdlIcon: 'keyboard_arrow_right' ] ] ] ] ] ] ] ]
]
