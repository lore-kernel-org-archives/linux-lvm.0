Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i23Hla829272
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 12:47:36 -0500
Received: from mwinf0404.wanadoo.fr (smtp4.wanadoo.fr [193.252.22.27])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i23Hlab20085
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 12:47:36 -0500
Received: from tangerine.coulon.evette (ADijon-107-1-19-194.w81-251.abo.wanadoo.fr [81.251.17.194])
	by mwinf0404.wanadoo.fr (SMTP Server) with ESMTP id 400823800156
	for <linux-lvm@redhat.com>; Wed,  3 Mar 2004 18:47:28 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AyaSo-0002A6-Nn
	for linux-lvm@redhat.com; Wed, 03 Mar 2004 18:47:22 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26714-01 for <linux-lvm@redhat.com>;
	Wed, 3 Mar 2004 18:47:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AyaSl-00029z-F6
	for linux-lvm@redhat.com; Wed, 03 Mar 2004 18:47:19 +0100
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?Q?Re=A0=3A?= [linux-lvm] Re: Re
Message-ID: <20040303174719.GE3465@tangerine.coulon.evette>
References: <20040302152911.GI15556@tangerine.coulon.evette> <20040302154631.GB12779@tykepenguin.com> <200403021719.i22HJk407665@ecstasy1.winternet.com> <20040303085729.GC2532@tangerine.coulon.evette> <20040303091549.GB17625@tykepenguin.com> <200403031712.i23HC8d25573@ecstasy1.winternet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline
In-Reply-To: <200403031712.i23HC8d25573@ecstasy1.winternet.com> (from kfuchs@winternet.com on mer, mar 03, 2004 at 18:12:08 +0100)
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
Date: Wed Mar  3 12:46:00 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--kVXhAStRUZ/+rrGn
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 03.03.2004 18:12, Ken Fuchs a =E9crit=A0:
>Patrick Caulfield <pcaulfie@redhat.com> wrote:
>
>>It looks like the initrd is too full to hold the LVM metadata
>>backups.  That's one of the problems with adding stuff to initrds - =20
>> it
>>takes up space that might be needed for other things!
>
>If the initrd is too full, just make it bigger.  ;)
>
>A good reason to make the initrd with plenty of empty space to begin
>with is so its easy to add additional code without running out of
>space.
>
>Sincerely,
>
>Ken Fuchs <kfuchs@winternet.com>
>

To increase the size of the initrd built by lvmcreate_initrd, I have to =20
edit this script. While I'm editing the script, it is easier to add my =20
modules in it  ;-)

--
Cheers
			- Jean-Luc
--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBARhonUdGGXzzGnNARAhXvAJ0YL9Lufzaw1+hZtIo5STPkv/xosgCgoklh
j48nHFakKwoFlUIPdMMdN+Y=
=FvTb
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
