Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06E845C207
	for <linux-lvm@redhat.com>; Tue, 29 Oct 2019 08:47:38 +0000 (UTC)
Received: from ex01.edgeware.tv (94.127.35.106.c.fiberdirekt.net
	[94.127.35.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF8E33082E1E
	for <linux-lvm@redhat.com>; Tue, 29 Oct 2019 08:47:31 +0000 (UTC)
From: Daniel Janzon <daniel.janzon@edgeware.tv>
Date: Tue, 29 Oct 2019 08:47:29 +0000
Message-ID: <A8A53B0E4B7ACF4BAD5C77D3671AC8976AB85B3B@EX01.edgeware.tv>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_A8A53B0E4B7ACF4BAD5C77D3671AC8976AB85B3BEX01edgewaretv_"
MIME-Version: 1.0
Subject: [linux-lvm] Best way to run LVM over multiple SW RAIDs?
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_000_A8A53B0E4B7ACF4BAD5C77D3671AC8976AB85B3BEX01edgewaretv_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I have a server with very high load using four NVMe SSDs and therefore no H=
W RAID. Instead I used SW RAID with the mdadm tool. Using one RAID5 volume =
does not work well since the driver can only utilize one CPU core which spi=
kes at 100% and harms performance. Therefore I created 8 partitions on each=
 disk, and 8 RAID5s across the four disks.

Now I want to bring them together with LVM. If I do not use a striped volum=
e I get high performance (in expected magnitude according to disk specs). B=
ut when I use a striped volume, performance drops to a magnitude below. The=
 reason I am looking for a striped setup is to ensure that data is spread w=
ell over the drive to guarantee a good worst-case performance. With linear =
allocation rather than striped, if load is directed to files on the first P=
V (a SW RAID) the system is again exposed to the 1-core limitation.

I tried "--stripes 8 --stripesize 512", and would appreciate any ideas of o=
ther things to try. I guess the performance hit can be in the file system a=
s well. I tried XFS and EXT4 with default settings.

Kind Regards,
Daniel


--_000_A8A53B0E4B7ACF4BAD5C77D3671AC8976AB85B3BEX01edgewaretv_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle"></style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">
<div>Hello,</div>
<div><br>
</div>
<div>I have a server with very high load using four NVMe SSDs and therefore=
 no HW RAID. Instead I used SW RAID with the mdadm tool. Using one RAID5 vo=
lume does not work well since the driver can only utilize one CPU core whic=
h spikes at 100% and harms performance.
 Therefore I created 8 partitions on each disk, and 8 RAID5s across the fou=
r disks.</div>
<div><br>
</div>
<div>Now I want to bring them together with LVM. If I do not use a striped =
volume I get high performance (in expected magnitude according to disk spec=
s). But when I use a striped volume, performance drops to a magnitude below=
. The reason I am looking for a
 striped setup is to ensure that data is spread well over the drive to guar=
antee a good worst-case performance. With linear allocation rather than str=
iped, if load is directed to files on the first PV (a SW RAID) the system i=
s again exposed to the 1-core limitation.<br>
</div>
<div><br>
</div>
<div>I tried &quot;--stripes 8 --stripesize 512&quot;, and would appreciate=
 any ideas of other things to try. I guess the performance hit can be in th=
e file system as well. I tried XFS and EXT4 with default settings.</div>
<div><br>
</div>
<div>Kind Regards, <br>
</div>
<div>Daniel</div>
<div><br>
</div>
</div>
</body>
</html>

--_000_A8A53B0E4B7ACF4BAD5C77D3671AC8976AB85B3BEX01edgewaretv_--
