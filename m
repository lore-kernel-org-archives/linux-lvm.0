Message-ID: <3875DB88.8CF6C807@msede.com>
Date: Fri, 07 Jan 2000 13:26:48 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: manfreds@colorfullife.com
MIME-Version: 1.0
Subject: [linux-lvm] Fwd: Re: file system size limits
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded to the list.

-------- Original Message --------
Sender: manfreds@colorfullife.com
Message-ID: <3875C6BD.77A307DD@colorfullife.com>
Date: Fri, 07 Jan 2000 11:58:05 +0100
Resent-Date: Fri, 07 Jan 2000 13:21:02 MEZ
From: Manfred Spraul <manfreds@colorfullife.com>
To: "Theodore Y. Ts'o" <tytso@MIT.EDU>, linux-LVM@msede.com
CC: Andrea Arcangeli <andrea@suse.de>, Andi Kleen <ak@muc.de>,
        linux-fsdevel@vger.rutgers.edu
Subject: Re: file system size limits

[I added linux-LVM to the cc list because it could be a LVM problem]

"Theodore Y. Ts'o" wrote:
> 
>    From: "Manfred Spraul" <manfreds@colorfullife.com>
>    Date:   Thu, 6 Jan 2000 20:08:59 +0100
> 
>    Ok, so the limits are even more complex:
>    * on an Alpha, you could build a 4TB ext2 volume and use it.
>    * if your Alpha crashes, and you connect your disks to an i386 box, then you
>    could corrupt your file system unless someone has added safety checks.
> 
>    I'm merely try to verify that these safety checks exist:
>    eg. ext2 on Alpha supports files > 2 GB, but linux-2.2 on i386 doesn't. If
>    you try to mount the disk on i386, then ext2 refuses to perform invalid
>    operations on these files.
> 
> We're *way* ahead of you.

I knew that, but this only means that ext2 is safe.
What about the other subsystems?
eg it seems that lvm doesn't contain the checks for lvm's > 2 TB on
32-bit platforms.

* LVM can map up to 128 TB [I only checked the header file of
LVM-0.8i]
* This would work on 64-bit platforms.
* If you attach these disks to a 32-bit platform, you'll corrupt your
data. [but perhaps LVM will refuse to mount it, but I couldn't find
such
checks at first glance].

> The on-disk format of the ext2 filesystem only allows 4 bytes for the
> block number, and it's defined to be an unsigned value.  So if you're
> using 4k blocks, the maximum theoretical filesize is 64 TB.  (i.e.,
> 4*2^10*2^32 == 2^46)

That's the ext2 limit. But the real-life limit is lowest value of
(ext2-limit, ll_rw_blk limit, LVM limit, raid limit).

I think we must check these limits, and ensure that everyone refuses
to
work with larger disks.
ext2 is OK, but this doesn't mean that the complete chain
syscall-to-disk will be OK.

--
	Manfred
