Message-ID: <395C1D93.453EE1A6@inet.net.nz>
Date: Fri, 30 Jun 2000 16:09:55 +1200
From: Dale Kemp <dale@inet.net.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
References: <8525690D.0082015B.00@d54mta02.raleigh.ibm.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM <linux-lvm@msede.com>

>
> "lvreduce allows you to reduce the size of a logical volume. Be careful
> when reducing a logical volume's size, because data in the reduced part is
> lost!!!"
>
> If you are using ext2, then you could use e2fsadm, but if you are using
> another filesystem, then what?  Even if you are using ext2, a user could
> still use lvreduce directly.  Thus, this is a data security hole.

This is more than a problem with LVM but with device and file system
integration. Even with LVMS the problems not fully solved, maybe only
with JFS but what about ext2, ext3, reiserfs etc. I propose that the list
put some thought into this whole integration process, I think some common
interface standard is needed. Maybe something like the resizefs that I
proposed in a previous email.

toplevel:    resizefs <partition_device | logical_volume | mountpoint>

This then calls resizefs.ext2 for example again some thought is needed with
regards to volume's and partition's. Using a common interface now for volumes
could allow the command (or something like it) to work on both LVM and LVMS.
(Maybe also the remount options, etc.)
Its become clear that the most important part is some common elements for
volumes; specifics for each volume manager can be handled in each kernel
module and toolset.
Let's do this now no latter when its all incompatible, for the user's sake.
I say to IBM and SGI please lets get some common functionality, and start
drawing up a proposal document online.

What do you all think?

Proposed common volume management:

    - The 'mount' command, and options. Such as readonly etc.
    - A resize filesystem command such as "resizefs", that knows about
partitions and
       volumes.
    - mkfs (eg. mke2fs) should work with all volume types.
    - Others to be proposed.

-- Dale.
