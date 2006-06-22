Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5M67g9N013805
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 02:07:42 -0400
Received: from dns1.iai.co.il (dns1.iai.co.il [194.90.48.30])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5M67Yeo021333
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 02:07:35 -0400
Received: from mailgwout.iai.co.il (mailrelay.iai.co.il [172.21.4.23])
	by dns1.iai.co.il (8.12.11/8.12.11) with SMTP id k5M742Rn032720
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 09:04:02 +0200
Message-ID: <00a001c695ca$7e5b1a70$713a14ac@iai.co.il>
From: "Daniel Loney" <dloney@iai.co.il>
References: <004001c69509$fa226440$713a14ac@iai.co.il>
	<44990663.60400@conterra.de>
Subject: Re: [linux-lvm] vgchange doesn't activate the  logical volume
Date: Thu, 22 Jun 2006 09:07:16 +0200
MIME-Version: 1.0
Content-Class: urn:content-classes:message
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>

The device in question is /dev/sdb.  At the end of the vgdisplay that I=20
included you can see that the physical
volume is /dev/sdb.  sda is a volumn that doesn't exist and should be=20
disregarded.  Sorry about the confusion.

Danny


----- Original Message -----=20
From: "Dieter St=C3=BCken" <stueken@conterra.de>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Wednesday, June 21, 2006 10:42 AM
Subject: Re: [linux-lvm] vgchange doesn't activate the logical volume


> Daniel Loney wrote:
>> suse01:~ # vgdisplay -v vg02| more
>>     Using volume group(s) on command line
>>     Finding volume group "vg02"
>>   /dev/sda: read failed after 0 of 4096 at 0: Input/output error
>
> looks like a bad sector/read error on /dev/sda.
> You may verify this either by a simple
>
> dd if=3D/dev/sda of=3D/dev/null bs=3D512 iflag=3Ddirect
>
> to find the bad sectors number. Or you may run
> "badblocks -s /dev/sda", which does roughly the same.
>
> I strongly suggest to use smartctl to monitor the state of your
> disk (see http://smartmontools.sourceforge.net). Most problems
> show up here some time before your disk finally dies.
>
> Try "smartctl -d ata -a /dev/sda" to display the disks error log.
> If you did not use it before, you might have to enable it by:
> "smartctl -d ata -s on /dev/sda".
>
> All disks have spare sectors they can use, if some sector gets broken
> But the sector is not automatically replaced, as most people believe.
> This does not happen until some new data is written to that sector.
> If your bad sector occurs within the LVM metadata description of /dev/sda
> you may recover it by using "vgcfgrestore" to repair the broken LVM=20
> header.
>
> I did not use vgcfgrestore before, so I can't describe the necessary steps
> in detail. May be someone else can help here...
>
> Dieter.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
 =20
***************************************************************************=
************ =20
The information contained in this communication is proprietary to Israel Ai=
rcraft Industries Ltd. and/or third parties, may contain confidential or pr=
ivileged information, and is intended only for the use of the intended addr=
essee thereof. If you are not the intended addressee, please be aware that =
any use, disclosure, distribution and/or copying of this communication is s=
trictly prohibited. If you receive this communication in error, please noti=
fy the sender immediately and delete it from your computer. Thank you.=20
