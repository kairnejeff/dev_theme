let path = require('path');

let MiniCssExtractPlugin = require('mini-css-extract-plugin');
let CssMinimizerPlugin = require('css-minimizer-webpack-plugin');


// development production
module.exports = {
    mode: 'development',
    entry: './index.js',
    output: {
        filename: 'theme.js',
        path: path.resolve(__dirname, 'js')
    },

    plugins: [
        new MiniCssExtractPlugin({
            filename: "../css/theme.css",
        })
    ],

    module: {
        rules: [{
                test: /\.css$/i,
                use: [MiniCssExtractPlugin.loader, 'css-loader'],
            },
            {
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
            },
            {
                test: /\.(png|svg|jpg|gif)$/,
                loader: 'file-loader',
                options: {
                    name: '[name].[ext]',
                    outputPath: '../img',
                },

            },
            {
                test: /\.(woff|woff2|eot|ttf|otf)$/,
                loader: 'file-loader',
                options: {
                    name: '[name].[ext]',
                    outputPath: '../fonts',
                },

            },
            {
                test: /\.m?js$/,
                exclude: /(node_modules|bower_components)/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/preset-env']
                    }
                }
            }
        ]
    },
    optimization: {
        minimize: true,
        minimizer: [
            new CssMinimizerPlugin(),
        ],
    },

}