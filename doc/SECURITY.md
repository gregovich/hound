Security
========

This document is intended to help our customers'
security, risk, and compliance folks
evaluate the care we take with our customers' code and data.

Because [Hound is open source][oss],
we often refer to portions of the application code and its dependent
libraries, frameworks, and programming languages.
We hope this makes it easier for developers to evaluate our security measures.

[oss]: https://github.com/thoughtbot/hound

Vulnerability Reporting
-----------------------

For security inquiries or vulnerability reports, please email
[security@thoughtbot.com](security@thoughtbot.com).

thoughtbot
----------

Hound is operated by [thoughtbot, inc.], a [Massachusetts corporation][sec].

[thoughtbot, inc.]: http://thoughtbot.com
[sec]: http://corp.sec.state.ma.us/CorpWeb/CorpSearch/CorpSummary.aspx?FEIN=203438204

A small team within thoughtbot is responsible for Hound.

What happens when you authenticate your GitHub account
------------------------------------------------------

Hound uses the [OmniAuth GitHub] Ruby gem to
authenticate your GitHub account using [GitHub's OAuth2 flow][gh-oauth].

[OmniAuth GitHub]: https://github.com/intridea/omniauth-github
[gh-oauth]: https://developer.github.com/v3/oauth/

Using OAuth2 means we do not access your GitHub password
and that you can revoke our access at any time.

We store a GitHub token in your web browser's session cookie.
We do not store this GitHub token in our PostgreSQL database.

We need this cookie in order to "sync" your GitHub repositories with Hound,
which we do once immediately after you authenticate your GitHub account.
You can manually "sync" your GitHub repositories with Hound at any time.

To browse the portions of the codebase related to authentication,
try `grep`ing for the following terms:

```bash
grep -R omniauth app
grep -R github_token app
```

What happens when Hound "syncs" your GitHub repositories
--------------------------------------------------------

We pass your GitHub token to our [Redis] database
The database is hosted by [Redis to Go],
which is owned by [Rackspace].

[Redis]: http://redis.io/
[Redis to Go]: http://redistogo.com
[Rackspace]: http://www.rackspace.com/

This allows you to "enable" Hound on GitHub repos of

Hound runs on [Heroku], a "Platform as a Service",
which runs on Amazon Web Services' "Infrastructure as a Service."
Read [Heroku's Security Policy][aws] for information about their
security assessments, compliance, penetration testing,
environmental safeguards, network security, and more.

[Heroku]: https://www.heroku.com
[aws]: https://www.heroku.com/policy/security

Data security
-------------

https://www.heroku.com/policy/security
https://codeclimate.com/security
https://help.github.com/articles/github-security/
https://app.intercom.io/a/apps/q88cgtdz/inbox/conversation/553300536
