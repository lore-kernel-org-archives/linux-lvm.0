From: benr@us.ibm.com
Message-ID: <8525690E.006AEE2B.00@d54mta02.raleigh.ibm.com>
Date: Fri, 30 Jun 2000 14:27:56 -0500
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com



Dale,

>>
>> "lvreduce allows you to reduce the size of a logical volume. Be careful
>> when reducing a logical volume's size, because data in the reduced part
is
>> lost!!!"
>>
>> If you are using ext2, then you could use e2fsadm, but if you are using
>> another filesystem, then what?  Even if you are using ext2, a user could
>> still use lvreduce directly.  Thus, this is a data security hole.
>
>This is more than a problem with LVM but with device and file system
>integration.

Yes.

> Even with LVMS the problems not fully solved, maybe only
>with JFS but what about ext2, ext3, reiserfs etc.

The LVMS solves this problem through Filesystem Interface Modules (FIM).
Refer to page 11 of the white paper, under the "Filesystem Participation"
section.  Thus, all that is needed to make ext2, ext3, reiserfs, JFS, XFS,
HPFS, FAT, etc. work with the LVMS is an appropriate FIM.  How hard is it
to write a FIM?  That depends upon how hard it is to resize the filesystem
that the FIM is being written for, not much else.  Just because a
filesystem does not have a FIM, though, does not mean that that filesystem
can not be used with the LVMS.  It just means that the LVMS will not be
able to perform certain operations on volumes which employ that filesystem.

>I propose that the list
>put some thought into this whole integration process, I think some common
>interface standard is needed. Maybe something like the resizefs that I
>proposed in a previous email.
>
>toplevel:    resizefs <partition_device | logical_volume | mountpoint>
>
>This then calls resizefs.ext2 for example again some thought is needed
with
>regards to volume's and partition's. Using a common interface now for
volumes
>could allow the command (or something like it) to work on both LVM and
LVMS.
>(Maybe also the remount options, etc.)
>Its become clear that the most important part is some common elements for
>volumes; specifics for each volume manager can be handled in each kernel
>module and toolset.
>Let's do this now no latter when its all incompatible, for the user's
sake.
>I say to IBM and SGI please lets get some common functionality, and start
>drawing up a proposal document online.
>
>What do you all think?
>
>Proposed common volume management:
>
>    - The 'mount' command, and options. Such as readonly etc.
>    - A resize filesystem command such as "resizefs", that knows about
>partitions and
>       volumes.
>    - mkfs (eg. mke2fs) should work with all volume types.
>    - Others to be proposed.

The LVMS already does what you are talking about, and it does so without
imposing any particular user interface.  By having the integration occur in
the LVMS instead of in the user interface, the user interface is easier to
write, and data security holes can be controlled and/or eliminated.
Furthermore, the LVMS was designed to accommodate multiple user interfaces,
and having the integration occur in the LVMS eliminates the duplication of
code and effort which would be required if the user interfaces had to
implement the integration.

Regards,

Ben
