Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mAEFQaZM017823
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:26:36 -0500
Message-Id: <D82FFB21-60ED-4A6C-AAA7-F8B6A76E398A@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <491D34F3.7030108@knebb.de>
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] pvmove --abort does nothing
Date: Fri, 14 Nov 2008 09:25:32 -0600
References: <491BF3CF.2090800@knebb.de>	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
	<491D34F3.7030108@knebb.de>
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

I would look at the LVM metadata found in /etc/lvm/backup, or /etc/lvm/=20
archive to find out more about the pvmove volume.  You can of course =20
edit the metadata by hand to achieve the result you want.  Why the =20
initial problem occurred, I don't know... and it may be too late to =20
know.  :(

  brassow

On Nov 14, 2008, at 2:21 AM, Christian V=EF=BF=BDlker wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> meanhwhile I did a "vgsplit" and the pvmove0 LV went together with one
> LV to the new VG while the old VG seems to be ok now.
>
> Looks like it is attached to this particular LV. Unfortunately, this =20
> is
> the largest LV and it would be hard to move the data over...
>
> Any further ideas?
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFJHTTz0XNIYlAXmzsRAqAPAJ9GZh5sto3GAg4qqmkEPVipA8TLUQCeODdZ
> HvE8ErHDUJtI2MFROONaCt8=3D
> =3DNGly
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
