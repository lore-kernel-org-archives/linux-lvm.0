Message-ID: <39E3E19E.A25E6970@attglobal.net>
Date: Tue, 10 Oct 2000 23:42:22 -0400
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Unable to boot using LVM for "/"
References: <39E21C56.B57AC5D4@attglobal.net> <20001009142342.H6371@mvista.com> <39E28E89.133996EE@attglobal.net> <20001010124051.B24659@mvista.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Charles Duffy <cduffy@mvista.com>, "linux-lvm@msede.com" <linux-lvm@msede.com>

Charles Duffy wrote:
> 
> On Mon, Oct 09, 2000 at 11:35:37PM -0400, Les Hazelton wrote:
> > Actually, it was a great help.  I have it working now - sort of.  The
> > problem was in two parts. I changed the grub menu.lst to pass
> > "root=3a06" as you suggested and that changed some of the symptoms. When
> > it still didn't work as expected I reread the lvmcreate_initrd script.
> > It finally sunk in. The initrd creates the ram disk file system as ext2
> > and I had created my root LV using reiserfs.
> >
> > This creates a conflict between the initrd root file system and the one
> > on the logical volume and the mount won't work.  I re-formatted my LV
> > with mke2fs and made some changes to /etc/fstab. Now it works as
> > expected. It looks to me like you can't use reiserfs for the root file
> > system unless the initrd ram disk can be created using reiserfs. I don't
> > think that will work.
> 
> That's interesting, as I'm using reiserfs for my root filesystem
> without issues (though getting it up was a bit of a challenge, and I
> modified lvmcreate_initrd quite heavily). I'm also quite certain that
> one can switch from a minix-based initrd to an ext2-based root.
> 
> If you wouldn't mind recounting your symptoms, I'd be curious to hear
> what happened.

At this point I am a bit confused.  I saw your note indicating you used
reiserfs for the root file system so I figured I better double check
what I had done. 

Having made the change you previously suggested, I now had one working
setup with the root on a logical volume. That filesystem was ext2. I
made another LV with a reiserfs filesystem, copied all the root
components into it and updated its etc/fstab entries. I set the
/boot/grub/menu.lst to reflect these new conditions and re-booted the
system.

Now the root filesystem on a reiserfs LV is working just fine. In fact,
I can reboot between the two different root configurations using the
exact same initrd.gz file and everything appears to be correct. The
initrd.gz file was made with an unmodified lvmcreate_initrd script. 

I can only assume I was working too late when I did the other tests. 
Sorry for any confusion I may have caused.

-- 

Good Journey, longevity and prosperity to all

Les Hazelton
