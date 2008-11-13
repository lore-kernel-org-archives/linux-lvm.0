Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mADAPOKD025597
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 05:25:24 -0500
Message-Id: <C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <491BF3CF.2090800@knebb.de>
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] pvmove --abort does nothing
Date: Thu, 13 Nov 2008 04:24:21 -0600
References: <491BF3CF.2090800@knebb.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Might be interesting to know what dmsetup says...

prompt> dmsetup status
and
prompt> dmsetup table

  brassow

On Nov 13, 2008, at 3:30 AM, Christian V=EF=BF=BDlker wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Yohoo!
>
> Regarding to another thread (pvmove and 100% IO Wait) I had to =20
> reboot my
> server during a pvmove.
>
> Now I have a pvmove0 LV which seems to be locked.
> A "pvmove"  does nothing.
> Same for "pvmove --abort".
> Nothing happens- I can't remove the pvmove0 LV neither continue with =20
> the
> pvmove operation!
>
> How can I get out of here?
>
> Thanks!
>
> Christian
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFJG/PP0XNIYlAXmzsRAvLtAJ9oD5GrLwdtHhf9dzbxOoZoQKLkYACgoLfS
> 5pT48VLTB2t93MJdiMfA8Xo=3D
> =3DsN2X
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
