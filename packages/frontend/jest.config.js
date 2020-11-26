const baseConfig = require("../../jest.config");

delete baseConfig.projects;
const { join } = require("path");

module.exports = {
  testPathIgnorePatterns: ["<rootDir>/.next/", "<rootDir>/node_modules/"],
  setupFilesAfterEnv: [join(__dirname, "setupTests")],
  transform: {
    "^.+\\.(js|jsx|ts|tsx)$": join(__dirname, "../../node_modules/babel-jest"),
  },
};
