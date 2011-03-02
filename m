Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p22MJnmw002533
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 17:19:49 -0500
Received: from a.mx.bartk.us
	(173-10-122-205-BusName-Washington.hfc.comcastbusiness.net
	[173.10.122.205])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p22MJbXd017278
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 17:19:38 -0500
Received: from [131.107.0.94] (tide524.microsoft.com [131.107.0.94])
	by a.mx.bartk.us (Postfix) with ESMTP id 0BF2FCE05B6
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2011 14:19:36 -0800 (PST)
Message-ID: <4D6EC275.6070009@bartk.us>
Date: Wed, 02 Mar 2011 14:19:33 -0800
From: Bart Kus <me@bartk.us>
MIME-Version: 1.0
References: <4D6EA3EF.1070401@bartk.us> <4D6EA4E6.9040201@abpni.co.uk>
In-Reply-To: <4D6EA4E6.9040201@abpni.co.uk>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 3/2/2011 12:13 PM, Jonathan Tripathy wrote:
> I once used a tool called dstat. dstat has modules which can tell you=20
> which processes are using disk IO. I haven=EF=BF=BDt used dstat in a whil=
e so=20
> maybe someone else can chime in

I know the IO is only being caused by a "cp -a" command, but the issue=20
is why all the reads?  It should be 99% writes.  Another thing I noticed=20
is the average request size is pretty small:

14:06:20          DEV       tps  rd_sec/s  wr_sec/s  avgrq-sz =20
avgqu-sz     await     svctm     %util
[...snip!...]
14:06:21          sde    219.00  11304.00  30640.00    191.53     =20
1.15      5.16      2.10     46.00
14:06:21          sdf    209.00  11016.00  29904.00    195.79     =20
1.06      5.02      2.01     42.00
14:06:21          sdg    178.00  11512.00  28568.00    225.17     =20
0.74      3.99      2.08     37.00
14:06:21          sdh    175.00  10736.00  26832.00    214.67     =20
0.89      4.91      2.00     35.00
14:06:21          sdi    206.00  11512.00  29112.00    197.20     =20
0.83      3.98      1.80     37.00
14:06:21          sdj    209.00  11264.00  30264.00    198.70     =20
0.79      3.78      1.96     41.00
14:06:21          sds    214.00  10984.00  28552.00    184.75     =20
0.78      3.60      1.78     38.00
14:06:21          sdt    194.00  13352.00  27808.00    212.16     =20
0.83      4.23      1.91     37.00
14:06:21          sdu    183.00  12856.00  28872.00    228.02     =20
0.60      3.22      2.13     39.00
14:06:21          sdv    189.00  11984.00  31696.00    231.11     =20
0.57      2.96      1.69     32.00
14:06:21          md5    754.00      0.00 153848.00    204.04     =20
0.00      0.00      0.00      0.00
14:06:21    DayTar-DayTar    753.00      0.00 153600.00    203.98    =20
15.73     20.58      1.33    100.00
14:06:21         data    760.00      0.00 155800.00    205.00  =20
4670.84   6070.91      1.32    100.00

Looks to be about 205 sectors/request, which is 104,960 bytes.  This=20
might be causing read-modify-write cycles if for whatever reason md is=20
not taking advantage of the stripe cache.  stripe_cache_active shows=20
about 128 blocks (512kB) of RAM in use, per hard drive.  Given the chunk=20
size is 512kB, and the writes being requested are linear, it should not=20
be doing read-modify-write.  And yet, there are tons of reads being=20
logged, as shown above.

A couple more confusing things:

jo ~ # blockdev --getss /dev/mapper/data
512
jo ~ # blockdev --getpbsz /dev/mapper/data
512
jo ~ # blockdev --getioopt /dev/mapper/data
4194304
jo ~ # blockdev --getiomin /dev/mapper/data
524288
jo ~ # blockdev --getmaxsect /dev/mapper/data
255
jo ~ # blockdev --getbsz /dev/mapper/data
512
jo ~ #

If optimum IO size is 4MBs (as it SHOULD be: 512k chunk * 8 data drives=20
=3D 4MB stripe), but maxsect count is 255 (255*512=3D128k) how can optimal =

IO ever be done???  I re-mounted XFS with sunit=3D1024,swidth=3D8192 but=20
that hasn't increased the average transaction size as expected.  Perhaps=20
it's respecting this maxsect limit?

--Bart

PS: The RAID6 full stripe has +2 parity drives for a total of 10, but=20
they're not included in the "data zone" definitions of stripe size,=20
which are the only important ones for figuring out how large your writes=20
should be.
