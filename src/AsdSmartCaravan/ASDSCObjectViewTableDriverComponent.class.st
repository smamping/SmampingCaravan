Class {
	#name : #ASDSCObjectViewTableDriverComponent,
	#superclass : #ASDObjectViewTableBaseComponent,
	#instVars : [
		'labelBrokerIp',
		'labelDeviceName',
		'labelDeviceId',
		'labelAddEsp32Driver',
		'labelSelectDevices'
	],
	#category : #'AsdSmartCaravan-Components'
}

{ #category : #initialization }
ASDSCObjectViewTableDriverComponent >> initialize [

	super initialize.
	self id: 'tableDriver'.
	"asdTableCell"
	self labelDeviceId: 'Device Id'.
	self labelBrokerIp: 'Ip Adr. Broker'.
	self labelDeviceName: 'DeviceName'.
	self labelAddEsp32Driver: 'Esp32 Treiber'.
	self labelSelectDevices: 'Devices'
]

{ #category : #accessing }
ASDSCObjectViewTableDriverComponent >> labelAddEsp32Driver [

	^ labelAddEsp32Driver
]

{ #category : #accessing }
ASDSCObjectViewTableDriverComponent >> labelAddEsp32Driver: anObject [

	labelAddEsp32Driver := anObject
]

{ #category : #accessing }
ASDSCObjectViewTableDriverComponent >> labelBrokerIp [

	^ labelBrokerIp
]

{ #category : #accessing }
ASDSCObjectViewTableDriverComponent >> labelBrokerIp: anObject [

	labelBrokerIp := anObject
]

{ #category : #accessing }
ASDSCObjectViewTableDriverComponent >> labelDeviceId [

	^ labelDeviceId
]

{ #category : #accessing }
ASDSCObjectViewTableDriverComponent >> labelDeviceId: anObject [

	labelDeviceId := anObject
]

{ #category : #accessing }
ASDSCObjectViewTableDriverComponent >> labelDeviceName [

	^ labelDeviceName
]

{ #category : #accessing }
ASDSCObjectViewTableDriverComponent >> labelDeviceName: anObject [

	labelDeviceName := anObject
]

{ #category : #accessing }
ASDSCObjectViewTableDriverComponent >> labelSelectDevices [

	^ labelSelectDevices
]

{ #category : #accessing }
ASDSCObjectViewTableDriverComponent >> labelSelectDevices: anObject [

	labelSelectDevices := anObject
]

{ #category : #rendering }
ASDSCObjectViewTableDriverComponent >> renderDialog: html withModel: aModel [

	| driverTable |
	html form: [ 
		html mdlDialogTitle: self labelAddEsp32Driver.
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
ASDSCObjectViewTableDriverComponent >> renderDialogMenu: html [

	| newEsp32Driver |
	newEsp32Driver := ASDSCESP32Driver new.
	html mdlAnchorButton
		icon;
		id: html nextId;
		openDialogWithId: self rootDialogOpenId;
		onClickUpdateRootDialogWith: [ :r | 
			self renderDialog: r withModel: newEsp32Driver ];
		with: [ html mdlIcon: 'add' ]
]

{ #category : #rendering }
ASDSCObjectViewTableDriverComponent >> renderInnerContentOn: html [

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
								with: self labelBrokerIp.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelDeviceId.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelDeviceName.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelEdit.
							html mdlTableHeading
								nonNumerical;
								class: 'asdTableHeading';
								with: self labelSelectDevices  ] ].
			html tableBody with: [ "style: 'overflow: scroll;height: 400px;';"
				self list doWithIndex: [ :each :index | 
					html tableRow: [ 
						html mdlTableCell
							nonNumerical;
							class: 'asdTableCell';
							style: 'background-color: #0d1117; max-width: 20px;';
							with: each brokerIP.
						html mdlTableCell
							nonNumerical;
							class: 'asdTableCell';
							style: 'background-color: #0d1117; max-width: 20px;';
							with: each deviceIp.
						html mdlTableCell
							nonNumerical;
							class: 'asdTableCell';
							style: 'background-color: #0d1117; max-width: 20px;';
							with: each deviceName.
						html mdlTableCell
							nonNumerical;
							class: 'asdTableCell';
							style: 'background-color: #0d1117;';
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
							style: 'background-color: #0d1117;';
							with: [ 
								html mdlAnchorButton
									icon;
									id: html nextId;
									callback:[self session esp32Driver: each];
									with: [ html mdlIcon: 'edit' ] ] ] ] ] ]
]
