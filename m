Return-Path: <dablake@speakeasy.net>
From: Hcd <dablake@speakeasy.net>
Subject: Re: [linux-lvm] vgcfgrestore fails.
Date: Mon, 30 Apr 2001 07:03:48 -0500
References: <20010430160431.H19810@sistina.com>
In-Reply-To: <20010430160431.H19810@sistina.com>
MIME-Version: 1.0
Message-Id: <01043007034800.04719@vidar>
Content-Transfer-Encoding: 8bit
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

No joy on this on this method.
If you need I can supply more inforamation.
BTW I am running on an Athlon..
thor:/etc # cp /etc/lvmconf/export.conf /etc/lvmtab.d/export
thor:/etc # cp /etc/lvmconf/opt.conf /etc/lvmtab.d/opt
thor:/etc # echo -ne "export\0" > /etc/lvmtab
thor:/etc # echo -ne "opt\0" >> /etc/lvmtab
thor:/etc # vgchange -ay
vgchange -- ERROR: different structure size stored in "/etc/lvmtab.d/export" 
than expected in file vg_cfgrestore.c [line 122]
vgchange -- volume group "export" does not exist
vgchange -- ERROR: different structure size stored in "/etc/lvmtab.d/opt" 
than expected in file vg_cfgrestore.c [line 122]
vgchange -- volume group "opt" does not exist
                                                                 

On Monday 30 April 2001 11:04, you wrote:
> On Sat, Apr 28, 2001 at 12:33:58PM -0500, root wrote:
> > I am running SuSe 7.1
> > 2.4.0 kernel
> > 512M Ram
> > AhA2940U2W
> > suse lvm
> >
> > I had three volume groups and a week ago the volume group that contained
> > user had a drive crash.  I was unable to save usr but now I can not mount
> > any of my other volume groups and vgcfgrestore fails.  Is their any thing
> > I can do to get my data?
> > thor:~ # pvdisplay /dev/sdd2
> > --- Physical volume ---
> > PV Name               /dev/sdd2
> > VG Name               export
> > PV Size               8.3 GB / NOT usable 3.31 MB [LVM: 238 KB]
> > PV#                   2
> > PV Status             available
> > Allocatable           yes (but full)
> > Cur LV                1
> > PE Size (KByte)       4096
> > Total PE              2123
> > Free PE               0
> > Allocated PE          2123
> > PV UUID               ruLId0-1JoY-34Ja-oLW0-FmzV-Q5ZN-NQaZw9
> > thor:~ # pvdisplay /dev/sdc2
> > --- Physical volume ---
> > PV Name               /dev/sdc2
> > VG Name               export
> > PV Size               8.3 GB / NOT usable 3.31 MB [LVM: 238 KB]
> > PV#                   1
> > PV Status             available
> > Allocatable           yes (but full)
> > Cur LV                1
> > PE Size (KByte)       4096
> > Total PE              2123
> > Free PE               0
> > Allocated PE          2123
> > PV UUID               ynnKCX-mjlT-jeNe-9MHY-tnP2-XCIC-nbKrmq
> >
> > thor:~ # vgcfgrestore -n export /dev/sdd2
> > vgcfgrestore -- ERROR: different structure size stored in
> > "/etc/lvmconf/export.conf" than expected in file vg_cfgrestore.c [line
> > 122]
> > vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
> > "export"
>
> You are using a newer LVM versions which has different metadata definitions
> that the one which created those backups.
>
> My guess is, that you are using LVM > 0.9.1 Beta 3 *now* but created the
> backups with a lower LVM 0.9 version and you suffer from a PV uuid related
> bug preventing vgscan to find your VG.
>
>
> One way to address the situation (pressuming no VGs are active) is:
>
> - create /etc/lvmtab.d/ in case it doesn't exist
>
> - copy /etc/lvmconf/export.conf to /etc/lvmtab.d/export
>
> - echo -ne 'export\0' > /etc/lvmtab
>
> - vgchange -ay
>
> If the VG named "export" comes back to life this way (assuming that the
> user LV belongs to it) do:
>
> - lvreduce -l1 /dev/export/user
> - lvrextend -l1 /dev/export/user
>
> replace "user" with a valid LV name in case I assumed wrong.
>
> The purpose of that NULL operation in the end is, that your PV uuid list
> gets recreated by LVM >= 0.9.1 Beta 4 which should make vgscan happy again
> ;-)
>
> The last 2 commands just shrink user by 1 LE and grow it again which
> is necessary, because your export VG is *full*. This will not harm the user
> LV in the end, because the allocator has the only option to use the very
> same PE for growing which was freed before by the shrinking of user.
>
> If your VG had at least 1 free PE a lvcreate/lvremove cycle for a dummy
> LV with just 1 LE had done it as well.
>
> Please tell us if this helps you or we need to go for another solution.
>
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
