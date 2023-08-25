@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
define root view entity Z_TREE_R_TRAVEL
  as select from /dmo/travel_m as Travel
{
  key travel_id     as TravelID,
      agency_id     as AgencyID,
      description   as Description,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      currency_code as CurrencyCode
}
