Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l93BMMQP009081
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 07:22:22 -0400
Received: from bacterio.es.clara.net (mail.es.clara.net [80.67.96.90])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l93BMFMv003782
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 07:22:15 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bacterio.es.clara.net (Postfix) with ESMTP id 25A02124C01A
	for <linux-lvm@redhat.com>; Wed,  3 Oct 2007 13:22:14 +0200 (CEST)
Received: from bacterio.es.clara.net ([127.0.0.1])
	by localhost (bacterio.es.clara.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 16730-01-2 for <linux-lvm@redhat.com>;
	Wed, 3 Oct 2007 13:22:03 +0200 (CEST)
Received: from [192.168.92.83] (ga-bcn-ar4-lpb-1.router.es.clara.net
	[80.67.96.65])
	by bacterio.es.clara.net (Postfix) with ESMTP id 52073124C00B
	for <linux-lvm@redhat.com>; Wed,  3 Oct 2007 13:22:03 +0200 (CEST)
Message-ID: <47037B9A.3040209@es.clara.net>
Date: Wed, 03 Oct 2007 13:23:06 +0200
From: =?ISO-8859-1?Q?Marc_Patino_G=F3mez?= <mpatino@es.clara.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backuping "special" snapshots
References: <4703572F.8020604@es.clara.net> <47035C3D.2010901@redhat.com>
In-Reply-To: <47035C3D.2010901@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi again,

I try kpartx and it's so cool, but I can't make snapshots of=20
/dev/vg00/lv00p1 ... so I can't solve the problem of making backup=20
without stopping the Virtual Machine.

Any advice?

Regards,

Marc


Bryn M. Reeves wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Marc Patino G=EF=BF=BDmez wrote:
>  =20
>> Hi  list,
>>
>> I am searching a way to backup a "special" logical volume. This special
>> lv doesn't contains a filesystem, it contains a hole image disk of a
>> running server (MBR,Partition Table, Partitions and filesystems), in
>> fact it is a VBD (Virtual Block Device) of a HVM Xen Guest.
>>
>> I want to be able to make the backup without shutting down the Virtual
>> Machine, but the traditional way :
>>
>> - make a snapshot
>> - mount snapshot
>> - backup the snapshots
>> - umount snapshot
>> - remove snapshot
>>
>> is not suitable for this kind of logical volumes.
>>
>> I search some information about it, but the only clue is:
>>
>> fdisk -l -u /dev/vg00/lv00
>>    =20
>
> Hi Marc,
>
> You can use the kpartx tool for this. It was originally written as part
> of multipath-tools and it allows you to map the partitions on a
> device-mapper device like an LVM2 logical volume.
>
> E.g. you would run:
>
> # kpartx -a /dev/vg00/lv00
>
> And that will scan lv00 for partitions and create new devices in
> /dev/mapper named lv00p1, lv00p2, ... that you can then use to access
> the content of the partitions.
>
> When you're done, run:
>
> # kpartx -d /dev/vg00/lv00
>
> To remove the temporary kpartx maps.
>
> Regards,
> Bryn.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFHA1w96YSQoMYUY94RAhW3AKC9n8+5tzN/FW38+qIUj0a82vvAMQCg0qYb
> bAWnKGAuyZnMoZZz089I2qg=3D
> =3D+xgZ
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  =20
