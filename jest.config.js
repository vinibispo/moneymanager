module.exports = {
  bail: true,
  clearMocks: true,
  preset: 'react-native',
  testEnvironment: 'jsdom',
  projects: ['<rootDir>/packages/**/jest.config.js'],
  transform: {
    '^.+\\.(ts|tsx)$': 'ts-jest',
  },
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json']
};
