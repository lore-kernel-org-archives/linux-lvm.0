Date: Sat, 5 Feb 2000 01:01:45 -0600 (CST)
From: "Dominic J. Eidson" <sauron@the-infinite.org>
Subject: [linux-lvm] LVM release (fwd)
Message-ID: <Pine.LNX.4.10.10002050100330.12631-100000@morannon.kdi.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM <linux-lvm@msede.com>


Maybe you Heinz could answer this better than me...

Dominic

---------- Forwarded message ----------
Date: Fri, 4 Feb 2000 22:33:24 PST
From: tbreuel@parc.xerox.com
To: dominic@the-infinite.org
Subject: LVM release

Hi,

I saw your announcement of LVM for Linux with interest.
I have some questions about it:

 -- The main selling point of LVM on IBM systems was that
    it allowed resizing file systems while they were on-line;
    with ext2, that doesn't seem to be possible. So, if they
    have to be unmounted anyway, why not use GNU parted?
    Are there plans for on-line resizable file systems
    in Linux?

 -- You state that the LVM doesn't have a lot of overhead.
    What conditions did you test under? Many file systems optimize
    disk head movement, but once a volume has been resized multiple
    times, the relationship between logical block addresses and
    head positions become pretty unpredictable. Does the LVM
    implementation address this? Are there hooks that file system
    implementations can use to discover the mapping? And is
    there some kind of "LVM defragmentation utility" that makes
    logical volumes sequential and contiguous?

 -- Are you planning on making LVM the default disk
    storage management system in the 2.3 kernels, or is
    it going in as something only to be used for "enterprise 
    Linux distributions"?

Thanks,
Thomas.

PS: I was using and configuring AIX systems for four years,
so that's where I have used logical volumes before.
