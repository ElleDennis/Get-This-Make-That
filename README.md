#  Get-This-Make-That

GTMT is a web app, based on a website build from Winston Teo class.

## Development

Boot up your Vagrant box:

```
vagrant up
```

SSH into your Vagrant box:

```
vagrant ssh
```

Change into the `/vagrant` directory (the `/` is important):

```
cd /vagrant
```

In the `/vagrant` folder, clone this repository:

```
git clone git@github.com:ElleDennis/Get-This-Make-That.git
```

Change into the repository directory:

```
cd Get-This-Make-That
```

Install the RubyGems:

```
bundle install
```

Create the database:

```
rake db:create
```

Run migrations:

```
rake db:migrate
```

Start your server:

```
rails server -b 0.0.0.0
```

Now, you should be able to access your app at `http://localhost:3000`.

---

On your laptop, find the folder `workshop/Get-This-Make-That`.

Open up the folder with Sublime and then you can make changes within Sublime.

Note: The `/vagrant` folder on Vagrant and `workshop` folder on your laptop are synced.

## Pushing Changes to GitHub

The following steps will help you push your code up to GitHub.

This does not deploy or update the app in anyway at http://getthismakethat.net.

What this does is just to store a copy of the source code on GitHub (in case you lose the source code).

---

(While still in your `/vagrant/Get-This-Make-That` directory..)

Using Git, add your changes:

```
git add .
```

Commit your changes:

```
git commit -m '<your own commit message>'
```

Push to GitHub:

```
git push origin master
```

## Pushing Changes to Heroku

The following steps will help you push your code up to Heroku.

When you do this, you are deploying the code changes to http://getthismakethat.net.

For every code change, you should do a push to both GitHub and Heroku so that they are in sync.

---

(While still in your `/vagrant/Get-This-Make-That` directory..)

Set up the Heroku remote:

```
git remote add heroku https://git.heroku.com/gtmt.git
```

Push to Heroku:

```
git push heroku master
```

## Notes

Development (localhost:3000) and Production (getthismakethat.net) have different databases,
and so data that you save on Development will not appear in Production (and vice versa).
