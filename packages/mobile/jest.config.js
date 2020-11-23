const { join } = require("path");

const baseConfig = require("../../jest.config");
const { name } = require("./package.json");

delete baseConfig.projects;

module.exports = {
  preset: "react-native",
  name,
  displayName: name,
  setupFilesAfterEnv: ["@testing-library/jest-native/extend-expect"],
  moduleFileExtensions: ["ts", "tsx", "js", "jsx", "json", "node"],
  transform: {
    "\\.js$": join(
      __dirname,
      "../../node_modules/react-native/jest/preprocessor.js"
    ),
  },
  globals: {
    "ts-jest": {
      babelConfig: true,
    },
  },
  // This is the only part which you can keep
  // from the above linked tutorial's config:
};
