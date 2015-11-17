// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require d3
//= require_tree .
//

// window.setInterval('ajaxcall()', 15000);
//
// function ajaxcall() {
//   responce = $.ajax({
//     url: "/refresh/",
//     url: "/teacher_refresh/",
//   });
// }

// var defaulttext = $('.defualt-text').text();
//
// $('.selectDefault').text(defaulttext);
//
// $('.selectBox').on('change',function(){
//    var defaulttext2 = $('.selectBox').find(":selected").text();
//     $('.selectDefault').text(defaulttext2);
// });

function teacher_ajaxcall() {
  response = $.ajax({
    url: "/teacher_refresh/",
  });
}

$(function t() {
  if ($("#teacher_refresh").length > 0) {
    window.setInterval('teacher_ajaxcall()', 15000);
  }
});
//
// function student_ajaxcall() {
//   response = $.ajax({
//     url: "/refresh/",
//   });
// }
//
// $(function s() {
//   if ($("#student_button").length > 0) {
//     window.setInterval('student_ajaxcall()', 15000);
//   }
// });

function highlight() {
  $(':input.score').click(function() {
    $('input.score').removeClass("blue");
    $(this).addClass("blue");
  });
}

$(highlight);

function drawTopicsGraph() {

  if ($("#topics-graph").length > 0) {
    //D3 Script

    var margin = {top: 20, right: 20, bottom: 30, left: 50},
        width = 960 - margin.left - margin.right,
        height = 500 - margin.top - margin.bottom;


    var parseDate = d3.time.format("%Y-%m-%dT%H:%M:%S.%LZ").parse;

    var x = d3.time.scale()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left")
        .ticks(7);

    var area = d3.svg.area()
        .x(function(d) { return x(d.date); })
        .y0(height)
        .y1(function(d) { return y(d.close); });

    var line = d3.svg.line()
        .x(function(d) { return x(d.date); })
        .y(function(d) { return y(d.close); });

    var svg = d3.select("#topics-graph")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
      .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    data.forEach(function(d) {
      d.date = parseDate(d.date);
      d.close = +d.close;
    });

    x.domain(d3.extent(data, function(d) { return d.date; }));
    y.domain([0, 6]);

    svg.append("path")
        .datum(data)
        .attr("class", "area")
        .attr("d", area);

    svg.append("path")
      .datum(data)
      .attr("class", "top-line")
      .attr("d", line);

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis);

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)


  }
}

$(drawTopicsGraph);
