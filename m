Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1GElVi30260
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 09:47:31 -0500
Received: from mwinf0102.wanadoo.fr (smtp1.wanadoo.fr [193.252.22.30])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1GElUb29239
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 09:47:30 -0500
Received: from tangerine.coulon.evette (ADijon-107-1-27-15.w81-48.abo.wanadoo.fr [81.48.171.15])
	by mwinf0102.wanadoo.fr (SMTP Server) with ESMTP id 5080F1BE7BBD
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 15:47:24 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1Ask1r-00073t-4Z
	for linux-lvm@redhat.com; Mon, 16 Feb 2004 15:47:23 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02559-10 for <linux-lvm@redhat.com>;
	Mon, 16 Feb 2004 15:47:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1Ask1p-00073m-7k
	for linux-lvm@redhat.com; Mon, 16 Feb 2004 15:47:21 +0100
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?B?UmWg?=
	=?iso-8859-1?Q?=3A?= [linux-lvm] LVM 1 volumes and 2.6.2 kernel
Message-ID: <20040216144720.GE2517@tangerine.coulon.evette>
References: <200402151804.14727.dhill@nacnud.force9.co.uk> <20040216142123.GA30713@antimony.msp.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline
In-Reply-To: =?UTF-8?Q?=3C20040216142123=2EGA30713=40an?=
	=?UTF-8?Q?timony=2Emsp=2Eredhat=2Ecom=3E_=28from_alewis=40redhat=2Ecom_on?=
	=?UTF-8?B?IGx1biwgZul2?= 16, 2004 at 15:21:23 +0100)
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 16 09:46:03 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--3siQDZowHQqNOShm
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 16.02.2004 15:21, AJ Lewis a =E9crit=A0:
>On Sun, Feb 15, 2004 at 06:04:14PM +0000, Duncan Hill wrote:
>> Silly me decided a month or so back to migrate to 2.6, but I forgot
>that I
>> had a LVM1 installation on my portable drive.  Said installation
>doesn't
>> seem to work now - even with dm-mod loaded, I get errors about
>> /dev/mapper/control.  What parts am I missing?
>>
>> Fedora Core 1
>> 2.6.2 kernel
>> lvm1 and lvm2 packages installed.
>
>There is a script called devmap_mknod.sh in the device mapper =20
> tarball's
>scripts directory - you need to run this script to create
>/dev/mapper/control.  I don't know for sure, but I'd guess that it is
>included in the debian packages for device-mapper.

In sid, the script is part of the libdevmapper1.00 package, it is =20
located in /usr/share/doc/libdevmapper1.00/

--
Regards
			- Jean-Luc


--3siQDZowHQqNOShm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAMNf4UdGGXzzGnNARAm2dAKCjSwmxoaOYpoMSEHQyPRajVnUqjQCaAlyd
/xpz7gtIoiMTuP5TwCsw7/U=
=AD+R
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
