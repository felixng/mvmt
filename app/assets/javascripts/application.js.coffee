# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery_2
#= require jquery_ujs
#= require bootstrap
#= require nprogress
#= require nprogress-turbolinks
#= require rails_confirm_dialog
#= require jquery.scrollto
#= require modernizr.custom.js
#= require jquery.fittext.js
#= require classie.js
#= require borderMenu.js
#= require clipboard.min.js
#= require categoryMenu.js
#= require mvmt.js.erb
#= require logo.js
#= require flowtype.js
#= require controllers/place-controller.js
#= require directives/mvmt-directives.js


# Add error class to .avatar images if they fail to load
# See avatar.scss and _avatar.html.haml
#= require imagesloaded
#= require avatar.errors
