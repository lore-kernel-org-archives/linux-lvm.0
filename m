From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200002231030.LAA25224@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Linux2.3.47 problems
In-Reply-To: <20000222212528.19158.qmail@www0l.netaddress.usa.net> from Eric Gandt at "Feb 22, 2000 10:27:53 pm"
Date: Wed, 23 Feb 2000 11:30:07 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Eric Gandt <egandt@netscape.net>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


A couple of changes got lost during Linus's merge into the stock kernel.

Will send him a patch today.


Heinz


> I can not get LVM to complie in 2.3.47, when I try I get:
> 
> lvm.c:313: `blkdev_close' undeclared here (not in a function)
> lvm.c:313: initializer element for `lvm_blk_fops.release' is not constant
> lvm.c:318: `block_fsync' undeclared here (not in a function)
> lvm.c:318: initializer element for `lvm_blk_fops.fsync' is not constant
> lvm.c:318: initializer element for `lvm_blk_fops' is not constant
> lvm.c:318: initializer element for `lvm_blk_fops' is not constant
> /usr/src/linux/include/linux/blk.h:454: warning: `end_request' defined but not
> used
> 
> There does not look to be anything wrong with the code at first glance, has
> anyone else encountered this problem? if so is there away around it?
> 
> ERIC
> egandt@netscape.net
> 
> ____________________________________________________________________
> Get your own FREE, personal Netscape WebMail account today at http://webmail.netscape.com.
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
