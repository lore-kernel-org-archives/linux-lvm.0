Return-Path: <root@srv.sistina.com>
Date: Wed, 18 Jul 2001 16:47:13 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan can't find vg after system crash
Message-ID: <20010718164713.A24438@sistina.com>
References: <87117853BCEBD4118E9F0000D11E22E208D413@MRAGVS23.DPMA.DE>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87117853BCEBD4118E9F0000D11E22E208D413@MRAGVS23.DPMA.DE>; from Volker.Jahns@dpma.de on Tue, Jul 17, 2001 at 04:05:30PM +0200
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, Jul 17, 2001 at 04:05:30PM +0200, Jahns Volker Dr. wrote:
> huh, that worked!

Good to hear :)

>=20
> Howto to backup the VGDA after upgrade? Is there any recipe?
> Could you direct me to any relevant url, please.

vgcfgbackup(8)

"man lvm" gives the hint to that tool.

BTW: every change yo umake to the VG configuration will create a metadata
     backup automatically. But you can run vgcfgbackup at any arbitrary
     point in time to be sure, that /etc/lvmconf contains an actual one.
     Don't forget to include /etc/lvmconf in your backup strategy!

Regards,
Heinz    -- The LVM Guy --


>=20
> > -----Urspr=EF=BF=BDngliche Nachricht-----
> > Von:	Heinz J. Mauelshagen [SMTP:Mauelshagen@sistina.com]
> > Gesendet am:	Dienstag, 17. Juli 2001 15:26
> > An:	linux-lvm@sistina.com
> > Betreff:	Re: [linux-lvm] vgscan can't find vg after system crash
> >=20
> > On Tue, Jul 17, 2001 at 02:49:43PM +0200, Jahns Volker Dr. wrote:
> > > vgscan will not find any volume groups after system crash, where one =
pv
> > was
> > > lost.
> > >=20
> > >=20
> > > pvdisplay reports
> > > 	--- Physical volume ---
> > > PV Name               /dev/hdb3
> > > VG Name               vg01
> > > PV Size               5.86 GB / NOT usable 264 KB [LVM: 235 KB]
> > > PV#                   1
> > > PV Status             NOT available
> > > Allocatable           yes (but full)
> > > Cur LV                1
> > > PE Size (KByte)       4096
> > > Total PE              1500
> > > Free PE               0
> > > Allocated PE          1500
> > > PV UUID               /dev/h-db3
> > >=20
> > > Other than vgscan I have tried to restore by using the vgcfgrestore t=
ool
> > >=20
> > > cp /etc/lvmconf/vg01.conf /etc/lvmtab.d/vg01
> > > echo -ne 'vg01\0' >/etc/lvmtab
> > >=20
> > > vgcfgrestore -n vg01 exits w/ error message:
> > >=20
> > > vgcfgrestore -- ERROR: different structure size stored in
> > > "/etc/lvmconf/vg01.conf" than expected in file vg_cfgrestore.c [line
> > 120]
> > > vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
> > "vg01"
> >=20
> > You seem to have upgraded the LVM software and didn't take metadata
> > backups
> > afterwards. Sorry, in order to use that old backup, you need to downgra=
de=20
> > the software again :-(
> >=20
> >=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
