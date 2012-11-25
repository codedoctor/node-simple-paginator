should = require 'should'
_ = require 'underscore'


describe 'WHEN working with paginator', ->

  esd = require '../lib/index'
  PageResult = esd.PageResult

  it 'should not be null', ->
    should.exist esd

  describe 'WHEN initiating a new PageResult instance', ->
    pg = new PageResult([1, 2, 3, 4, 5, 6, 7], 9, 2, 7)
    it 'should have set the instance variables', ->
      pg.should.have.property 'items'
      pg.should.have.property 'totalCount', 9
      pg.should.have.property 'requestOffset', 2
      pg.should.have.property 'requestCount', 7


  describe 'WHEN accessing a PageResult object with 0 elements', ->
    pg = new PageResult([], 0, 0, 7)

    it 'current page should be -1', ->
      pg.currentPage().should.eql(0)

    it 'first page should be 0', ->
      pg.firstPage().should.eql(0)

    it 'last page should be -1', ->
      pg.lastPage().should.eql(-1)

    it 'number of pages should be 0', ->
      pg.numberOfPages().should.eql(0)

    it 'current page as string should be 0 (-1 + 1)', ->
      pg.currentPageAsString().should.eql("1")

    it 'should disable prev button', ->
      pg.prevButtonEnabled().should.eql(false)

    it 'should disable next button', ->
      pg.nextButtonEnabled().should.eql(false)


  describe 'WHEN accessing a PageResult object with 1 elements', ->
    pg = new PageResult([1], 1, 0, 7)

    it 'current page should be 0', ->
      pg.currentPage().should.eql(0)

    it 'first page should be 0', ->
      pg.firstPage().should.eql(0)

    it 'last page should be 0', ->
      pg.lastPage().should.eql(0)

    it 'number of pages should be 1', ->
      pg.numberOfPages().should.eql(1)

    it 'current page as string should be 1 (0 + 1)', ->
      pg.currentPageAsString().should.eql("1")

    it 'should disable prev button', ->
      pg.prevButtonEnabled().should.eql(false)

    it 'should disable next button', ->
      pg.nextButtonEnabled().should.eql(false)

  describe 'WHEN accessing a PageResult object [1, 2, 3, 4, 5, 6], TotalCount: 6, RequestOffset: 0, RequestCount: 7', ->
    pg = new PageResult([1, 2, 3, 4, 5, 6], 6, 0, 7)

    it 'current page should be 0', ->
      pg.currentPage().should.eql(0)

    it 'first page should be 0', ->
      pg.firstPage().should.eql(0)

    it 'last page should be 0', ->
      pg.lastPage().should.eql(0)

    it 'number of pages should be 1', ->
      pg.numberOfPages().should.eql(1)

    it 'current page as string should be 1 (0 + 1)', ->
      pg.currentPageAsString().should.eql("1")

    it 'should disable prev button', ->
      pg.prevButtonEnabled().should.eql(false)

    it 'should disable next button', ->
      pg.nextButtonEnabled().should.eql(false)


  describe 'WHEN accessing a PageResult object [1, 2, 3, 4, 5, 6, 7], TotalCount: 7, RequestOffset: 0, RequestCount: 7', ->
    pg = new PageResult([1, 2, 3, 4, 5, 6, 7], 7, 0, 7)

    it 'current page should be 0', ->
      pg.currentPage().should.eql(0)

    it 'first page should be 0', ->
      pg.firstPage().should.eql(0)

    it 'last page should be 0', ->
      pg.lastPage().should.eql(0)

    it 'number of pages should be 1', ->
      pg.numberOfPages().should.eql(1)

    it 'current page as string should be 1 (0 + 1)', ->
      pg.currentPageAsString().should.eql("1")

    it 'should disable prev button', ->
      pg.prevButtonEnabled().should.eql(false)

    it 'should disable next button', ->
      pg.nextButtonEnabled().should.eql(false)


  describe 'WHEN accessing a PageResult object [1, 2], TotalCount: 8, RequestOffset: 1 * 7, RequestCount: 7', ->
    pg = new PageResult([1, 2], 8, 1 * 7, 7)

    it 'current page should be 1', ->
      pg.currentPage().should.eql(1)

    it 'first page should be 0', ->
      pg.firstPage().should.eql(0)

    it 'last page should be 0', ->
      pg.lastPage().should.eql(1)

    it 'number of pages should be 2', ->
      pg.numberOfPages().should.eql(2)

    it 'current page as string should be 2 (1 + 1)', ->
      pg.currentPageAsString().should.eql("2")

    it 'should enable prev button', ->
      pg.prevButtonEnabled().should.eql(true)

    it 'should disable next button', ->
      pg.nextButtonEnabled().should.eql(false)


  describe 'WHEN accessing a PageResult object [1, 2], TotalCount: 9, RequestOffset: 1 * 7, RequestCount: 7', ->
    pg = new PageResult([1, 2], 9, 1 * 7, 7)

    it 'current page should be 1', ->
      pg.currentPage().should.eql(1)

    it 'first page should be 0', ->
      pg.firstPage().should.eql(0)

    it 'last page should be 0', ->
      pg.lastPage().should.eql(1)

    it 'number of pages should be 2', ->
      pg.numberOfPages().should.eql(2)

    it 'current page as string should be 2 (1 + 1)', ->
      pg.currentPageAsString().should.eql("2")

    it 'should enable prev button', ->
      pg.prevButtonEnabled().should.eql(true)

    it 'should disable next button', ->
      pg.nextButtonEnabled().should.eql(false)
