Return-Path: <root@srv.sistina.com>
Date: Mon, 28 May 2001 10:49:51 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: Re: [linux-lvm] Converting my Root file system to LVM [last
Message-ID: <20010528104951.D26710@sistina.com>
References: <200105232106.f4NL6Bl01557@dixie.dyndns.org>
Mime-Version: 1.0
In-Reply-To: <200105232106.f4NL6Bl01557@dixie.dyndns.org>; from scott@dixie.dyndns.org on Wed, May 23, 2001 at 05:06:12PM -0400
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 23, 2001 at 05:06:12PM -0400, S. Michael Denton wrote:
> If I read my older posts correctly (and I've also done this for a while
> myself too), it's not a big deal if you don't vgchange -an... I've only
> recently started doing it and haven't really seen any difference in the vg
> stability.

There is *no* problem avoiding "vgchange -an" *today* because nothing is written
to disk running it.

The command tries to unload the LVM metadata from the kernel therefore
deactivating VGs and the access to LVs which can't work unless *all* LVs of
all VGs are closed (no FS mounted etc.).

However this might change in the future in regard that a metadata update might
be necessary.

Regards,
Heinz    -- The LVM Guy --


>  As far as extending root, I've always used ext2online so I
> didn't need to worry about it.	But if you haven't prepared your root
> filesystem with the online resizers you can only go so far with the resize
> (group descriptor boundary was it?) before you'd have to unmount and do the
> miniroot option.
> 
> Hope this helps!
> 
> raheesom@navpoint.com wrote:
> > On 23 May 2001 10:49:13 -0600, Andreas Dilger wrote:
> > > Rupert Heesom writes:
> > > 
> > > Yes, you can do that...  However, once you have LVM you should start to
> 
> > > think differently about "partitions" and such.  You can create a lot of
> 
> > > small partitions for different needs.
> > > 
> > > Why is this useful?  Because it makes moving stuff around, updating the
> 
> > > OS, etc easier.  You can have multiple OS installs, but keep your /home
> 
> > > and /mp3 data available to both.  You can put /mp3 on a new disk and it
> 
> > > will spin down when you are not listening to them.	You can put
> /var/log
> > > and /var/spool/mail on different LVs so that lots of logs or lots of
> > > email don't make your system unusable.
> > 
> > Tnx for the advise here.  I'll try to start thinking in those terms.
> > 
> > I've now got one more question which I'll post in this msg -
> > 
> > I've discovered that my /etc/rc.d/init.d/halt script is set up
> > incorrectly for LVM.	When I previously installed LVM, I followed
> > instructions, and put a "vgchange -an" into the halt script just after
> > /proc is umounted.
> > 
> > What I'm finding now is that when I'm shutting the PC down, vgchange is
> > complaining that it can't close the VG down because there's an active
> > partition (something like that).  I've had a look at the halt script,
> > and I can't figure out exactly how umounting the LV & deactivating the
> > VG would work.
> > 
> > I put a tentative line right above the "/sbin/vgchange -an" saying
> > "umount /dev/vg/root".   However, if I'm unmounting root BEFORE
> > deactivating the VG, then the system won't find the /sbin/vgchange util
> > will it?  
> > 
> > I do have  /boot/initrd-lvm-2.4.3.gz which is used at boot time.  This
> > ramdisk does have /sbin/vgchange in it (which you probably know).  If
> > root is unmounted when /sbin/vgchange is called, will the system use the
> > ramdisk?   If so, how does it know to use it?   (I'm kinda new to
> > figuring out how ramdisks work, I just follow instructions and they
> > work!)
> > 
> > Once I'm satisfied that my LVM setup is not good, then I'm going to try
> > taking the plunge & extending the LV to my other disk.
> > 
> > BTW, since my other disk still has the old file system on it, is this
> > filesystem wiped when I change partition type to "8e", or when I create
> > a PV on it, or not at all?  I can't think that anything but the e2fsadm
> > extending the LV file system onto the other disk will wipe the previous
> > contents out.
> > 
> > -- 
> > regs
> > rupert
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> > 
> > 
> 
> --------------------------------------------------------------------------
> Scott Denton
> smdenton@bellsouth.net
> EFNet Handle: SteelWyng
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
