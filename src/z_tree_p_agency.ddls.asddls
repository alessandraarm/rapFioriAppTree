@EndUserText.label: 'Agency - Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI: {
 headerInfo: { typeName: 'Agency', typeNamePlural: 'Agencies', title: { type: #STANDARD, value: 'AgencyID' } } }

@Search.searchable: true

define root view entity Z_TREE_P_AGENCY
  as projection on Z_TREE_R_AGENGY
{
      @UI.hidden: true
  key Id       as Id,

      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10 } ],
          selectionField: [ { position: 10 } ] }
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID'  } }]

      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyID as AgencyID,


      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ],
      identification: [ { position: 20, label: 'Travel ID [1,...,99999999]' } ] }
      @Search.defaultSearchElement: true
      TravelID,

      Name     as AgencyName,

      @UI: {
              lineItem:       [ { position: 30, importance: #HIGH } ],
              identification: [ { position: 30, label: 'Description' } ] }
      Description,

      @UI: {
      lineItem:       [ { position: 40, importance: #MEDIUM } ],
      identification: [ { position: 40, label: 'Total Price' } ] }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode


}
