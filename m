Date: Thu, 1 Jul 1999 10:17:05 +0100 (BST)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: Re: [linux-lvm] vgscan -- invalid i/o protocol version
In-Reply-To: <199906301634.SAA06762@e35.msede.com>
Message-ID: <Pine.LNX.4.10.9907010958120.3721-100000@fuse.aethos.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

That's exactly the problem. In fact I found out that was the problem after
I sent the mail by looking at the output from `strace vgscan' but I
couldn't find the require major and minor numbers for the device file
anywhere in the docs.

I'm a bit stumped for now though as I don't have any spare partitions
(yet) - I tried to be cunning with loopback devices but it doesn't seem to
work:

[root@fuse /root]# dd if=/dev/zero bs=1024k count=32 of=loop1
[root@fuse /root]# dd if=/dev/zero bs=1024k count=32 of=loop2
[root@fuse /root]# dd if=/dev/zero bs=1024k count=32 of=loop3
[root@fuse /root]# losetup /dev/loop1 loop1
[root@fuse /root]# losetup /dev/loop2 loop2
[root@fuse /root]# losetup /dev/loop3 loop3
[root@fuse /root]# pvcreate /dev/loop1 /dev/loop2 /dev/loop3
pvcreate -- invalid physical volume name "/dev/loop1"
pvcreate -- invalid physical volume name "/dev/loop2"
pvcreate -- invalid physical volume name "/dev/loop3"

Is there any way I can bodge it like this to try it out?

One more thing - I am a big fan of the raid patches that allow you to
autodetect raid partitions on boot - currently my machine has it's root
partition striped across two disks. What is the striping like on LVM? Is
it feasible to boot from an LVM?

Cheers,

James

On Wed, 30 Jun 1999, Michael Marxmeier wrote:

> > so i ran vgscan and got the message in the subject line. It's possible I'm
> > being really thick and I don't really know what I'm doing. Do I need the
> > devfs patches too?
> 
> AFAIR this error message has appeared previously when the /dev/lvm
> device file was missing.
