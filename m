Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3REvWi4018941
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 10:57:32 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3REvVoj021904
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 10:57:31 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1QF6BG-0006eu-9b
	for linux-lvm@redhat.com; Wed, 27 Apr 2011 07:57:30 -0700
Date: Wed, 27 Apr 2011 09:57:28 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110427095728.6317526d@bettercgi.com>
In-Reply-To: <BANLkTinZzxt2c01=uN6VUXVHFsbXK2Mm6A@mail.gmail.com>
References: <BANLkTinf5PWmfm2YOMshbOUvh3+ht89jhA@mail.gmail.com>
	<alpine.LRH.2.00.1104262338440.3338@bmsred.bmsi.com>
	<BANLkTinZzxt2c01=uN6VUXVHFsbXK2Mm6A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Recovering Accidentally Destroyed LVM2 Information
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

vgcfgrestore -f /etc/lvm/archive/FILENAME VGNAME

But see "man vgcfgrestore"
--=20
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Tue, 26 Apr 2011 20:58:25 -0700
Chris Streeter <chris@chrisstreeter.com> wrote:

> > What you *should* have done is restore the metadata to the point
> > before your errant command. =C2=A0You can still do that (if it is still
> > in the archive), but the several K of zeros written to the start of
> > the LV you created will require recovery.
>=20
> So I still have all the files in the archive of the form
> raid_vg_0000*.vg
>=20
> If have those files, how would I go about restoring the metadata to
> the device? If I were to loose several K of data, I'm totally fine
> with that.
>=20
> Thanks!
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
