Date: Mon, 10 Sep 2001 17:38:51 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Message-ID: <20010910173851.A3751@vestdata.no>
References: <E15f13v-0003bs-00@hermes.sistina.com> <E15fJux-0005Kk-00@hermes.sistina.com> <20010910001643.A19424@vestdata.no> <E15gELn-0004OG-00@hermes.sistina.com> <20010910103952.B31660@vestdata.no> <20010910132709.G31313@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010910132709.G31313@sistina.com>; from mauelshagen@sistina.com on Mon, Sep 10, 2001 at 01:27:09PM +0200
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

On Mon, Sep 10, 2001 at 01:27:09PM +0200, Heinz J . Mauelshagen wrote:
> But I wonder, why in your case the locking of the PE failed. Are you ab=
le to=20
> reporduce your case and provide the error code?

It was reproducable at the time - now the disk in question has been
replaced. If it's interesting enough, I can make a phone call and see if
I can get the broken disk back.

The error_occured in the pe_lock() call at the beginning of the
move-operation - the one that I commented out in patch.

This is the kernel-log from the time (well, I think it was from the time
I ran pe_move):
Sep  6 18:10:01 argus kernel: hdd: dma_intr: status=3D0x51 { DriveReady S=
eekComplete Error }
Sep  6 18:10:01 argus kernel: hdd: dma_intr: error=3D0x10 { SectorIdNotFo=
und }, LBAsect=3D155058176, sector=3D0
Sep  6 18:10:01 argus kernel: lvm -- lvm_blk_ioctl: unknown command 587
Sep  6 18:10:01 argus kernel: hdd: dma_intr: status=3D0x51 { DriveReady S=
eekComplete Error }
Sep  6 18:10:01 argus kernel: hdd: dma_intr: error=3D0x10 { SectorIdNotFo=
und }, LBAsect=3D155058176, sector=3D0
Sep  6 18:10:01 argus kernel: lvm -- lvm_blk_ioctl: unknown command 587

and:

Sep  6 18:15:51 argus kernel: lvm -- lvm_blk_ioctl: unknown command 587
Sep  6 18:15:55 argus last message repeated 213 times
Sep  6 18:15:55 argus kernel: hdd: read_intr: status=3D0x59 { DriveReady =
SeekComplete DataRequest E rror }
Sep  6 18:15:55 argus kernel: hdd: read_intr: error=3D0x40 { Uncorrectabl=
eError }, LBAsect=3D11801433 2, sector=3D118014332
Sep  6 18:15:55 argus kernel: end_request: I/O error, dev 16:40 (hdd), se=
ctor 118014332

The kernel is standard 2.4.8 without the LVM-patches. The usersspace
tools are version 1.0.1-rc2.




--=20
Ragnar Kj=F8rstad
Big Storage
