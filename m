Date: Tue, 11 Sep 2001 19:26:43 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Message-ID: <20010911192643.A31067@vestdata.no>
References: <E15f13v-0003bs-00@hermes.sistina.com> <E15fJux-0005Kk-00@hermes.sistina.com> <20010910001643.A19424@vestdata.no> <E15gELn-0004OG-00@hermes.sistina.com> <20010910103952.B31660@vestdata.no> <20010910132709.G31313@sistina.com> <20010910173851.A3751@vestdata.no> <20010911163120.F20767@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010911163120.F20767@sistina.com>; from mauelshagen@sistina.com on Tue, Sep 11, 2001 at 04:31:20PM +0200
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

On Tue, Sep 11, 2001 at 04:31:20PM +0200, Heinz J . Mauelshagen wrote:
> > Sep  6 18:15:51 argus kernel: lvm -- lvm_blk_ioctl: unknown command 5=
87
> > Sep  6 18:15:55 argus last message repeated 213 times
> > Sep  6 18:15:55 argus kernel: hdd: read_intr: status=3D0x59 { DriveRe=
ady SeekComplete DataRequest E rror }
> > Sep  6 18:15:55 argus kernel: hdd: read_intr: error=3D0x40 { Uncorrec=
tableError }, LBAsect=3D11801433 2, sector=3D118014332
> > Sep  6 18:15:55 argus kernel: end_request: I/O error, dev 16:40 (hdd)=
, sector 118014332
>=20
> Ragnar, the block ioctl error the lvm driver shows is not related to th=
e locking
> of a physical extent, because that is achived by the PE_LOCK_UNLOCK ioc=
tl
> (0x50 BTW) using the character ioctl function.
> Wasn't able to find that ioctl grepping the kernel sources.
> Could it be some application checking devices regularly like a desktop
> CD-ROM tool or something?

Could it be badblocks?


> I gues your problem was just the dying disk and therefore temporarily a=
voiding
> the read() check in pv_move_pe() should have catched this one as well.

I ran pv_move with debugging enabled, and it showed that it died in
lock_pe(). I'll try to reproduce this next time I find I broken disk.



--=20
Ragnar Kj=F8rstad
Big Storage
