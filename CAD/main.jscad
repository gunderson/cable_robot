(function(f){if(typeof exports==="object"&&typeof module!=="undefined"){module.exports=f()}else if(typeof define==="function"&&define.amd){define([],f)}else{var g;if(typeof window!=="undefined"){g=window}else if(typeof global!=="undefined"){g=global}else if(typeof self!=="undefined"){g=self}else{g=this}g.window = f()}})(function(){var define,module,exports;return (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
"use strict";

function ballBearing() {
	var id = arguments.length <= 0 || arguments[0] === undefined ? 3 : arguments[0];
	var od = arguments.length <= 1 || arguments[1] === undefined ? 10 : arguments[1];
	var width = arguments.length <= 2 || arguments[2] === undefined ? 4 : arguments[2];
	var lip = arguments.length <= 3 || arguments[3] === undefined ? 1 : arguments[3];
	var lipDepth = arguments.length <= 4 || arguments[4] === undefined ? 0.2 : arguments[4];
	var $fn = arguments.length <= 5 || arguments[5] === undefined ? 30 : arguments[5];

	var ir = id * 0.5;
	var or = od * 0.5;
	var hw = width * 0.5;

	return CSG.rotate_extrude({ fn: 200 }, CSG.polygon({ points: [[ir, -hw], [ir + lip, -hw], [ir + lip, -(hw - lipDepth)], [or - lip, -(hw - lipDepth)], [or - lip, -hw], [or, -hw], [or, hw], [or - lip, hw], [or - lip, hw - lipDepth], [ir + lip, hw - lipDepth], [ir + lip, hw], [ir, hw]] }));
}

module.exports = { ballBearing: ballBearing };

},{}],2:[function(require,module,exports){
'use strict';

var _ballBearingJscad = require('./components/ballBearing.jscad.es6');

var _ballBearingJscad2 = _interopRequireDefault(_ballBearingJscad);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function main() {
	return (0, _ballBearingJscad2.default)();
}

},{"./components/ballBearing.jscad.es6":1}]},{},[2])(2)
});