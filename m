Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i31EsEj17742
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 09:54:14 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i31EsCjj031714
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 09:54:13 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by percy.comedia.it (Postfix) with ESMTP id ECC2534298
	for <linux-lvm@redhat.com>; Thu,  1 Apr 2004 16:54:10 +0200 (CEST)
Received: from percy.comedia.it ([127.0.0.1])
	by localhost (percy.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 28245-01-2 for <linux-lvm@redhat.com>;
	Thu,  1 Apr 2004 16:54:10 +0200 (CEST)
Received: from comedia.it (grerel4.net.external.hp.com [155.208.254.132])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by percy.comedia.it (Postfix) with ESMTP id 9BA6E34113
	for <linux-lvm@redhat.com>; Thu,  1 Apr 2004 16:54:09 +0200 (CEST)
Message-ID: <406C2D0F.50209@comedia.it>
Date: Thu, 01 Apr 2004 16:54:07 +0200
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: Re : [linux-lvm] lvm 1 unable to boot
References: <1080745179.12286.16.camel@lupin.private.cimr.cam.ac.uk>	<20040331154915.GD27360@tykepenguin.com>	<1080765764.12286.20.camel@lupin.private.cimr.cam.ac.uk>	<20040401134833.GG29222@redhat.com>
	<20040401144953.GC14646@tangerine.coulon.evette>
In-Reply-To: <20040401144953.GC14646@tangerine.coulon.evette>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Jean-Luc Coulon (f5ibh) wrote:

> Le 01.04.2004 15:48, Heinz Mauelshagen a =EF=BF=BDcrit :
>>
>> Append the kernel boot parameter "ramdisk_size=3D" and give a size in
>> kilobytes
>> (eg, 'ramdisk_size=3D16384' makes 16MB ram disks.
>=20
>=20
> I don't think so. It is not the ramdisk size which has a problem but =20
> the filesystem created to support the initrd files (/dev, /etc, =20
> modules, scripts, ...). The size of this filesystem is fixed while =20
> creating the initrd.
edit /sbin/mkinitrd and increase the size there.

L.

--=20
Luca Berra -- bluca@comedia.it
