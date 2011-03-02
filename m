Received: from [10.11.8.75] (vpn-8-75.rdu.redhat.com [10.11.8.75])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p22N0do8013220
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2011 18:00:39 -0500
Message-ID: <4D6ECC25.8010502@redhat.com>
Date: Wed, 02 Mar 2011 18:00:53 -0500
From: Dave Sullivan <dsulliva@redhat.com>
MIME-Version: 1.0
References: <4D6EA3EF.1070401@bartk.us> <4D6EA4E6.9040201@abpni.co.uk>
	<4D6EC275.6070009@bartk.us>
In-Reply-To: <4D6EC275.6070009@bartk.us>
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

http://sourceware.org/systemtap/examples/

look at traceio.stp and disktop.stp

http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5/html/SystemTap=
_Beginners_Guide/index.html

On 03/02/2011 05:19 PM, Bart Kus wrote:
> On 3/2/2011 12:13 PM, Jonathan Tripathy wrote:
>> I once used a tool called dstat. dstat has modules which can tell you=20
>> which processes are using disk IO. I haven=EF=BF=BDt used dstat in a whi=
le so=20
>> maybe someone else can chime in
>
> I know the IO is only being caused by a "cp -a" command, but the issue=20
> is why all the reads?  It should be 99% writes.  Another thing I=20
> noticed is the average request size is pretty small:
>
> 14:06:20          DEV       tps  rd_sec/s  wr_sec/s  avgrq-sz =20
> avgqu-sz     await     svctm     %util
> [...snip!...]
> 14:06:21          sde    219.00  11304.00  30640.00    191.53     =20
> 1.15      5.16      2.10     46.00
> 14:06:21          sdf    209.00  11016.00  29904.00    195.79     =20
> 1.06      5.02      2.01     42.00
> 14:06:21          sdg    178.00  11512.00  28568.00    225.17     =20
> 0.74      3.99      2.08     37.00
> 14:06:21          sdh    175.00  10736.00  26832.00    214.67     =20
> 0.89      4.91      2.00     35.00
> 14:06:21          sdi    206.00  11512.00  29112.00    197.20     =20
> 0.83      3.98      1.80     37.00
> 14:06:21          sdj    209.00  11264.00  30264.00    198.70     =20
> 0.79      3.78      1.96     41.00
> 14:06:21          sds    214.00  10984.00  28552.00    184.75     =20
> 0.78      3.60      1.78     38.00
> 14:06:21          sdt    194.00  13352.00  27808.00    212.16     =20
> 0.83      4.23      1.91     37.00
> 14:06:21          sdu    183.00  12856.00  28872.00    228.02     =20
> 0.60      3.22      2.13     39.00
> 14:06:21          sdv    189.00  11984.00  31696.00    231.11     =20
> 0.57      2.96      1.69     32.00
> 14:06:21          md5    754.00      0.00 153848.00    204.04     =20
> 0.00      0.00      0.00      0.00
> 14:06:21    DayTar-DayTar    753.00      0.00 153600.00    203.98    =20
> 15.73     20.58      1.33    100.00
> 14:06:21         data    760.00      0.00 155800.00    205.00  =20
> 4670.84   6070.91      1.32    100.00
>
> Looks to be about 205 sectors/request, which is 104,960 bytes.  This=20
> might be causing read-modify-write cycles if for whatever reason md is=20
> not taking advantage of the stripe cache.  stripe_cache_active shows=20
> about 128 blocks (512kB) of RAM in use, per hard drive.  Given the=20
> chunk size is 512kB, and the writes being requested are linear, it=20
> should not be doing read-modify-write.  And yet, there are tons of=20
> reads being logged, as shown above.
>
> A couple more confusing things:
>
> jo ~ # blockdev --getss /dev/mapper/data
> 512
> jo ~ # blockdev --getpbsz /dev/mapper/data
> 512
> jo ~ # blockdev --getioopt /dev/mapper/data
> 4194304
> jo ~ # blockdev --getiomin /dev/mapper/data
> 524288
> jo ~ # blockdev --getmaxsect /dev/mapper/data
> 255
> jo ~ # blockdev --getbsz /dev/mapper/data
> 512
> jo ~ #
>
> If optimum IO size is 4MBs (as it SHOULD be: 512k chunk * 8 data=20
> drives =3D 4MB stripe), but maxsect count is 255 (255*512=3D128k) how can=
=20
> optimal IO ever be done???  I re-mounted XFS with=20
> sunit=3D1024,swidth=3D8192 but that hasn't increased the average=20
> transaction size as expected.  Perhaps it's respecting this maxsect=20
> limit?
>
> --Bart
>
> PS: The RAID6 full stripe has +2 parity drives for a total of 10, but=20
> they're not included in the "data zone" definitions of stripe size,=20
> which are the only important ones for figuring out how large your=20
> writes should be.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
