Class {
	#name : #ASDSCObjectViewTableDevicesComponent,
	#superclass : #ASDObjectViewTableBaseComponent,
	#instVars : [
		'labelDeviceBezeichnung',
		'labelPinNr',
		'labelSelectDevices',
		'labelDevice',
		'labelTyp',
		'addTask'
	],
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #rendering }
ASDSCObjectViewTableDevicesComponent >> _renderDialog: html [

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
ASDSCObjectViewTableDevicesComponent >> addTask [

	^ addTask
]

{ #category : #accessing }
ASDSCObjectViewTableDevicesComponent >> addTask: anObject [

	addTask := anObject
]

{ #category : #hooks }
ASDSCObjectViewTableDevicesComponent >> children [

	^ { self addTask  }
]

{ #category : #initialization }
ASDSCObjectViewTableDevicesComponent >> initialize [

	super initialize.
	self id: 'tableDevices'.
	"asdTableCell"
	labelDeviceBezeichnung := 'Bezeichnung'.
	labelPinNr := 'Pin Nr.'.
	labelSelectDevices := 'Endgerät '.
	labelTyp := 'Typ'.
	
	self addTask: ASDSCInstallDevicesTask new.
	self addTask addDecoration: ASDCardDecoration new
]

{ #category : #accessing }
ASDSCObjectViewTableDevicesComponent >> labelDevice [

	^ labelDevice
]

{ #category : #accessing }
ASDSCObjectViewTableDevicesComponent >> labelDevice: anObject [

	labelDevice := anObject
]

{ #category : #accessing }
ASDSCObjectViewTableDevicesComponent >> labelDeviceBezeichnung [

	^ labelDeviceBezeichnung
]

{ #category : #accessing }
ASDSCObjectViewTableDevicesComponent >> labelPinNr [

	^ labelPinNr
]

{ #category : #accessing }
ASDSCObjectViewTableDevicesComponent >> labelSelectDevices [

	^ labelSelectDevices
]

{ #category : #accessing }
ASDSCObjectViewTableDevicesComponent >> labelTyp [

	^ labelTyp
]

{ #category : #rendering }
ASDSCObjectViewTableDevicesComponent >> renderDialog: html withModel: aModel [

	| driverTable |
	html form: [ 
		html mdlDialogTitle: self labelDevice.
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
ASDSCObjectViewTableDevicesComponent >> renderDialogMenu: html [

	| newEsp32Driver |
	html mdlAnchorButton
		icon;
		id: html nextId;
		callback:[self show: addTask ]; "openDialogWithId: self rootDialogOpenId;
		onClickUpdateRootDialogWith: [ :r | self renderDialog: r ];"
		with: [ html mdlIcon: 'add' ]
]

{ #category : #rendering }
ASDSCObjectViewTableDevicesComponent >> renderInnerContentOn: html [

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
								with: self labelTyp.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelDeviceBezeichnung.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelPinNr.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelEdit.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelSelectDevices ] ].
			html tableBody with: [ "style: 'overflow: scroll;height: 400px;';"
				self list doWithIndex: [ :each :index | 
					index odd
						ifTrue: [ rowColor := 'background-color: #3f7ba4;' ]
						ifFalse: [ rowColor := 'background-color: #478fb7;' ].
					html tableRow
						style: rowColor;
						with: [ 
							html mdlTableCell
								nonNumerical;
								class: 'asdTableCell';
								style: ' max-width: 20px;';
								with: each type.
							html mdlTableCell
								nonNumerical;
								class: 'asdTableCell';
								style: ' max-width: 20px;';
								with: each bez.
							html mdlTableCell
								nonNumerical;
								class: 'asdTableCell';
								style: ' max-width: 20px;';
								with: each pinNr.
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

{ #category : #rendering }
ASDSCObjectViewTableDevicesComponent >> renderSelectModelOn: html [

	
	html select
		list: self deviceSubs;
		titles: [ :each | 'Title: ' , each greaseString ];
		selected: self selected;
		callback: [ :v | self selected: v ]
]
