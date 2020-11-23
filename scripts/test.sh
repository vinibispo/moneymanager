yarn jest --findRelatedTests packages/mobile packages/frontend && cd packages/backend && bundle exec rspec $(git ls-files --modified spec)
cd ../..
