<h1><picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/mastodon/mastodon/v4.3.2/lib/assets/wordmark.dark.png">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/mastodon/mastodon/v4.3.2/lib/assets/wordmark.light.png">
  <img alt="Mastodon" src="https://raw.githubusercontent.com/mastodon/mastodon/v4.3.2/lib/assets/wordmark.light.png" height="34">
</picture></h1>

Mastodon is a **free, open-source social network server** based on ActivityPub where users can follow friends and discover new ones. On Mastodon, users can publish anything they want: links, pictures, text, and video. All Mastodon servers are interoperable as a federated network (users on one server can seamlessly communicate with users from another one, including non-Mastodon software that implements ActivityPub!)

## Changelog
* v4.3.2/MAX_CHARS - 500 -> 1500
* v4.3.1/MAX_CHARS - 500 -> 1500
* v4.3.0/MAX_CHARS - 500 -> 1500

#### app/javascript/mastodon/features/compose/containers/compose_form_container.js
---
[L31](https://github.com/mastodon/mastodon/blob/v4.3.2/app/javascript/mastodon/features/compose/containers/compose_form_container.js#L31):
```javascript
 maxChars: state.getIn(['server', 'server', 'configuration', 'statuses', 'max_characters'], 1500),
```

#### app/validators/status_length_validator.rb
---
[L4](https://github.com/mastodon/mastodon/blob/v4.3.2/app/validators/status_length_validator.rb#L4):
```ruby
MAX_CHARS = 1500
```

#### spec/validators/note_length_validator_spec.rb
---
[L6](https://github.com/mastodon/mastodon/blob/v4.3.2/spec/validators/note_length_validator_spec.rb#L6):
```ruby
subject { described_class.new(attributes: { note: true }, maximum: 1500) }
```

