web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
worker: bundle exec sidekiq -q default -q mailers -c 5 -C config/sidekiq.yml
release: bundle exec rails db:migrate