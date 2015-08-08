webpack = require 'webpack'
ExtractTextPlugin = require "extract-text-webpack-plugin"
path = require 'path'

paths =
  foundation: 'foundation-sites/js/foundation.min.js'
  vendor: 'foundation-sites/js/vendor'

module.exports =

  devtool: 'eval'
  debug: true
  watch: true

  output:
    filename: 'bundle.js'

  module:
    loaders: [
      { test: /\.jsx?$/, exclude: /(node_modules|bower_components)/, loader: 'babel?optional[]=runtime&stage=0' }
      { test: /modernizr\.js$/, loader: "imports?this=>window!exports?window.Modernizr" }
      { test: /\.css$/, loader: ExtractTextPlugin.extract 'style-loader', 'css-loader' }
      { test: /\.(png|jpg|eot|woff|woff2|ttf|svg)$/, loader: 'url-loader?limit=8192' }
    ]

  resolve: 
    extensions: ['', '.js']
    alias:
      jquery: path.join paths.vendor, 'jquery' 
      modernizr: path.join paths.vendor, 'modernizr'
      fastclick: path.join paths.vendor, 'fastclick'
      foundation: paths.foundation

  plugins: [
    new ExtractTextPlugin('styles.css')
    new webpack.ProvidePlugin({
         $: "jquery"
         jQuery: "jquery"
         "window.jQuery": "jquery"
         "root.jQuery": "jquery"
    })
  ]
