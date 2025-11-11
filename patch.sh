#!/usr/bin/env bash

MASTODON="/var/lib/mastodon"

TOOTCMD="sudo -u mastodon RAILS_ENV=production"
TOOT_VER="v4.5.0"

P_MAX_CHAR_1="app/javascript/mastodon/features/compose/containers/compose_form_container.js"
P_MAX_CHAR_1A="https://raw.githubusercontent.com/vrworx/mammoth/main/${TOOT_VER}/MAX_CHARS/compose_form_container.js"
P_MAX_CHAR_1R="https://raw.githubusercontent.com/mastodon/mastodon/${TOOT_VER}/app/javascript/mastodon/features/compose/containers/compose_form_container.js"

P_MAX_CHAR_2="app/validators/status_length_validator.rb"
P_MAX_CHAR_2A="https://raw.githubusercontent.com/vrworx/mammoth/main/${TOOT_VER}/MAX_CHARS/status_length_validator.rb"
P_MAX_CHAR_2R="https://raw.githubusercontent.com/mastodon/mastodon/${TOOT_VER}/app/validators/status_length_validator.rb"

P_MAX_CHAR_3="spec/validators/note_length_validator_spec.rb"
P_MAX_CHAR_3A="https://raw.githubusercontent.com/vrworx/mammoth/main/${TOOT_VER}/MAX_CHARS/note_length_validator_spec.rb"
P_MAX_CHAR_3R="https://raw.githubusercontent.com/mastodon/mastodon/${TOOT_VER}/spec/validators/note_length_validator_spec.rb"

P_APPLY="1"
P_RESTORE="0"
P_REBUILD="1"

cd ${MASTODON}

# PATCH: MAX CHAR LIMIT - APPLY
if [ ${P_APPLY} -eq 1 ]
then
    echo "[*] PATCH: MAX CHAR LIMIT - APPLY"
    wget ${P_MAX_CHAR_1A} -O ${MASTODON}/${P_MAX_CHAR_1}
    wget ${P_MAX_CHAR_2A} -O ${MASTODON}/${P_MAX_CHAR_2}
    wget ${P_MAX_CHAR_3A} -O ${MASTODON}/${P_MAX_CHAR_3}
else
    echo "[*] PATCH: NOTHING TO APPLY"
fi

# PATCH: MAX CHAR LIMIT - RESTORE
if [ ${P_RESTORE} -eq 1 ]
then
    echo "[*] PATCH: MAX CHAR LIMIT - RESTORE"
    wget ${P_MAX_CHAR_1R} -O ${MASTODON}/${P_MAX_CHAR_1}
    wget ${P_MAX_CHAR_2R} -O ${MASTODON}/${P_MAX_CHAR_2}
    wget ${P_MAX_CHAR_3R} -O ${MASTODON}/${P_MAX_CHAR_3}
else
    echo "[*] PATCH: NOTHING TO RESTORE"
fi

# PATCH: MAX CHAR LIMIT - MASTODON/REBUILD
if [ ${P_REBUILD} -eq 1 ]
then
    echo "[*] PATCH: MAX CHAR LIMIT - REBUILD"
    find -path ./public/system -prune -o -exec chown -h mastodon:mastodon {} +
    ${TOOTCMD} NODE_OPTIONS=--openssl-legacy-provider bundle exec rails assets:precompile
    systemctl restart mastodon-sidekiq
    systemctl restart mastodon-web
    systemctl restart mastodon-streaming
else
    echo "[*] PATCH: NOTHING TO REBUILD"
fi
