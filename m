Date: Sat, 8 May 1999 15:23:10 -0400 (EDT)
From: XxEDGExX <jeremy@xxedgexx.com>
Subject: Re: [linux-lvm] Re: A question about LVM 0.6 kernel patch.
In-Reply-To: <199905081805.AA10214@mailgate1b.telekom.de>
Message-ID: <Pine.LNX.4.02.9905081522250.3886-100000@www.xxedgexx.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: gpwolfe@micron.net, mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Very strange indeed.  I've successfully patched up to 2.2.7 ac2 with no
problem.  Waiting on the drive array to actually *use* LVM, but the
patches weren't a problem.

-jeremy

> > 
> > First of all I want to say that I'm really anxious to try out LVM for
> > Linux.	I've been wanting this feature for a very long time.
> > 
> 
> 8*)
> 
> > I downloaded all the bits from your site and attempted to get things going
> > but I am unable to get the patch be fully successful.  It keeps
> > saying stuff like hunk #4 failed at xxx etc.  And then it asks if I want to
> > apply the patch anyway.  I have kernel 2.2.5 (RedHat 6.0) and I see that
> > the latest patch you have is 2.2.2...but I was under the impression that
> > this was just for 2.2.x kernels.  Perhaps I am mistaken and, in fact, there
> > is no way to use the LVM stuff with kernel 2.2.5?
> > 
> 
> Astonished about that, because patching the stock 2.2.5 kernel works here.
> 
> Did you do a
> 
>    cd /usr/src/linux
>    gzip -dc YourPathToThePatch/lvm_0.6-patch-15031999a.gz | patch -p1
> 
> ?
> 
> Please send me the stdout/stderr of that.
> 
> <SNIP>
> 
> Regards,
> Heinz
> 
> --
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Systemmanagement C/S                             Deutsche Telekom AG
>                                                  Entwicklungszentrum Darmstadt
> Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
> Senior Systems Engineer                          Postfach 10 05 41
>                                                  64205 Darmstadt
> mge@ez-darmstadt.telekom.de                      Germany
>                                                  +49 6151 886-425
>                                                           FAX-386
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> 


http://www.xxedgexx.com | jeremy@xxedgexx.com
---------------------------------------------
Y2K.  We're all gonna die.
