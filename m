Return-Path: <root@srv.sistina.com>
Date: Thu, 26 Apr 2001 12:49:17 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Cannot unmount my /usr partition.....
Message-ID: <20010426124917.A10653@sistina.com>
References: <3AE7D6AA.895E9C79@gecpalau.com> <20010426111618.A10148@sistina.com> <3AE7EF66.DAD1F737@gecpalau.com>
Mime-Version: 1.0
In-Reply-To: <3AE7EF66.DAD1F737@gecpalau.com>; from glenn@gecpalau.com on Thu, Apr 26, 2001 at 06:50:30PM +0900
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

On Thu, Apr 26, 2001 at 06:50:30PM +0900, Glenn Shannon wrote:
> Ah cool!
> 
> Thanks Heinz!

Happy to hear that it works now :-)

> 
> That worked.....apparently some stupid admin *cough*me*cough*.....forgot to put
> on the -a flag when cp'ing from the old usr partition to the LVM usr
> partition....
> 
> Heh. Just another thing to watch out for, boys and girls, when performing an
> LVM enhancement to a pre-installed machine.....better way to do it would probably
> have been to just tar the whole thing up and untar it to the freshly mounted /usr
> directory...but hindsight is always 20/20 right?
> 
> Doing the lsof|grep /usr >/root/lsof.output in the /etc/rc.d/init.d/halt script
> right before the / partition was remounted read-only gave me an output file I
> could then use to see what the major malfunction was...and now I am happily
> rebooting with green across the board..
> 
> Thanks again!
> 
> I now have a completely working LVM/Reiser/DevFS machine going :)
> 
> Now if only I could resize my / partition (2GB that I could use for
> LVMing......there isn't a way to get the / directory as LVM is there?????) I
> would be in happy-camperland..

Basically you can if you follow the HOWTO link at www.sistina.com.
If you have a look at our Web site and open the LVM pulldown to the left,
you'll find the "LVM root filesytem HOWTO" under "Howtos" there.

This is very basically supported today so be prepared to path a snake pit ;-)
Kepp in mind to have actual backups :)

> 
> Till the next time I screw things up and needlessly bother developers about it :)

Don't worry about it. It is quite often the only hint to make things better!

Regards,
Heinz    -- The LVM Guy --

> 
> Glenn
> 
> "Heinz J. Mauelshagen" wrote:
> 
> > On Thu, Apr 26, 2001 at 05:04:58PM +0900, Glenn Shannon wrote:
> > > Hi all!
> > >
> > > Great job on LVM...loving it so far..just have a quick question if I
> > > may..
> > >
> > > Here is my current setup:
> > > RH 6.2 with misc updates (PAM GlibC etc.)
> > > 2.4.3 kernel with LVM Patch and ReiserFS Patch
> > > Compiled in (of special note) are ReiserFS support, DevFS support with
> > > automount at boot option enabled, and LVM 0.9.1Beta7(from patch made in
> > > the PATCHES dir of sourcetree).
> > >
> > > Boots fine (better than fine!) and devfs reiser and lvm seem to play
> > > well together while they are running...... but upon shutdown I cannot
> > > unmount my /usr partition for some reason it is busy.
> > >
> > > I have hacked the init scripts to let me reboot successfully (as it IS a
> > > production machine with automatic reboot times entered in the cron) but
> > > it cannot deactivate my LVM due to the /usr partition being busy.
> >
> > Have you already tried to put an "lsof|grep '/usr/';sleep SomeTime" into your
> > shutdown script before the umount in order to find the bad guy(s) aka
> > processes ;-) which have files still open?
> > Then you might enhance scripts to shut them down correctly.
> >
> > In general: there's no danger related to not running "vgchange -a n" on your
> >             VG(s) because nothing is written to the PVs at all today.
> >
> > >
> > > Current slicing setup:
> > >
> > > LVM Name is warlock1
> > > size is 11.48GB
> > > 2.48GB Free
> > >
> > > Mount Point    Partition    type        size
> > > /                        /dev/hda4    ext2        2G (not LVM)
> > > /usr           /dev/warlock1/usr  reiserfs  6GB (LVM)
> > > /root        /dev/warlock1/root reiserfs 1GB (LVM)
> > >
> > >
> > > Any ideas here guys?
> > > Other than that little hiccup, I'm having a GREAT time setting up and
> > > messing with LVM!
> > >
> > >
> > > Glenn
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >
> > --
> >
> > Regards,
> > Heinz    -- The LVM Guy --
> >
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> >
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> >
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
