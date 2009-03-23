Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2NLO25n028965
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 17:24:02 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.234])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2NLNdWw027758
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 17:23:39 -0400
Received: by rv-out-0506.google.com with SMTP id g37so1438963rvb.3
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 14:23:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49C7ACE1.4070000@wpkg.org>
References: <49C7ACE1.4070000@wpkg.org>
Date: Mon, 23 Mar 2009 13:23:38 -0800
Message-ID: <1c748a490903231423l5fa2aaedob4c99ebdcac85fd9@mail.gmail.com>
Subject: Re: [linux-lvm] why LVM reads when I tell it to write?
From: Larry Dickson <ldickson@cuttedge.com>
Content-Type: multipart/alternative; boundary=0016e64aeb4443da500465cfe1aa
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0016e64aeb4443da500465cfe1aa
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Tomasz,

An experiment with dd to a plain file indicates its default block size is
512 bytes. Given that, the most common cause of reads when writing is that
LVM may insist on writing aligned full pages or chunks. This would force
read-modify-writes if it's not smart enough to preview enough commands to
see it's going to overwrite the whole chunk. That would be solved if the
block size is a multiple of chunk size (assuming of course that it is
aligned).

Larry Dickson
Cutting Edge Networked Storage

On 3/23/09, Tomasz Chmielewski <mangoo@wpkg.org> wrote:
>
> Why is LVM reading large amounts of data when I tell it to write only?
>
>
> For example, this is what iostat shows when writing to a raw partition
> (when doing "dd if=/dev/zero of=/dev/sdb5", iostat output every second):
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb              80.81         0.00      5171.72          0       5120
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb              78.00         0.00      4992.00          0       4992
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb              81.82         0.00      5236.36          0       5184
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb              77.00         0.00      4928.00          0       4928
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb              79.21         0.00      5069.31          0       5120
>
>
> This is what happens if we go through LVM - look how much is read before it
> actually writes anything:
>
> (when doing "dd if=/dev/zero of=/dev/test/test_volume").
>
> What's interesting, if I add i.e. bs=64k to dd, I don't see these
> unexpected
> reads on LVM any more. Why does it happen?
>
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             212.87       851.49         0.00        860          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             956.57      3826.26         0.00       3788          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb            1083.84      4335.35         0.00       4292          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb            1016.00      4064.00         0.00       4064          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb            1035.64      4142.57         0.00       4184          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb            1034.00      4136.00         0.00       4136          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             965.66      3862.63         0.00       3824          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb            1025.00      4100.00         0.00       4100          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             991.92      3967.68         0.00       3928          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb            1032.00      4128.00         0.00       4128          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb            1009.90      4039.60         0.00       4080          0
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             366.33      1330.61      4040.82       1304       3960
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb            1016.16      4060.61        76.77       4020         76
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             383.17      1394.06      4055.45       1408       4096
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             741.00      2904.00      1800.00       2904       1800
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             638.61      2475.25      2273.27       2500       2296
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             421.00      1560.00      3720.00       1560       3720
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             955.56      3802.02       501.01       3764        496
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             275.76       965.66      4016.16        956       3976
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             853.00      3384.00       840.00       3384        840
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             560.40      2130.69      3223.76       2152       3256
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             500.00      1907.07      2787.88       1888       2760
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             133.00       352.00      5296.00        352       5296
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb              53.00         0.00      6244.00          0       6244
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb             267.00       904.00      4840.00        904       4840
>
> Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
> sdb              52.00         0.00      6240.00          0       6240
>
>
>
> --
> Tomasz Chmielewski
> http://wpkg.org
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016e64aeb4443da500465cfe1aa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hello Tomasz,</div>
<div>=A0</div>
<div>An experiment with dd to a plain file indicates its default block size=
 is 512 bytes. Given that, the most common cause of reads when writing is t=
hat LVM may insist on writing aligned=A0full pages or chunks. This would fo=
rce read-modify-writes if it&#39;s not smart enough to preview enough comma=
nds to see it&#39;s going to overwrite the whole chunk. That would be solve=
d if the block size is a multiple of chunk size (assuming of course that it=
 is aligned).<br>
=A0</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br>=A0</div>
<div><span class=3D"gmail_quote">On 3/23/09, <b class=3D"gmail_sendername">=
Tomasz Chmielewski</b> &lt;<a href=3D"mailto:mangoo@wpkg.org">mangoo@wpkg.o=
rg</a>&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Why is LVM reading large amounts=
 of data when I tell it to write only?<br><br><br>For example, this is what=
 iostat shows when writing to a raw partition<br>
(when doing &quot;dd if=3D/dev/zero of=3D/dev/sdb5&quot;, iostat output eve=
ry second):<br><br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =
=A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A0 =
=A080.81 =A0 =A0 =A0 =A0 0.00 =A0 =A0 =A05171.72 =A0 =A0 =A0 =A0 =A00 =A0 =
=A0 =A0 5120<br>
<br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A0 =A078.00 =A0 =
=A0 =A0 =A0 0.00 =A0 =A0 =A04992.00 =A0 =A0 =A0 =A0 =A00 =A0 =A0 =A0 4992<b=
r><br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>
sdb =A0 =A0 =A0 =A0 =A0 =A0 =A081.82 =A0 =A0 =A0 =A0 0.00 =A0 =A0 =A05236.3=
6 =A0 =A0 =A0 =A0 =A00 =A0 =A0 =A0 5184<br><br>Device: =A0 =A0 =A0 =A0 =A0 =
=A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>s=
db =A0 =A0 =A0 =A0 =A0 =A0 =A077.00 =A0 =A0 =A0 =A0 0.00 =A0 =A0 =A04928.00=
 =A0 =A0 =A0 =A0 =A00 =A0 =A0 =A0 4928<br>
<br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A0 =A079.21 =A0 =
=A0 =A0 =A0 0.00 =A0 =A0 =A05069.31 =A0 =A0 =A0 =A0 =A00 =A0 =A0 =A0 5120<b=
r><br><br>This is what happens if we go through LVM - look how much is read=
 before it actually writes anything:<br>
<br>(when doing &quot;dd if=3D/dev/zero of=3D/dev/test/test_volume&quot;).<=
br><br>What&#39;s interesting, if I add i.e. bs=3D64k to dd, I don&#39;t se=
e these unexpected<br>reads on LVM any more. Why does it happen?<br><br><br=
>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =
=A0kB_read =A0 =A0kB_wrtn<br>
sdb =A0 =A0 =A0 =A0 =A0 =A0 212.87 =A0 =A0 =A0 851.49 =A0 =A0 =A0 =A0 0.00 =
=A0 =A0 =A0 =A0860 =A0 =A0 =A0 =A0 =A00<br><br>Device: =A0 =A0 =A0 =A0 =A0 =
=A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>s=
db =A0 =A0 =A0 =A0 =A0 =A0 956.57 =A0 =A0 =A03826.26 =A0 =A0 =A0 =A0 0.00 =
=A0 =A0 =A0 3788 =A0 =A0 =A0 =A0 =A00<br>
<br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A01083.84 =A0 =A0=
 =A04335.35 =A0 =A0 =A0 =A0 0.00 =A0 =A0 =A0 4292 =A0 =A0 =A0 =A0 =A00<br><=
br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0=
 =A0kB_read =A0 =A0kB_wrtn<br>
sdb =A0 =A0 =A0 =A0 =A0 =A01016.00 =A0 =A0 =A04064.00 =A0 =A0 =A0 =A0 0.00 =
=A0 =A0 =A0 4064 =A0 =A0 =A0 =A0 =A00<br><br>Device: =A0 =A0 =A0 =A0 =A0 =
=A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>s=
db =A0 =A0 =A0 =A0 =A0 =A01035.64 =A0 =A0 =A04142.57 =A0 =A0 =A0 =A0 0.00 =
=A0 =A0 =A0 4184 =A0 =A0 =A0 =A0 =A00<br>
<br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A01034.00 =A0 =A0=
 =A04136.00 =A0 =A0 =A0 =A0 0.00 =A0 =A0 =A0 4136 =A0 =A0 =A0 =A0 =A00<br><=
br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0=
 =A0kB_read =A0 =A0kB_wrtn<br>
sdb =A0 =A0 =A0 =A0 =A0 =A0 965.66 =A0 =A0 =A03862.63 =A0 =A0 =A0 =A0 0.00 =
=A0 =A0 =A0 3824 =A0 =A0 =A0 =A0 =A00<br><br>Device: =A0 =A0 =A0 =A0 =A0 =
=A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>s=
db =A0 =A0 =A0 =A0 =A0 =A01025.00 =A0 =A0 =A04100.00 =A0 =A0 =A0 =A0 0.00 =
=A0 =A0 =A0 4100 =A0 =A0 =A0 =A0 =A00<br>
<br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A0 991.92 =A0 =A0=
 =A03967.68 =A0 =A0 =A0 =A0 0.00 =A0 =A0 =A0 3928 =A0 =A0 =A0 =A0 =A00<br><=
br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0=
 =A0kB_read =A0 =A0kB_wrtn<br>
sdb =A0 =A0 =A0 =A0 =A0 =A01032.00 =A0 =A0 =A04128.00 =A0 =A0 =A0 =A0 0.00 =
=A0 =A0 =A0 4128 =A0 =A0 =A0 =A0 =A00<br><br>Device: =A0 =A0 =A0 =A0 =A0 =
=A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>s=
db =A0 =A0 =A0 =A0 =A0 =A01009.90 =A0 =A0 =A04039.60 =A0 =A0 =A0 =A0 0.00 =
=A0 =A0 =A0 4080 =A0 =A0 =A0 =A0 =A00<br>
<br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A0 366.33 =A0 =A0=
 =A01330.61 =A0 =A0 =A04040.82 =A0 =A0 =A0 1304 =A0 =A0 =A0 3960<br><br>Dev=
ice: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB=
_read =A0 =A0kB_wrtn<br>
sdb =A0 =A0 =A0 =A0 =A0 =A01016.16 =A0 =A0 =A04060.61 =A0 =A0 =A0 =A076.77 =
=A0 =A0 =A0 4020 =A0 =A0 =A0 =A0 76<br><br>Device: =A0 =A0 =A0 =A0 =A0 =A0t=
ps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =
=A0 =A0 =A0 =A0 =A0 =A0 383.17 =A0 =A0 =A01394.06 =A0 =A0 =A04055.45 =A0 =
=A0 =A0 1408 =A0 =A0 =A0 4096<br>
<br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A0 741.00 =A0 =A0=
 =A02904.00 =A0 =A0 =A01800.00 =A0 =A0 =A0 2904 =A0 =A0 =A0 1800<br><br>Dev=
ice: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB=
_read =A0 =A0kB_wrtn<br>
sdb =A0 =A0 =A0 =A0 =A0 =A0 638.61 =A0 =A0 =A02475.25 =A0 =A0 =A02273.27 =
=A0 =A0 =A0 2500 =A0 =A0 =A0 2296<br><br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps=
 =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0=
 =A0 =A0 =A0 =A0 =A0 421.00 =A0 =A0 =A01560.00 =A0 =A0 =A03720.00 =A0 =A0 =
=A0 1560 =A0 =A0 =A0 3720<br>
<br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A0 955.56 =A0 =A0=
 =A03802.02 =A0 =A0 =A0 501.01 =A0 =A0 =A0 3764 =A0 =A0 =A0 =A0496<br><br>D=
evice: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0=
kB_read =A0 =A0kB_wrtn<br>
sdb =A0 =A0 =A0 =A0 =A0 =A0 275.76 =A0 =A0 =A0 965.66 =A0 =A0 =A04016.16 =
=A0 =A0 =A0 =A0956 =A0 =A0 =A0 3976<br><br>Device: =A0 =A0 =A0 =A0 =A0 =A0t=
ps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =
=A0 =A0 =A0 =A0 =A0 =A0 853.00 =A0 =A0 =A03384.00 =A0 =A0 =A0 840.00 =A0 =
=A0 =A0 3384 =A0 =A0 =A0 =A0840<br>
<br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A0 560.40 =A0 =A0=
 =A02130.69 =A0 =A0 =A03223.76 =A0 =A0 =A0 2152 =A0 =A0 =A0 3256<br><br>Dev=
ice: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB=
_read =A0 =A0kB_wrtn<br>
sdb =A0 =A0 =A0 =A0 =A0 =A0 500.00 =A0 =A0 =A01907.07 =A0 =A0 =A02787.88 =
=A0 =A0 =A0 1888 =A0 =A0 =A0 2760<br><br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps=
 =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0=
 =A0 =A0 =A0 =A0 =A0 133.00 =A0 =A0 =A0 352.00 =A0 =A0 =A05296.00 =A0 =A0 =
=A0 =A0352 =A0 =A0 =A0 5296<br>
<br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =A0 =A0 =A0 =A0 =A0 =A0 =A053.00 =A0 =
=A0 =A0 =A0 0.00 =A0 =A0 =A06244.00 =A0 =A0 =A0 =A0 =A00 =A0 =A0 =A0 6244<b=
r><br>Device: =A0 =A0 =A0 =A0 =A0 =A0tps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =
=A0 =A0kB_read =A0 =A0kB_wrtn<br>
sdb =A0 =A0 =A0 =A0 =A0 =A0 267.00 =A0 =A0 =A0 904.00 =A0 =A0 =A04840.00 =
=A0 =A0 =A0 =A0904 =A0 =A0 =A0 4840<br><br>Device: =A0 =A0 =A0 =A0 =A0 =A0t=
ps =A0 =A0kB_read/s =A0 =A0kB_wrtn/s =A0 =A0kB_read =A0 =A0kB_wrtn<br>sdb =
=A0 =A0 =A0 =A0 =A0 =A0 =A052.00 =A0 =A0 =A0 =A0 0.00 =A0 =A0 =A06240.00 =
=A0 =A0 =A0 =A0 =A00 =A0 =A0 =A0 6240<br>
<br><br><br>-- <br>Tomasz Chmielewski<br><a onclick=3D"return top.js.OpenEx=
tLink(window,event,this)" href=3D"http://wpkg.org/" target=3D"_blank">http:=
//wpkg.org</a><br><br>_______________________________________________<br>li=
nux-lvm mailing list<br>
<a onclick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"mailto:=
linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.com</a><br><a oncl=
ick=3D"return top.js.OpenExtLink(window,event,this)" href=3D"https://www.re=
dhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.redhat.c=
om/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a onclick=3D"return top.js.OpenExtLink(window,event=
,this)" href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://=
tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

--0016e64aeb4443da500465cfe1aa--
