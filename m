From: "Sean C. McCord" <lvm@lifelabs.net>
Subject: Re: [linux-lvm] VG has wrong num of PV's; won't vgscan
In-Reply-To: <20020210193549.A26435@sistina.com>
Message-Id: <Pine.LNX.4.33L0.0202131103290.15752-100000@fcofer2>
MIME-Version: 1.0
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
Date: Wed Feb 13 10:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Cc: linux-lvm@sistina.com

Thanks greatly!  That worked beautifully.

Let this me a lesson to me (again).... backup, backup, backup.


On Sun, 10 Feb 2002, Heinz J . Mauelshagen wrote:

>
> Sean,
>
> I have attached a quick hack perl script to fix your VGDA on
> /dev/ide/host0/bus1/target0/lun0/part1.
>
> Please recognize that it *just* solves the very purpose of getting your
> VG with the single PV on /dev/ide/host0/bus1/target0/lun0/part1 back!
>
> Save your metadata before you run it by
>
> dd if=/dev/ide/host0/bus1/target0/lun0/part1 bs=1k count=1024 of=vgda.sav
>
> in order to be able to redi from start in case something goes badly wrong.
>
> Regards,
> Heinz    -- The LVM Guy --
>
>
> On Sat, Feb 09, 2002 at 04:28:14PM -0500, Sean C. McCord wrote:
> > I was attempting to add another PV to my VG 'mccord', and vgextend
> > segfaulted in the middle.  After I rebooted (the kernel dumped its LVM
> > core), there was no volume group found by vgscan.
> >
> > I have seen similar posts in the archives, but most of them reference a
> > bug that was supposedly fixed before LVM 1.0, so this must not be it.
> >
> > Anyway, pvdisplay on /dev/ide/host0/bus1/target0/lun0/part1 says
> > everythings's great, and that it is PV #1 of VG mccord.
> >
> > pvdata says VG mccord has two PVs and that both are active.  The other PV,
> > though, is completely trashed.  pvdata also says that the LV seems to be
> > fine.
> >
> > I have no backup of the vgdata that I can find (they are stored on the
> > first PV...), so I can't do what many of the other people did to get their
> > VGs back.
> >
> > Is there any way to change the VG info back to having only one PV, and if
> > so, will that get vgscan to find the VG again?  If you need the debug
> > info, I can provide it.
> >
> > My system is using LVM 1.0.1-rc4, devfs, Reiserfs, and I have my root file
> > system on that VG.
> >
> > Thanks for any assistance anyone can offer,
> >
> > Sean C. McCord
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
