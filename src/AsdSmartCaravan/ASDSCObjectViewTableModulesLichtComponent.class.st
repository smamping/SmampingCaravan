Class {
	#name : #ASDSCObjectViewTableModulesLichtComponent,
	#superclass : #ASDObjectViewTableBaseComponent,
	#instVars : [
		'labelModuleBezeichnung',
		'labelModuleTyp',
		'addTask',
		'labelSelectModules'
	],
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #rendering }
ASDSCObjectViewTableModulesLichtComponent >> _renderDialog: html [

	| tmpDevices devicesTable selected selectedDevice deviceSubs selectedIndex |
	tmpDevices := ASDSCDevice allSubclasses reject: #isAbstract.
	
	deviceSubs := tmpDevices collect: [ :each | each type ].
	html form: [ 
		html mdlDialogTitle: self labelDevice.
		html mdlDialogContent: [ 
			html render: ((MDLSelectWidget
					  possibilities: deviceSubs
					  inputLabel: 'Wähle ein Endgerät'
					  labelBlock: #asString
					  callback: [ :input | selected := input ]
					  selectedObject: (deviceSubs at: 4)
					  tooltip: 'description'
					  sortBlock: [ :a :b | a <= b ])
					 entryTooltip: [ :number | 'Choose number: ' ];
					 customizationBlock: [ :textField :renderer | 
						 textField onChange:
								 (html jQuery ajax serializeThis onComplete:
										  ((html jQuery class: 'mdl-dialog__title') load html: [ 
												   :canvas | 
												   canvas text: 'Endgerät: ' , selected type asString ])) ];
					 yourself).

			tmpDevices
				detect: [ :each | each type = selected ]
				ifFound: [ :class | selectedDevice := class ].
			Transcript show: 'selected: ' , selectedDevice type asString.
			html render: (ASDSCDevicesForm withModel: selectedDevice new) ].
		html mdlDialogActions: [ 
			html mdlButton
				id: self rootDialogCloseId;
				bePush;
				onClick: (html jQuery ajax
						 serializeForm;
						 callback: [ "serializeForm;"
							 self session model storeObject: selected.
							 devicesTable := ASDSCObjectViewTableDevicesComponent 
								                 withList: self session model devices ];
						 onComplete: ((html jQuery id: self id) load
								  html: [ :ajaxHtml | ajaxHtml render: devicesTable ];
								  onComplete: 'componentHandler.upgradeElements(this);' js));
				with: 'Accept'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ]
]

{ #category : #accessing }
ASDSCObjectViewTableModulesLichtComponent >> addTask [

	^ addTask
]

{ #category : #accessing }
ASDSCObjectViewTableModulesLichtComponent >> addTask: anObject [

	addTask := anObject
]

{ #category : #hooks }
ASDSCObjectViewTableModulesLichtComponent >> children [

	^ { self addTask  }
]

{ #category : #initialization }
ASDSCObjectViewTableModulesLichtComponent >> initialize [

	super initialize.
	self id: 'tableModules'.
	"asdTableCell"
	labelModuleBezeichnung := 'Bezeichnung'.
	labelModuleTyp := 'Typ'.

	self addTask: ASDSCInstallModuleTaskLicht new
]

{ #category : #accessing }
ASDSCObjectViewTableModulesLichtComponent >> labelModuleBezeichnung [

	^ labelModuleBezeichnung
]

{ #category : #accessing }
ASDSCObjectViewTableModulesLichtComponent >> labelModuleBezeichnung: anObject [

	labelModuleBezeichnung := anObject
]

{ #category : #accessing }
ASDSCObjectViewTableModulesLichtComponent >> labelModuleTyp [

	^ labelModuleTyp
]

{ #category : #accessing }
ASDSCObjectViewTableModulesLichtComponent >> labelModuleTyp: anObject [

	labelModuleTyp := anObject
]

{ #category : #accessing }
ASDSCObjectViewTableModulesLichtComponent >> labelSelectModules [

	^ labelSelectModules
]

{ #category : #accessing }
ASDSCObjectViewTableModulesLichtComponent >> labelSelectModules: anObject [

	labelSelectModules := anObject
]

{ #category : #rendering }
ASDSCObjectViewTableModulesLichtComponent >> renderDialog: html withModel: aModel [

	| driverTable |
	html form: [ 
		html mdlDialogTitle: self labelModuleBezeichnung.
		html mdlDialogContent: [ 
			html render: (ASDSCEsp32DriverForm withModel: aModel) ].
		html mdlDialogActions: [ 
			html mdlButton
				id: self rootDialogCloseId;
				bePush;
				onClick: (html jQuery ajax
						 serializeForm;
						 callback: [ "serializeForm;"
							 self session model storeObject: aModel.
							 driverTable := ASDSCObjectViewTableDriverComponent withList:
									                self session model esp32Drivers ];
						 onComplete: ((html jQuery id: self id) load
								  html: [ :ajaxHtml | ajaxHtml render: driverTable ];
								  onComplete: 'componentHandler.upgradeElements(this);' js));
				with: 'Accept'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ] ]
]

{ #category : #rendering }
ASDSCObjectViewTableModulesLichtComponent >> renderDialogMenu: html [

	
	html mdlAnchorButton
		icon;
		id: html nextId;
		callback: [ self show: addTask ];
		"openDialogWithId: self rootDialogOpenId;
		onClickUpdateRootDialogWith: [ :r | self renderDialog: r ];"
		with: [ html mdlIcon: 'add' ]
]

{ #category : #rendering }
ASDSCObjectViewTableModulesLichtComponent >> renderInnerContentOn: html [

	| rowColor |
	html mdlTable
		shadow: 0;
		with: [ 
			html tableHead: [ 
					html tableRow
						style: 'background-color: #161b22; ';
						with: [ 
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelModuleTyp.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelModuleBezeichnung.

							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelEdit.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelSelectModules ] ].
			html tableBody with: [ "style: 'overflow: scroll;height: 400px;';"
				self list doWithIndex: [ :each :index | 
					
					html tableRow
						style: rowColor;
						with: [ 
							html mdlTableCell
								nonNumerical;
								class: 'asdTableCell';
								
								with: each type.
							html mdlTableCell
								nonNumerical;
								class: 'asdTableCell';
								
								with: each bez.

							html mdlTableCell
								nonNumerical;
								class: 'asdTableCell';
								with: [ 
									html mdlAnchorButton
										icon;
										id: html nextId;
										openDialogWithId: self rootDialogOpenId;
										onClickUpdateRootDialogWith: [ :r | 
											self renderDialog: r withModel: each ];
										with: [ html mdlIcon: 'edit' ] ].
							html mdlTableCell
								nonNumerical;
								class: 'asdTableCell';
								with: [ 
									html mdlAnchorButton
										id: html nextId;
										callback: [ self session rootComponent goToEditModuleView ];
										with: 'Modul' ] ] ] ] ]
]
