$(function () {

  'use strict';

  var $distpicker = $('#distpicker');

  $distpicker.distpicker({
    province: '福建省',
    city: '厦门市',
    district: '思明区'
  });

  $('#reset').click(function () {
    $distpicker.distpicker('reset');
  });

  $('#reset-deep').click(function () {
    $distpicker.distpicker('reset', true);
  });

  $('#destroy').click(function () {
    $distpicker.distpicker('destroy');
  });

  $('#distpicker1').distpicker();

  $('#distpicker2').distpicker({
    province: '---- 所在省 ----',
    city: '---- 所在市 ----',
    district: '---- 所在区 ----'
  });

  $('#distpicker3').distpicker({
    province: '',
    city: '',
    district: ''
  });

  $('#distpicker4').distpicker({
    placeholder: false
  });

  $('#distpicker5').distpicker({
    autoSelect: false
  });

});
