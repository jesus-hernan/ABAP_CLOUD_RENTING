@AbapCatalog.sqlViewName: 'ZTBRANDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Brands'
define view ztcds_brands
  as select from ztrent_brands
{
       //ztrent_brands
  key  marca as Marca,
  key  url   as Imagen
}
