// Generated by CoffeeScript 1.4.0
(function() {
  var Button,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  module.exports.Button = Button = (function() {

    function Button(isSeparator, pageNumberForDisplay, isActive, linkPathSegments, baseUrl) {
      this.isSeparator = isSeparator != null ? isSeparator : false;
      this.pageNumberForDisplay = pageNumberForDisplay;
      this.isActive = isActive != null ? isActive : false;
      this.linkPathSegments = linkPathSegments != null ? linkPathSegments : [];
      this.baseUrl = baseUrl;
      this.url = __bind(this.url, this);

    }

    /*
      Returns the url, if baseUrl is defined, and only works with query free urls for now.
      Segment isn't urlencoded either.
    */


    Button.prototype.url = function() {
      var res, segment, sep, _i, _len, _ref;
      if (!this.baseUrl) {
        return "";
      }
      res = this.baseUrl;
      sep = "?";
      _ref = this.linkPathSegments;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        segment = _ref[_i];
        res += sep;
        res += segment;
        sep = "&";
      }
      return res;
    };

    return Button;

  })();

}).call(this);
