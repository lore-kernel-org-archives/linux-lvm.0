Message-ID: <39E28E89.133996EE@attglobal.net>
Date: Mon, 09 Oct 2000 23:35:37 -0400
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Unable to boot using LVM for "/"
References: <39E21C56.B57AC5D4@attglobal.net> <20001009142342.H6371@mvista.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Charles Duffy <cduffy@mvista.com>
Cc: linux-lvm@msede.com

Charles Duffy wrote:
---------snip ----------------
> 
> "root=/dev/vg01/main" fails because the kernel, when booting, just
> determines the major/minor numbers for the root partition based on
> looking up the root device in a fixed table. What you need to do to
> get the "test" entry running is change the root to the major/minor
> number combo in hex; in my case, where /dev/vg01/root has major/minor
> number 58,3 in decimal, I pass "root=3a03" to grub and that works
> correctly.
> 
> Note that the above presumes that the initrd runs correctly. Does it?
> (Be aware that I had to add /dev/console and /dev/tty0 entries to the
> initrd to see output from the programs run from it... this may have
> been fixed by now, or maybe not).
> 
> Hope this has been of some use.

Actually, it was a great help.  I have it working now - sort of.  The
problem was in two parts. I changed the grub menu.lst to pass
"root=3a06" as you suggested and that changed some of the symptoms. When
it still didn't work as expected I reread the lvmcreate_initrd script.
It finally sunk in. The initrd creates the ram disk file system as ext2
and I had created my root LV using reiserfs.

This creates a conflict between the initrd root file system and the one
on the logical volume and the mount won't work.  I re-formatted my LV
with mke2fs and made some changes to /etc/fstab. Now it works as
expected. It looks to me like you can't use reiserfs for the root file
system unless the initrd ram disk can be created using reiserfs. I don't
think that will work.

-- 

Good Journey, longevity and prosperity to all

Les Hazelton
