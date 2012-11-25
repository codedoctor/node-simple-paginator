module.exports.Button = class Button
  constructor: (@isSeparator = false, @pageNumberForDisplay, @isActive = false, @linkPathSegments = [], @baseUrl) ->

  ###
  Returns the url, if baseUrl is defined, and only works with query free urls for now.
  Segment isn't urlencoded either.
  ###
  url: () =>
    return "" unless @baseUrl
    res = @baseUrl

    sep = "?"
    for segment in @linkPathSegments
      res += sep
      res += segment
      sep = "&"
    res