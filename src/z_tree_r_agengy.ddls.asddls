@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agency'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_TREE_R_AGENGY
  as select from /dmo/agency   as Agency
    inner join   /dmo/travel_m as Travel on Travel.agency_id = Agency.agency_id
  //   inner join   Z_TREE_R_AGENCY_AUX as AgencyAux on AgencyAux.AgencyID = Agency.agency_id
{
  key    concat(Agency.agency_id, Travel.travel_id) as Id,
         Agency.agency_id                           as AgencyID,
         Travel.travel_id                           as TravelID,
         Agency.name                                as Name,
         Travel.description                         as Description,
         @Semantics.amount.currencyCode: 'CurrencyCode'
         Travel.total_price                         as TotalPrice,
         Travel.currency_code                       as CurrencyCode
}

union all select from /dmo/agency as AgencyAux
{
  key    AgencyAux.agency_id as Id,
         AgencyAux.agency_id as AgencyID,
         cast('00000000' as /dmo/travel_id)            as TravelID,
         AgencyAux.name      as Name,
         ''                  as Description,
         cast('0.00' as /dmo/total_price)   as TotalPrice,
         cast('' as /dmo/currency_code)                  as CurrencyCode
}
