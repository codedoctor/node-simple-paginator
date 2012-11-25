PAGING_SIZE = 25

parseMyInt = (someValue, def = 0) ->
  someValue = def unless someValue
  try
    return parseInt(someValue.toString(), 10)
  catch e
    return def

module.exports = paginatorSetup = (opts = {}) ->
  paginatorHandle = (req, res, next) ->
    req.paginated = {}
    req.paginated.count = parseMyInt(req.query['count'])
    req.paginated.page = parseMyInt(req.query['page'], 1) - 1
    req.paginated.offset = parseMyInt(req.query['offset'])

    #console.log "MIDDLEWARE: REQ.QUERY: #{JSON.stringify(req.query)} PAGINATED #{JSON.stringify(req.paginated)}"
    req.paginated.page = 0 if req.paginated.page < 0 # I wish there would be a math max...
    req.paginated.offset = 0 if req.paginated.offset < 0
    req.paginated.count = PAGING_SIZE if req.paginated.count < 1 || req.paginated.count > 200

    next()
  return paginatorHandle