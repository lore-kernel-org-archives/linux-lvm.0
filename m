Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mADAchl3026953
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 05:38:43 -0500
Message-Id: <361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <491C019F.6060205@knebb.de>
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] pvmove --abort does nothing
Date: Thu, 13 Nov 2008 04:37:40 -0600
References: <491BF3CF.2090800@knebb.de>
	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
	<491C019F.6060205@knebb.de>
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

couldn't hurt to post all of the LVs starting with 'vg1' (table and =20
status).

Also, the latest backup for vg1 out of /etc/lvm might be nice too.

  brassow

On Nov 13, 2008, at 4:29 AM, Christian V=EF=BF=BDlker wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Yohoo!
>> prompt> dmsetup status
>> and
>> prompt> dmsetup table
> Both report several line for each LV, but empty for the pvmove0:
>
> "vg1-pvmove0:"
>
> Nothing more. Do you need the lines from the other LVs?
>
> Thanks for trying to help!
>
> Christian
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFJHAGf0XNIYlAXmzsRAuGLAJ9gA3Xc0DIZybrO6f0OQagfrUzOvQCgtBID
> 5DQIHKtzPj2Bp6lfWAH5tAI=3D
> =3DMa56
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
