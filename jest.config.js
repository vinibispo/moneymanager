module.exports = {
  bail: true,
  clearMocks: true,
  projects: ['<rootDir>/packages/**/jest.config.js'],
  transform: {
    '^.+\\.(ts|tsx)$': 'ts-jest',
  },
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json']
};
