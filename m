Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l93BtVGB021023
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 07:55:31 -0400
Received: from bacterio.es.clara.net (mail.es.clara.net [80.67.96.90])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l93BtOVn019282
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 07:55:24 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bacterio.es.clara.net (Postfix) with ESMTP id E93B8124C00A
	for <linux-lvm@redhat.com>; Wed,  3 Oct 2007 13:55:22 +0200 (CEST)
Received: from bacterio.es.clara.net ([127.0.0.1])
	by localhost (bacterio.es.clara.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 17985-02-19 for <linux-lvm@redhat.com>;
	Wed, 3 Oct 2007 13:55:14 +0200 (CEST)
Received: from [192.168.92.83] (ga-bcn-ar4-lpb-1.router.es.clara.net
	[80.67.96.65])
	by bacterio.es.clara.net (Postfix) with ESMTP id 138C0124C009
	for <linux-lvm@redhat.com>; Wed,  3 Oct 2007 13:55:14 +0200 (CEST)
Message-ID: <47038360.6040807@es.clara.net>
Date: Wed, 03 Oct 2007 13:56:16 +0200
From: =?ISO-8859-1?Q?Marc_Patino_G=F3mez?= <mpatino@es.clara.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Backuping "special" snapshots
References: <4703572F.8020604@es.clara.net>
	<47035C3D.2010901@redhat.com>	<47037B9A.3040209@es.clara.net>
	<47037C2D.7080302@redhat.com>
In-Reply-To: <47037C2D.7080302@redhat.com>
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

Thanks a lot Bryn! It works like a charm :)

cheers,

Marc

Bryn M. Reeves wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Marc Patino G=EF=BF=BDmez wrote:
>  =20
>> Hi again,
>>
>> I try kpartx and it's so cool, but I can't make snapshots of
>> /dev/vg00/lv00p1 ... so I can't solve the problem of making backup
>> without stopping the Virtual Machine.
>>
>> Any advice?
>>
>> Regards,
>>
>> Marc
>>
>>    =20
>
> Sorry, I thought that lv00 was the snapshot. Just create a snapshot of
> it (e.g. lv00-snap) and run kpartx against that instead.
>
> Cheers,
> Bryn.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFHA3wt6YSQoMYUY94RArTrAJ9jq6qz/upa2iacWkBlGA6tI95S3wCghRRu
> qOVm/ledC8AaycR1PZlEAWY=3D
> =3DBn6e
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  =20
