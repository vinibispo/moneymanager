module.exports = {
  presets: [
    "@babel/preset-env",
    "@babel/preset-react",
    "module:metro-react-native-babel-preset",
    "@babel/preset-typescript"
  ],
  plugins: [
    ["styled-components", { ssr: true }], "inline-react-svg",
    "@babel/plugin-syntax-dynamic-import",
    "@babel/plugin-transform-modules-commonjs",
    "@babel/plugin-transform-runtime",
    "@babel/plugin-proposal-export-default-from",
  ]
};
