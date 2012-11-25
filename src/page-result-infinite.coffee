_ = require 'underscore'


###
The result of a db request containing used for paging
###
module.exports = class PageResultInfinite
  ###
  Initializes a new instance of page result.
  ###
  constructor: (@items = [], @totalCount = 0, @requestIndex, @nextIndex = null, @baseUrl = null) ->


  toRest: (baseUrl, actor) =>
    result =
      totalCount : @totalCount
      requestIndex : @requestIndex
      nextIndex : @nextIndex
      items : _.map( @items, (x) => if x.toRest then x.toRest(baseUrl, actor) else x)
    result


