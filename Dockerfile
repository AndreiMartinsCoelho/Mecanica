# syntax = docker/dockerfile:1

# Stage 1: Build dependencies
ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION-slim AS build_dependencies

WORKDIR /rails

# Copy the /bin directory
COPY ./bin ./bin

# Install dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config default-libmysqlclient-dev curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

# Stage 2: Build and precompile assets
FROM build_dependencies AS builder

COPY Gemfile Gemfile.lock ./
RUN bundle config --delete without && \
    bundle config --delete with && \
    bundle install --deployment --without development test && \
    rm -rf ~/.bundle/ /usr/local/bundle/cache /usr/local/bundle/ruby/*/gems/*/.git

COPY . .

RUN bundle exec bootsnap precompile --gemfile

# Install dependencies and configure environment before precompiling assets
RUN yarn install && \
    RAILS_ENV=production bundle exec rake assets:precompile

# Stage 3: Final image
FROM ruby:$RUBY_VERSION-slim AS final

WORKDIR /rails

# Install runtime dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libsqlite3-0 libvips && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copy built artifacts from the builder stage
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /rails /rails

# Run and own only the runtime files as a non-root user for security
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp

USER rails:rails

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]