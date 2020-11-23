cd packages/backend && bundle exec rspec $(git status | grep spec | grep "modified:" | cut -b 15-)
cd ../..
