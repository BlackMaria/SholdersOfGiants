# ShorldersOfGiants

Thanks to many folks over the years we have tools that can help us improve our privacy.  However, it seems that there have not been many attempts at making computer privacy easy for people with limited computer knowledge.  Sadly the state of affairs is there are tons of docs for GPG and all of them could be considered essential reading... but there there are also tons of docs that are antiquated or just not clear enough.  One unfortunate side effect of google is that it is saturated with beginner howto's that all repeat the same thing, and don't give enough information to be helpful. 

This repo gpg-ShorldersOfGiants is my attempt to reduce the amount of confusion by providing a small list of guides and tools that can help you get started.

## Missing from most howtos

The one thing I think we should all know is you should have a master key that you never use in dialogs with others.  That key should be only used to sign the keys you use on a daily basis, and you should have a separate signing key and encryption key.  If you do not have these three keys you are at greater risk.


## Some Good starting point 

* [https://fedoraproject.org/wiki/Using_GPG](https://fedoraproject.org/wiki/Using_GPG)
* [https://riseup.net/en/gpg-best-practices](https://riseup.net/en/gpg-best-practices)
* [Jakes example gpg config - you will need to modify some parts](https://raw.githubusercontent.com/ioerror/duraconf/master/configs/gnupg/gpg.conf)
 * [This is why you should use `keyid-format 0xlong` in your gpg.conf](https://news.ycombinator.com/item?id=12296974)
* [https://wiki.debian.org/Subkeys](https://wiki.debian.org/Subkeys)
* [https://alexcabal.com/creating-the-perfect-gpg-keypair/](https://alexcabal.com/creating-the-perfect-gpg-keypair/)
* [http://www.jabberwocky.com/software/paperkey/](http://www.jabberwocky.com/software/paperkey/)
* [https://keybase.io/](https://keybase.io/)
* [It's a good practice to sign your commits](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work), if you don't believe me [junipers routers got backdoor'ed](https://www.schneier.com/blog/archives/2015/12/back_door_in_ju.html) and no one knows who did it.


## Finding public keys for projects and people

There are several search engines for finding keys for your favourite project or folks you know. On the [sks-keyservers](http://pool.sks-keyservers.net/) you can search for projects signing keys such as [RVM (Ruby Version Manager)](http://pool.sks-keyservers.net/pks/lookup?op=vindex&search=rvm&fingerprint=on) which is sign by Michal Papis.  If you are familiar with the command line and you know the key ID you can directly import it into your gpg config `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 `. 

Notice that the [sks server search ](http://pool.sks-keyservers.net/pks/lookup?op=vindex&search=rvm&fingerprint=on) provides a short ID `39DC0E3` which are the last 8 chars of the gpg id.
  
   * Also note that you will need outgoing access to port 11371 on your firewall to use the `gpg --keyserver hkp://` commands.

# Docker image usage
Please note this isn't ideal security, this is just for convenience to create a backup of your gpg keys.  Please build this image yourself using a secure connection, I am not responsible for any thing that comes from the use of this repo, you are so be cautious and careful

1. Have docker installed ( www.docker.com )
2. Create the docker container  ( either `make docker` or `docker build gpg2qr:latest . ` )
3. Export your keys to a PDF in ~/.gnupg ( docker run --rm --name gpg  -it -v /dev/urandom:/dev/random -v ~/.gnupg:/root/.gnupg ${NAME}:latest gpg2qrcode.sh keyname basename-of-pdf )
4. Print and and store the print out somewhere safe where only you have access
    * Only pint on your own printer, not a work printer or a public printer ( there are hard drives and back ups of what was printed )