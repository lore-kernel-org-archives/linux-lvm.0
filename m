Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Problems: reiserfs lvm as /
Date: Mon, 21 May 2001 21:15:45 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJOELKIOAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <01052111134000.00579@mama>
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
To: linux-lvm@sistina.com

The init ramdrive is on ext2 filesystem.
The kernel only allows e2fs or minixfs on ramdisk.

Hence e2fs or minixfs must be built into the kernel.


> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Peter Kirk
> Sent: Monday, May 21, 2001 9:14 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Problems: reiserfs lvm as /
>
>
> Am Sonntag, 20. Mai 2001 22:38 schrieben Sie:
> > Peter Kirk wrote:
> > > Hi,
> > >
> > > I am new to LVM, and I ran into some problems.
> > > First thing I did, was to setup LVM within the SuSE7.1 setup
> tools, which
> > > worked out fine.
> > > /boot is not on LVM, ext2fs
> > > swap is not on LVM
> > > LVM:
> > >         /       [reiserfs]
> > >         /usr    [reiserfs]
> > >         /home   [reiserfs]
> > >
> > > I have too disks, so I set the strip option to two, to get better
> > > performance. Now I want to compile a new kernel (2.4.4), and
> I cannot get
> > > lvm working with it. Since root is on LVM I need to do this
> > > lvmcreate_initrd stuff, but it does not work ! I get:
> > >
> > > VFS: Mounted root (ext2 file system).
> >
> >                      ^^^^
> >
> > What a hell ext2fs does with your reiserfs filesystem??
> > Do you have compiled reiser as a module or in kernel?
> > Do you have included and loaded reiserfs from your initrd
> > if it is a module?
> > Why in a case when your root is on reiserfs, you included
> > ext2 in kernel?
> >
> ext2fs and reiserfs are built into the Kernel, as it always
> worked, until I
> got LVM. I think there is some stuff in the Kernel Config missing, that I
> should have - perhaps initial RAM disk stuff ? What do I need for that ?
>
> > Ummm... :)
> >
> > > attempt to access beyond end of device
> > > 01:00: rw=0, want=4612, limit=4096
> >
> > Doh!  Ext2 code should check more carefully if it
> > mounted (or attempted to) ext2 fs -- what a bizzare,
> > ext2 code treats reiserfs as ext2fs!..
> >
> > Regards,
> >  Michael.
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
>
