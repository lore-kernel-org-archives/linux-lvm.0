Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0MDQEO14256
	for <linux-lvm@redhat.com>; Sat, 22 Jan 2005 08:26:14 -0500
Received: from server6.hostpoint.ch (server6.hostpoint.ch [217.26.52.16])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0MDQ8Mp022207
	for <linux-lvm@redhat.com>; Sat, 22 Jan 2005 08:26:08 -0500
Message-ID: <41F25463.7020902@markus.org>
Date: Sat, 22 Jan 2005 14:25:55 +0100
From: Markus Baertschi <markus@markus.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Why the dramatic increase in filesystem performance
	when usingxfs????
References: <1106304669.3943.14.camel@grma-lap>
In-Reply-To: <1106304669.3943.14.camel@grma-lap>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Gary.Mansell@ricardo.com, LVM general discussion and development <linux-lvm@redhat.com>


If you browse through the extensive filesystem benchmarks at

http://fsbench.netnation.com/

You'll find results quite similar to yours. XFS is performing well for=20
large sequential operations while ext3 without the writeback option can=20
be half the speed.

I usually use ext3 for the OS volumes only, except with SuSE where=20
reiser3 is the default. For other filesystems I prefer jfs for no=20
exceptionally good reason but that I came to like it on AIX.

Markus


Gary Mansell wrote:
> Hi,
>=20
> I have always run ext3 filesystem with journalling on Redhat AS as it is
> the only supported filesystem.
>=20
> One of my colleagues runs xfs, though, and on comparable hardware
> configs he gets twice the performance compared to my ext3 tests.
>=20
> The test that I perform is to create a file at least twice the size of
> the RAM installed in the system to avoid the possibility of cacheing,
> measuring the time to write and read the file back gives me the
> performance figure that I am after. I realise that this is a very simple
> test of large sequential IO but it is good enough for my needs.
>=20
> ie
>=20
> Write test:
>=20
> # time dd if=3D/dev/zero of=3D./testfile bs=3D16384 count=3D250000 ; time=
 sync
>=20
> Read test:
>=20
> # time dd if=3D./testfile of=3D/dev/null bs=3D16384
>=20
>=20
> As the xfs performance comes back about twice the performance of ext3
> for this test I am of the opinion that xfs must be cheating somehow. It
> has always been my opinion that the IO bottleneck is the hardware and
> not the filesystem hence changing the filesystem but using the same
> hardware should not make a huge difference to performance (you still
> have to get the same amount of data out to disk at the end of the day)
>=20
> I am struggling to comprehend how xfs can cheat, though, as it can't
> cache such a huge file as there is not enough memory. Is it perhaps
> cheating because the file is comprised entirely of zero's?
>=20
> Can someone please enlighten me
>=20
> Thanks in advance
>=20
> Gary Mansell


--=20
   Markus Baertschi             Phone: ++41 (21) 807 1677
   Bas du Ross=EF=BF=BD 14b             Fax  : ++41 (21) 807 1678
   CH-1163, Etoy                Email: markus@markus.org
   Switzerland                  Homepage: www.markus.org
