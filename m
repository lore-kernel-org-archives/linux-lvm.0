Date: Tue, 11 Sep 2001 16:31:20 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Message-ID: <20010911163120.F20767@sistina.com>
References: <E15f13v-0003bs-00@hermes.sistina.com> <E15fJux-0005Kk-00@hermes.sistina.com> <20010910001643.A19424@vestdata.no> <E15gELn-0004OG-00@hermes.sistina.com> <20010910103952.B31660@vestdata.no> <20010910132709.G31313@sistina.com> <20010910173851.A3751@vestdata.no>
Mime-Version: 1.0
In-Reply-To: <20010910173851.A3751@vestdata.no>; from lvm@ragnark.vestdata.no on Mon, Sep 10, 2001 at 05:38:51PM +0200
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 10, 2001 at 05:38:51PM +0200, Ragnar Kj=F8rstad wrote:
> On Mon, Sep 10, 2001 at 01:27:09PM +0200, Heinz J . Mauelshagen wrote:
> > But I wonder, why in your case the locking of the PE failed. Are you =
able to=20
> > reporduce your case and provide the error code?
>=20
> It was reproducable at the time - now the disk in question has been
> replaced. If it's interesting enough, I can make a phone call and see i=
f
> I can get the broken disk back.
>=20
> The error_occured in the pe_lock() call at the beginning of the
> move-operation - the one that I commented out in patch.
>=20
> This is the kernel-log from the time (well, I think it was from the tim=
e
> I ran pe_move):
> Sep  6 18:10:01 argus kernel: hdd: dma_intr: status=3D0x51 { DriveReady=
 SeekComplete Error }
> Sep  6 18:10:01 argus kernel: hdd: dma_intr: error=3D0x10 { SectorIdNot=
Found }, LBAsect=3D155058176, sector=3D0
> Sep  6 18:10:01 argus kernel: lvm -- lvm_blk_ioctl: unknown command 587
> Sep  6 18:10:01 argus kernel: hdd: dma_intr: status=3D0x51 { DriveReady=
 SeekComplete Error }
> Sep  6 18:10:01 argus kernel: hdd: dma_intr: error=3D0x10 { SectorIdNot=
Found }, LBAsect=3D155058176, sector=3D0
> Sep  6 18:10:01 argus kernel: lvm -- lvm_blk_ioctl: unknown command 587
>=20
> and:
>=20
> Sep  6 18:15:51 argus kernel: lvm -- lvm_blk_ioctl: unknown command 587
> Sep  6 18:15:55 argus last message repeated 213 times
> Sep  6 18:15:55 argus kernel: hdd: read_intr: status=3D0x59 { DriveRead=
y SeekComplete DataRequest E rror }
> Sep  6 18:15:55 argus kernel: hdd: read_intr: error=3D0x40 { Uncorrecta=
bleError }, LBAsect=3D11801433 2, sector=3D118014332
> Sep  6 18:15:55 argus kernel: end_request: I/O error, dev 16:40 (hdd), =
sector 118014332

Ragnar, the block ioctl error the lvm driver shows is not related to the =
locking
of a physical extent, because that is achived by the PE_LOCK_UNLOCK ioctl
(0x50 BTW) using the character ioctl function.
Wasn't able to find that ioctl grepping the kernel sources.
Could it be some application checking devices regularly like a desktop
CD-ROM tool or something?

I gues your problem was just the dying disk and therefore temporarily avo=
iding
the read() check in pv_move_pe() should have catched this one as well.

Regards,
Heinz    -- The LVM Guy --

>=20
> The kernel is standard 2.4.8 without the LVM-patches. The usersspace
> tools are version 1.0.1-rc2.
>=20
>=20
>=20
>=20
> --=20
> Ragnar Kj=F8rstad
> Big Storage
>=20
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
