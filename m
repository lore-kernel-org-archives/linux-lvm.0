Message-ID: <004d01be5a70$c20b9ad0$6630aec1@trpc.dkfz-heidelberg.de>
From: "Tobias Reber" <tobias.reber@dkfz-heidelberg.de>
Subject: Re: [linux-lvm] root filesystem in lvm
Date: Wed, 17 Feb 1999 13:26:34 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Michael Marxmeier <mike@msede.com>
Cc: linux-lvm@msede.com

Michael Marxmeier wrote:
>I don't think so. All vgchange -an is supposed to do is unregister
>the volume group with the kernel. Since you are going to boot anyway
>it does not make a difference.
>I had a short look at the source and it seems to be a nop anyway.
>
When I looked into the source, I saw that it does an fsync on the underlying
partitions. So I am not so sure, if it really does no harm. To my knowledge
all block devices go through the buffer cache. Don't they?
>> Also did anybody out there look into lilo in order to make the
>> kernel bootable from an lvm volume? IMHO lvm looks very keen
>> especially if you have large disks, where you still have only
>> 8 partitions. I prefer having my filesystem spread out into
>> several partitions for /, /usr and so forth.
>
>While this should not be too hard i'm not sure if this makes sense.
>Why not designate a small boot area on the disk (/boot) which holds
>the kernel image and a minimal recovery system and use a initrd?
That's what I do at the moment. But I do not really like it because my /boot
filesystem now resides in a dos partition, where I boot from. I should like
to have a self-contained linux system
Cheers
Tobias
