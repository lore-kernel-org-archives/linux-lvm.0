Message-Id: <199907011150.AA23766@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] vgscan -- invalid i/o protocol version
Date: Thu, 01 Jul 1999 13:46:55 METDST
In-Reply-To: <Pine.LNX.4.10.9907010958120.3721-100000@fuse.aethos.co.uk>; from "James Pattinson" at Jul 1, 99 10:17 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Pattinson <jamesp@aethos.co.uk>
Cc: mge@u9ete.ez-darmstadt.telekom.de, linux-lvm@msede.com

> 
> That's exactly the problem. In fact I found out that was the problem after
> I sent the mail by looking at the output from `strace vgscan' but I
> couldn't find the require major and minor numbers for the device file
> anywhere in the docs.

The patch lvm_0.6-patch-15031999a.gz (sorry for my typo in my previous
mail :*( ) is needed to take care of automatic creation of the /dev/lvm special.

> 
> I'm a bit stumped for now though as I don't have any spare partitions
> (yet) - I tried to be cunning with loopback devices but it doesn't seem to
> work:
> 
> [root@fuse /root]# dd if=/dev/zero bs=1024k count=32 of=loop1
> [root@fuse /root]# dd if=/dev/zero bs=1024k count=32 of=loop2
> [root@fuse /root]# dd if=/dev/zero bs=1024k count=32 of=loop3
> [root@fuse /root]# losetup /dev/loop1 loop1
> [root@fuse /root]# losetup /dev/loop2 loop2
> [root@fuse /root]# losetup /dev/loop3 loop3
> [root@fuse /root]# pvcreate /dev/loop1 /dev/loop2 /dev/loop3
> pvcreate -- invalid physical volume name "/dev/loop1"
> pvcreate -- invalid physical volume name "/dev/loop2"
> pvcreate -- invalid physical volume name "/dev/loop3"
> 
> Is there any way I can bodge it like this to try it out?

Sorry, no loop device support with 0.6.

It will be in 0.7 as an evaluation support for people who don't
have lots of disk partitions to play with.

I should better throw out 0.7 soon 8*)))

> 
> One more thing - I am a big fan of the raid patches that allow you to
> autodetect raid partitions on boot - currently my machine has it's root
> partition striped across two disks. What is the striping like on LVM? Is
> it feasible to boot from an LVM?
> 

That's one issue i'm working on with 0.7 right know.
After i asked for input of people who claimed already to be able to
have root in a LV but never got a return i wanted to bring support with 0.7.

Maybe i better release 0.7 and give that support later?!

It bassically works like this:

LILO -> INITRD (in very small partition) -> activate volume groups ->
change root to root LV -> copy /etc/lcmtab* to real LV root -> start as usual

The INITRD only contains some needed executables, shared libraries, dirs
and /linuxrc.


Regards,
Heinz


> Cheers,
> 
> James
> 
> On Wed, 30 Jun 1999, Michael Marxmeier wrote:
> 
> > > so i ran vgscan and got the message in the subject line. It's possible I'm
> > > being really thick and I don't really know what I'm doing. Do I need the
> > > devfs patches too?
> > 
> > AFAIR this error message has appeared previously when the /dev/lvm
> > device file was missing.
> 
> 
> 


--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
