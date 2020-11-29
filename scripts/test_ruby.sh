cd packages/backend && bundle exec rspec $(git status | grep "spec" | grep "modified:" | cut -b 14-)
cd ../..
