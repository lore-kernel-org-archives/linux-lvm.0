Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7FG3WV30416
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2005 12:03:32 -0400
Received: from mail.advocap.org (cfondy.advocap.org [24.196.120.30])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7FG3Qvd031073
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2005 12:03:27 -0400
Received: from [192.168.1.19] (johnm.advocap.org [192.168.1.19])
	(authenticated bits=0)
	by mail.advocap.org (8.13.4/8.13.4/Debian-3) with ESMTP id
	j7FG1Im8015935
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2005 11:01:23 -0500
Message-ID: <4300BCAE.7090007@advocap.org>
Date: Mon, 15 Aug 2005 11:02:54 -0500
From: John McMonagle <johnm@advocap.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove won't start
References: <43003501.9050301@conterra.de>
In-Reply-To: <43003501.9050301@conterra.de>
Content-Type: multipart/mixed; boundary="------------020200060705030909060508"
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

This is a multi-part message in MIME format.
--------------020200060705030909060508
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Dieter

I don't know what the odds of getting your distro to fix it but if you=20
have any plans to use pvmove or make snapshots I highly recommend you=20
load  dm_snapshot and dm_mirror in your initrd or build into the kernel.

I found the hard way that I couldn't  boot with the snapshot even if not=20
mounted with out these loaded.

In debian sarge I put
dm_snapshot
dm_mirror
 in /etc/mkinitrd/modules
and ran mkinitrd.

John

Dieter St=EF=BF=BDken wrote:

> I'm using LVM2 on kernel 2.6.12.2 and tried to perform a pvmove.
> Unfortunately I got the message:
>
> mirror: Required device-mapper target(s) not detected in your kernel
>
> I found, dm-mirror was compiled as a module, but it was not loaded.
> After a "modprobe dm-mirror" it seems to work now. Can someone tell
> me, why the module is not loaded automatically?
>
> Dieter.



--------------020200060705030909060508
Content-Type: text/x-vcard; charset=utf-8;
 name="johnm.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="johnm.vcf"

begin:vcard
fn:John McMonagle
n:McMonagle;John
org:Advocap Inc
adr;dom:;;2929 Harrison St;Oshkosh;WI;54936
email;internet:johnm@advocap.org
title:IT Manager
tel;work:920-426-0150
x-mozilla-html:FALSE
url:http://www.advocap.org
version:2.1
end:vcard


--------------020200060705030909060508--
