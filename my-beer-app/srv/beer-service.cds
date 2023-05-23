using { my.beerapp as my}  from '../db/schema';

@path: 'service/beer'
service BeerService {
  entity Beer as projection on my.Beer;
    annotate Beer with @odata.draft.enabled;
  entity Brewery as projection on my.Brewery;
    annotate Brewery with @odata.draft.enabled;
  entity BeerType as projection on my.BeerType;
    annotate BeerType with @odata.draft.enabled;
}