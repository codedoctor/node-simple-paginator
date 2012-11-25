_ = require 'underscore'
Button = require './button'


###
The result of a db request containing used for paging
###
module.exports = class PageResult
  ###
  Initializes a new instance of page result.
  ###
  constructor: (@items = [], @totalCount = 0, @requestOffset = 0, @requestCount = 25, @baseUrl = null) ->
    #console.log "PAGERESULT: #{totalCount} #{requestOffset} #{requestCount}"
    #console.log "CURRENTPAGE: #{@currentPage()}"
    #@totalCount = 200
    #@requestOffset = 3 * @requestCount
  ###
  Paging with requestCount 5, lifeStreaming requestOffset here:
  0 -> 0
  5 -> 1
  10 -> 2
  ###
  currentPage: () =>
    Math.floor(@requestOffset / @requestCount)

  firstPage: () =>
    0

  ###
  Last Page - Paging with requestCount = 5
  0 .. -1
  1 .. 0
  2 .. 0
  3 .. 0
  4 .. 0
  5 .. 0
  6 .. 1
  7 .. 1
  8 .. 1
  ###
  lastPage: () =>
    @numberOfPages() - 1

  ###
  Paging with requestCount = 5
  0 .. 0
  1 .. 1
  2 .. 1
  3 .. 1
  4 .. 1
  5 .. 1
  6 .. 2
  7 .. 2
  8 .. 2
  ###
  numberOfPages: () =>
    Math.floor((@totalCount - 1) / @requestCount) + 1


  pageToString: (page) =>
    "#{page + 1}"

  currentPageAsString: () =>
    @pageToString @currentPage()

  nextButtonEnabled: () =>
    @numberOfPages() > 1 && @currentPage() < @lastPage()

  prevButtonEnabled: () =>
    @numberOfPages() > 1 && @currentPage() > 0

  nextButton: () =>
    nextPage = @currentPage() + 1
    nextPage = @firstPage() if nextPage > @lastPage()
    @createButton(nextPage)

  prevButton: () =>
    prevPage = @currentPage() - 1
    prevPage = @lastPage() if prevPage < 0
    @createButton(prevPage)

  createButton:(page) =>
    new exports.Button(false, @pageToString(page), @currentPage() == page, ["page=#{page+1}", "count=#{@requestCount}", "offset=#{page * @requestCount}"], @baseUrl)

  directButtons: () =>
    result = []

    if @numberOfPages() <= 9
      for page in [0 .. @numberOfPages() - 1]
        result.push @createButton(page)
    else
      # Add first page.
      result.push @createButton(0)

      startIndex = @currentPage() - 3
      startIndex = 1 if startIndex < 1 # ensure that we start with 2, if necessary
      result.push new exports.Button(true) if startIndex > 1 # add a separator

      endIndex = startIndex + 6
      endIndex = @lastPage - 1 if endIndex >= @lastPage()

      for page in [startIndex .. endIndex]
        result.push @createButton(page)

      result.push new exports.Button(true) if endIndex < @lastPage() - 1 # add a separator

      # Add last page
      result.push @createButton(@lastPage())

    result

  toRest: (baseUrl, actor) =>
    result =
      totalCount : @totalCount
      requestOffset : @requestOffset
      requestCount : @requestCount
      items : _.map( @items, (x) => if x.toRest then x.toRest(baseUrl, actor) else x)
    result


