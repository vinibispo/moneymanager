const { join } = require("path");

const baseConfig = require("../../jest.config");
const { name } = require("./package.json");

delete baseConfig.projects;

module.exports = {
  ...baseConfig,
  preset: "react-native",
  displayName: name,
  setupFilesAfterEnv: ["@testing-library/jest-native/extend-expect"],
  moduleFileExtensions: ["ts", "tsx", "js", "jsx", "json", "node"],
  transform: {
    "\\.(jsx|js)$": join(
      __dirname,
      "../../node_modules/react-native/jest/preprocessor.js"
    ),
  },
  transformIgnorePatterns: ["node_modules/(?!react-native)/"],
};
