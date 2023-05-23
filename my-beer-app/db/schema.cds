namespace my.beerapp;

entity Beer {
  key ID: UUID @cds.autoignore;
  name: String(100) @mandatory;
  rating: Integer @mandatory;
  brewery: Association to Brewery @mandatory;
  beerType: Association to BeerType @mandatory;
  criticality : Integer;
}

entity Brewery {
  key ID: Integer;
  name: String(100) @mandatory;
  yearOfFoundation: Integer @mandatory;
}

entity BeerType {
  key ID: Integer;
  name: String(100) @mandatory;
}
