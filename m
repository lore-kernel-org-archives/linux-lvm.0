Received: from thunderbird6.fab.redhat.com (vpn-6-7.fab.redhat.com [10.33.6.7])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mALBCRo8002857
	for <linux-lvm@redhat.com>; Fri, 21 Nov 2008 06:12:28 -0500
Message-ID: <492696EE.3070709@redhat.com>
Date: Fri, 21 Nov 2008 11:09:34 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Share Volume Group between x86-64 and x86.
References: <38bdcd1f0811210309k67f7ed36uc45fe0848374739@mail.gmail.com>
In-Reply-To: <38bdcd1f0811210309k67f7ed36uc45fe0848374739@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Masanari Iida wrote:
> Hello list,
> 
> I have a question about LVM2 compatibility between different CPU architectures.
> 
> If one create a VG on x86(32bit) and export the VG,
> then try to import the VG on x86(64bit), what is going to happen?
> Both systems are RHEL5, in my mind.

It will work just fine - LVM2 metadata is in text format and the binary
components (labels, metadata area headers) are treated in an
architecture-neutral way to avoid compatibility problems.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iEYEARECAAYFAkkmlu4ACgkQ6YSQoMYUY96KwgCguVHo5eKjFo5s8YxgFYBAcA8V
GN8AnRG//aoroZCSEZFlaNioxmg+V4ob
=dvTs
-----END PGP SIGNATURE-----
