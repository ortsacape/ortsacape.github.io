# Wordpress Install

## Local

```bash
$ USER_NAME=$USER USER_ID=$(id -u) docker-compose up --remove-orphans --build
```

Bash in running container
```bash
$ docker exec --user $USER -ti ortsacapegithubio_wordpress_1 wp plugin install mailchimp-for-wp jetpack imsanity --activate
```

## Installing plugins
```bash
$ su charlesmulder
$ wp plugin install mailchimp-for-wp jetpack --activate
```

## Resources
* [Wordpress Salt Generator](https://api.wordpress.org/secret-key/1.1/salt/)
