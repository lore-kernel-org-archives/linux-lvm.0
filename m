Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p22KE7BA031921
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 15:14:08 -0500
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p22KDv7N003504
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 15:13:58 -0500
Message-ID: <4D6EA4E6.9040201@abpni.co.uk>
Date: Wed, 02 Mar 2011 20:13:26 +0000
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D6EA3EF.1070401@bartk.us>
In-Reply-To: <4D6EA3EF.1070401@bartk.us>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Tracing IO requests?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com


On 02/03/11 20:09, Bart Kus wrote:
> Hello,
>
> I have the following setup:
>
> md_RAID6(10x2TB) -> LVM2 -> cryptsetup -> XFS
>
> When copying data onto the target XFS, I notice a large number of=20
> READs occurring on the physical hard drives. Is there any way of=20
> monitoring what might be causing these read ops?
>
> I have setup the system to minimize read-modify-write cycles as best I=20
> can, but I fear I've missed some possible options in LVM2 or=20
> cryptsetup. Here are the specifics:
>
> 11:43:54 sde 162.00 12040.00 34344.00 286.32 0.40 2.47 1.67 27.00
> 11:43:54 sdf 170.00 12008.00 36832.00 287.29 0.62 3.65 2.12 36.00
> 11:43:54 sdg 185.00 10552.00 37920.00 262.01 0.49 2.65 1.84 34.00
> 11:43:54 sdh 152.00 11824.00 37304.00 323.21 0.29 1.78 1.71 26.00
> 11:43:54 sdi 140.00 13016.00 35216.00 344.51 0.68 4.71 3.21 45.00
> 11:43:54 sdj 181.00 11784.00 36240.00 265.33 0.43 2.38 1.55 28.00
> 11:43:54 sds 162.00 11824.00 34040.00 283.11 0.46 2.84 1.67 27.00
> 11:43:54 sdt 157.00 11264.00 35192.00 295.90 0.65 4.14 2.29 36.00
> 11:43:54 sdu 154.00 12584.00 35424.00 311.74 0.46 2.79 1.69 26.00
> 11:43:54 sdv 131.00 12800.00 33264.00 351.63 0.39 2.75 1.98 26.00
> 11:43:54 md5 752.00 0.00 153688.00 204.37 0.00 0.00 0.00 0.00
> 11:43:54 DayTar-DayTar 752.00 0.00 153688.00 204.37 12.42 16.76 1.33=20
> 100.00
> 11:43:54 data 0.00 0.00 0.00 0.00 7238.71 0.00 0.00 100.00
>
> Where md5 is the RAID6 holding the drives right above it,=20
> DayTar-DayTar are the VG and LV respectively, and data is the=20
> cryptsetup device derived from the LV. Hard drives are set to=20
> "blockdev --setra 1024", md5 is set for stripe_cache_size of 6553 and=20
> preread_bypass_threshold of 0. XFS is mounted with the following options:
>
> /dev/mapper/data on /data type xfs=20
> (rw,noatime,nodiratime,allocsize=3D256m,nobarrier,noikeep,inode64,logbufs=
=3D8,logbsize=3D256k)
>
> And here are the format options of XFS:
>
> meta-data=3D/dev/mapper/data isize=3D256 agcount=3D15, agsize=3D268435455=
 blks
> =3D sectsz=3D512 attr=3D2
> data =3D bsize=3D4096 blocks=3D3906993152, imaxpct=3D5
> =3D sunit=3D0 swidth=3D0 blks
> naming =3Dversion 2 bsize=3D4096 ascii-ci=3D0
> log =3Dinternal bsize=3D4096 blocks=3D521728, version=3D2
> =3D sectsz=3D512 sunit=3D0 blks, lazy-count=3D0
> realtime =3Dnone extsz=3D4096 blocks=3D0, rtextents=3D0
>
> I wasn't sure how to do any kind of stripe alignment with the md RAID6=20
> given the layers in between. Here are the LVM2 properties:
>
> --- Physical volume ---
> PV Name /dev/md5
> VG Name DayTar
> PV Size 14.55 TiB / not usable 116.00 MiB
> Allocatable yes (but full)
> PE Size 256.00 MiB
> Total PE 59616
> Free PE 0
> Allocated PE 59616
> PV UUID jwcRz9-Yl0k-OHRQ-p5yR-AbAP-j09z-PCgSFo
>
> --- Volume group ---
> VG Name DayTar
> System ID
> Format lvm2
> Metadata Areas 1
> Metadata Sequence No 2
> VG Access read/write
> VG Status resizable
> MAX LV 0
> Cur LV 1
> Open LV 1
> Max PV 0
> Cur PV 1
> Act PV 1
> VG Size 14.55 TiB
> PE Size 256.00 MiB
> Total PE 59616
> Alloc PE / Size 59616 / 14.55 TiB
> Free PE / Size 0 / 0
> VG UUID X8gbkZ-BOMq-D6x2-xx6y-r2wF-cePQ-JTKZQs
>
> --- Logical volume ---
> LV Name /dev/DayTar/DayTar
> VG Name DayTar
> LV UUID cdebg4-EcCR-6QR7-sAhT-EN1h-20Lv-qIFSH8
> LV Write Access read/write
> LV Status available
> # open 1
> LV Size 14.55 TiB
> Current LE 59616
> Segments 1
> Allocation inherit
> Read ahead sectors auto
> - currently set to 16384
> Block device 253:0
>
> And finally the cryptsetup properties:
>
> /dev/mapper/data is active:
> cipher: aes-cbc-essiv:sha256
> keysize: 256 bits
> device: /dev/mapper/DayTar-DayTar
> offset: 8192 sectors
> size: 31255945216 sectors
> mode: read/write
>
> Anyone have any suggestions on how to tune this to do better at pure=20
> writing by eliminating needless reading?
>
> Thanks,
>
> --Bart
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm

I once used a tool called dstat. dstat has modules which can tell you=20
which processes are using disk IO. I haven=EF=BF=BDt used dstat in a while =
so=20
maybe someone else can chime in

Cheers
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
