let path = require('path');

let MiniCssExtractPlugin = require('mini-css-extract-plugin');


// development production
module.exports = {
    mode: 'development',
    entry: './index.js',
    output: {
        filename: 'main.js',
        path: path.resolve(__dirname, 'css')
    },

    plugins: [
        new MiniCssExtractPlugin({
            filename: "custom.css",
        })
    ],

    module: {
        rules: [{
            test: /\.scss$/,
            use: [
                MiniCssExtractPlugin.loader,
                {
                    loader: 'css-loader'
                },
                {
                    loader: "resolve-url-loader"
                },
                {
                    loader: "sass-loader",
                    options: { sourceMap: true }
                }
            ]
        }]
    }
}