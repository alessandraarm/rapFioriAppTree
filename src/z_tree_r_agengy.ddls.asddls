@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agency'
define root view entity Z_TREE_R_AGENGY
  as select from /dmo/agency   as Agency
    inner join   /dmo/travel_m as Travel on Travel.agency_id = Agency.agency_id
{
  key    Agency.agency_id     as AgencyID,
  key    Travel.travel_id     as TravelID,
         Agency.name          as Name,
         Travel.description   as Description,
         @Semantics.amount.currencyCode: 'CurrencyCode'
         Travel.total_price   as TotalPrice,
         Travel.currency_code as CurrencyCode
}
