Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5R7eVu09963
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 03:40:31 -0400
Received: from adren.mine.nu (adren.mine.nu [81.56.37.44])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5R7eP2M016887
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 03:40:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by adren.mine.nu (Postfix) with ESMTP id 2A9EF2808A
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 09:40:22 +0200 (CEST)
Received: from adren.mine.nu ([127.0.0.1])
	by localhost (adren [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 00715-05 for <linux-lvm@redhat.com>;
	Mon, 27 Jun 2005 09:40:21 +0200 (CEST)
Date: Mon, 27 Jun 2005 09:40:21 +0200
From: Cyril Chaboisseau <cyril.chaboisseau@free.fr>
Subject: Re: [linux-lvm] nbd messages
Message-ID: <20050627074021.GA30139@adren.mine.nu>
References: <20050625225609.GA13510@adren.mine.nu>
	<1119842714.17343.28.camel@grandmother.littlebald.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1119842714.17343.28.camel@grandmother.littlebald.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

 Le 26 juin vers 23:25, David Johnston =EF=BF=BDcrivait:
> > since a couple of months I've got the following messages at boot :
> >=20
> > nbd0: Request when not-ready
> > end_request: I/O error, dev nbd0, sector 0
> > Buffer I/O error on device nbd0, logical block 0
> > Buffer I/O error on device nbd0, logical block 1
> > Buffer I/O error on device nbd0, logical block 2
>=20
> nbd is the Network Block Device, a kernel module that allows you to
> access a block device on a remote host as if it were a local block
> device.
>=20
> Are you using LVM over nbd?

no

>  If not, I would probably try to tell LVM to ignore the nbd* devices
>  (if I recall correctly, add "r/nbd*/" to the beginning of the filter
>  line in /etc/lvm/lvm.conf).

thanks, it works

now, I don't know why those nbd devices just popped up like that


anyway, it's fine now


--=20
	Cyril Chaboisseau
