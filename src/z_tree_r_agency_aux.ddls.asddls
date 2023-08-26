@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
define root view entity Z_TREE_R_AGENCY_AUX
  as select from /dmo/agency   as Agency
  
{
  key       Agency.agency_id    ,
            0                    as TravelID,
            Agency.name          
}
