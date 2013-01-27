Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0R6pIHn017493
	for <linux-lvm@redhat.com>; Sun, 27 Jan 2013 01:51:18 -0500
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0R6pG5m025713
	for <linux-lvm@redhat.com>; Sun, 27 Jan 2013 01:51:17 -0500
Received: by mail-ee0-f44.google.com with SMTP id l10so830814eei.31
	for <linux-lvm@redhat.com>; Sat, 26 Jan 2013 22:51:16 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 27 Jan 2013 06:51:16 +0000
Message-ID: <CAOS+5GGR1yPe5_dWJ8H8fjXXvVMKVX=xfWg4LhxYHv_ECMLaJg@mail.gmail.com>
From: Another Sillyname <anothersname@googlemail.com>
Content-Type: multipart/alternative; boundary=047d7b66fc194b2c8204d43f968b
Subject: [linux-lvm] LVM resize broken file system....
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

--047d7b66fc194b2c8204d43f968b
Content-Type: text/plain; charset=ISO-8859-1

I had a 487G LVM that contained a single partition and a swap partition.

On the data partition I had 86G free that I needed to use elsewhere.

All the following have been done from a recovery disk so the data is all
still intact.

When I tried to resize to 400G it wouldn't  let me stating below mjnimum
size...

sudo resize2fs -p /dev/pathto/lvmdevice 400G

However mounting it df -h reports

                                                 Size      Used     Free
/dev/pathto/lvmdevice        487G   377G     86G

or in 4k blocks

/dev/pathto/lvmdevice         127571672     98643758    22449438

So I was forced to run the resize2fs in tye default 4k mode

sudo resize2fs -p /dev/pathto/lvmdevice 105000000

This should give me a sufficient overhead and finished correctly

I then did

sudo lvresize -L /dev/pathto/lvmdevice

This also appeared to be successful.

However I can't mount it as it's reporting wrong fs type, bad option etc
error.

I think I've identified the problem as a mismatch on ghe block count.

Even though I resized to 105000000 blocks I now see that df -h reported the
size as 103352144 before I did the  lvresize (I didn't notice at the time)

So I think the discrepancy between the  block count size reported by df at
103352144 and tune2fs at 105000000 is the error.

How can I change the block count number reported by tune2fs from 105000000
to 103352144 that will then allow me to run e2fsck again?

Thanks





-- 
Sent from Tablet

--047d7b66fc194b2c8204d43f968b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I had a 487G LVM that contained a single partition and a swap partition.<br=
><br>On the data partition I had 86G free that I needed to use elsewhere.<b=
r><br>All the following have been done from a recovery disk so the data is =
all still intact.<br>
<br>When I tried to resize to 400G it wouldn&#39;t =A0let me stating below =
mjnimum size...<br><br>sudo resize2fs -p /dev/pathto/lvmdevice 400G<br><br>=
However mounting it df -h reports<br><br> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Size =A0=
 =A0 =A0Used =A0 =A0 Free<br>
/dev/pathto/lvmdevice =A0 =A0 =A0 =A0487G =A0 377G =A0 =A0 86G<br><br>or in=
 4k blocks<br><br>/dev/pathto/lvmdevice =A0 =A0 =A0 =A0 127571672 =A0 =A0 9=
8643758 =A0 =A022449438<br><br>So I was forced to run the resize2fs in tye =
default 4k mode<br><br>sudo resize2fs -p /dev/pathto/lvmdevice 105000000<br=
>
<br>This should give me a sufficient overhead and finished correctly<br><br=
>I then did <br><br>sudo lvresize -L /dev/pathto/lvmdevice<br><br>This also=
 appeared to be successful.<br><br>However I can&#39;t mount it as it&#39;s=
 reporting wrong fs type, bad option etc error.<br>
<br>I think I&#39;ve identified the problem as a mismatch on ghe block coun=
t.<br><br>Even though I resized to 105000000 blocks I now see that df -h re=
ported the size as 103352144 before I did the =A0lvresize (I didn&#39;t not=
ice at the time)<br>
<br>So I think the discrepancy between the =A0block count size reported by =
df at 103352144 and tune2fs at 105000000 is the error.<br><br>How can I cha=
nge the block count number reported by tune2fs from 105000000 to 103352144 =
that will then allow me to run e2fsck again?<br>
<br>Thanks<br><br><br><br><br><br>-- <br>Sent from Tablet<br>

--047d7b66fc194b2c8204d43f968b--
