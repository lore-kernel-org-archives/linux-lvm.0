From: Steve_J_Brueggeman@notes.seagate.com
Message-ID: <88256731.0053226C.00@sv-gw1.stsv.seagate.com>
Date: Thu, 11 Mar 1999 09:09:02 -0600
Subject: RE: [linux-lvm] Bonehead problem
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


It sounds to me like you've got old modules hanging around as left-overs.
Did you build LVM 0.5 with the same kernel version? (2.2.2 presumably).  If
so, did you clear out your old modules directory before you rebuilt the
kernel with LVM 0.6?  Are you using modversions when you build the
kernel/modules?

I've also noticed that vgscan will cause the kernel will complain about not
being able to find some block devices that I have not compiled into
modules, or the kernel.  This doesn't sound like your problem though.

I've also had a problem when vgscan ran, because of a bug in the md driver.
I run RedHat 5.2, and the default installation created /dev/md0 through
/dev/md15, but the default md driver is compiled to handle only 4 md
devices (#define MAX_MD_DEV  4), and because of a bug in the md_open()
(uses [minor] without checking minor is less than MAX_MD_DEV), my kernel
would crash when vgscan tried to check /dev/md6 or so.  I just rm'd
/dev/md[4-9] /dev/md1[0-5] to not cause the problem.   I don't think this
is your problem either, but thought you might like to know.

Steve Brueggeman
(All opinions are my own, and in no way reflect those of my employer).
(<--legal-crud)





"Verloove, Olivier" <olivier_verloove@merck.com> on 03/11/99 07:40:42 AM

To:   linux-lvm@msede.com
cc:    (bcc: Steve J Brueggeman)
Subject:  RE: [linux-lvm] Bonehead problem




I have the same problem (Linux 2.2.2 + LVM 0.6).
With or without lvm module loaded, I get:
     vgscan -- invalid i/o protocol version

Is there another module which should be loaded at the same time ?
lsmod gives me:
     lvm  26960     0  (unused)

Thanks.
Olivier Verloove

> ----------
> From:
> ishamael@erroneous.demon.co.uk[SMTP:ishamael@erroneous.demon.co.uk]
> Sent:   Thursday, 11 Mar, 1999 1:25
> To:     linux-lvm@msede.com
> Subject:     Re: [linux-lvm] Bonehead problem
>
> Shawn Leas wrote:
> >When I upgraded to v0.6 from v0.5alpha, I end up having
> >to keep the old v0.5 version of vgscan around.
> >
> >Reason? Well, this is WEIRD... v0.6 vgscan always errs out
> >with 96, or, invalid IO/protocol version. Then, I use v0.5
> >vgscan, and the same happens. Then, I use v0.6 vgscan again,
> >and IT WORKED!
> >
> >What the hell is going on?
>
> Did you build lvm as a module? _insmod lvm_ worked for me, after several
> hours
> of profound confusion.
>
> -michael
> --
> St michael (mainly) Erroneous   http://www.erroneous.demon.co.uk/
> "It's ok to be bitter and twisted,
>  Provided you don't mind leaving a nasty taste in your own mouth."
>
>
