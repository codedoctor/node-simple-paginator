// Generated by CoffeeScript 1.4.0
(function() {
  var PageResultInfinite, _,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  _ = require('underscore');

  /*
  The result of a db request containing used for paging
  */


  module.exports = PageResultInfinite = (function() {
    /*
      Initializes a new instance of page result.
    */

    function PageResultInfinite(items, totalCount, requestIndex, nextIndex, baseUrl) {
      this.items = items != null ? items : [];
      this.totalCount = totalCount != null ? totalCount : 0;
      this.requestIndex = requestIndex;
      this.nextIndex = nextIndex != null ? nextIndex : null;
      this.baseUrl = baseUrl != null ? baseUrl : null;
      this.toRest = __bind(this.toRest, this);

    }

    PageResultInfinite.prototype.toRest = function(baseUrl, actor) {
      var result,
        _this = this;
      result = {
        totalCount: this.totalCount,
        requestIndex: this.requestIndex,
        nextIndex: this.nextIndex,
        items: _.map(this.items, function(x) {
          if (x.toRest) {
            return x.toRest(baseUrl, actor);
          } else {
            return x;
          }
        })
      };
      return result;
    };

    return PageResultInfinite;

  })();

}).call(this);
