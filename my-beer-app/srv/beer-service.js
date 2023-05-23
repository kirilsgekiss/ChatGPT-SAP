const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
  this.after('READ', 'Beer', beersData => {
    const beers = Array.isArray(beersData) ? beersData : [beersData];
    beers.forEach(beer => {
      if (beer.rating === 1) {
        beer.criticality = 1;
      } else if (beer.rating === 2) {
        beer.criticality = 2;
      } else if (beer.rating === 3) {
        beer.criticality = 2;
      } else if (beer.rating === 4) {
        beer.criticality = 3;
      } else if (beer.rating === 5) {
        beer.criticality = 3;
      }
    });
  });
});