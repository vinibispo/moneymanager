module.exports = {
  clearMocks: true,
  projects: ['<rootDir>/packages/frontend/jest.config.js'],
  transform: {
    '^.+\\.(ts|tsx)$': 'ts-jest',
  },
  moduleFileExtensions: ['ts', 'tsx', 'js']
}
