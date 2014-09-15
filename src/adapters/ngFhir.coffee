mkFhir = require('../fhir')

implementXhr = ($http)->
  (q)->
    p = $http(q)
    p.success(q.success) if q.success
    p.error(q.error) if q.error
    p

angular.module('ng-fhir', ['ng'])
angular.module('ng-fhir').provider '$fhir', ()->
  prov =
    $get: ($http)->
      adapter = {http: implementXhr($http)}
      fhir = mkFhir(prov, adapter)

      search: fhir.search
      conformance: fhir.conformance
      profile: fhir.profile
      transaction: fhir.transaction
      history: fhir.history
      create: fhir.create
      read: fhir.read
      update: fhir.update
      delete: fhir.delete
      vread: fhir.vread
