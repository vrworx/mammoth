<h1><picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/mastodon/mastodon/v4.2.12/lib/assets/wordmark.dark.png">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/mastodon/mastodon/v4.2.12/lib/assets/wordmark.light.png">
  <img alt="Mastodon" src="https://raw.githubusercontent.com/mastodon/mastodon/v4.2.12/lib/assets/wordmark.light.png" height="34">
</picture></h1>

Mastodon is a **free, open-source social network server** based on ActivityPub where users can follow friends and discover new ones. On Mastodon, users can publish anything they want: links, pictures, text, and video. All Mastodon servers are interoperable as a federated network (users on one server can seamlessly communicate with users from another one, including non-Mastodon software that implements ActivityPub!)

## Changelog
* v4.2.12/MAX_CHARS - 500 -> 1500
* v4.2.11/MAX_CHARS - 500 -> 1500
* v4.2.10/MAX_CHARS - 500 -> 1500
* v4.2.9/MAX_CHARS - 500 -> 1500

#### app/javascript/mastodon/features/compose/components/compose_form.jsx
---
[L103](https://github.com/mastodon/mastodon/blob/v4.2.12/app/javascript/mastodon/features/compose/components/compose_form.jsx#L103):
```javascript
return !(isSubmitting || isUploading || isChangingUpload || length(fulltext) > 1500 || (isOnlyWhitespace && !anyMedia));
```
[L300](https://github.com/mastodon/mastodon/blob/v4.2.12/app/javascript/mastodon/features/compose/components/compose_form.jsx#L300):
```javascript
<CharacterCounter max={1500} text={this.getFulltextForCharacterCounting()} />
```

#### app/validators/status_length_validator.rb
---
[L4](https://github.com/mastodon/mastodon/blob/v4.2.12/app/validators/status_length_validator.rb#L4):
```ruby
MAX_CHARS = 1500
```

#### app/serializers/rest/instance_serializer.rb
---
[L14](https://github.com/mastodon/mastodon/blob/v4.2.12/app/serializers/rest/instance_serializer.rb#L14):
```ruby
:registrations, :max_post_chars
```
L92 - L94:
```ruby
def max_post_chars
  1500
end
```

#### spec/validators/note_length_validator_spec.rb
---
[L6](https://github.com/mastodon/mastodon/blob/v4.2.12/spec/validators/note_length_validator_spec.rb#L6):
```ruby
subject { described_class.new(attributes: { note: true }, maximum: 1500) }
```
[L9](https://github.com/mastodon/mastodon/blob/v4.2.12/spec/validators/note_length_validator_spec.rb#L9):
```ruby
it 'adds an error when text is over 1500 characters' do
```
