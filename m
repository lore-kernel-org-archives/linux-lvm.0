Received: from thunderbird6.fab.redhat.com (vpn-6-28.fab.redhat.com
	[10.33.6.28])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mA6HnAkq031966
	for <linux-lvm@redhat.com>; Thu, 6 Nov 2008 12:49:11 -0500
Message-ID: <49132D61.7060604@redhat.com>
Date: Thu, 06 Nov 2008 17:46:09 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] should I be concerned that pvdisplay shows PV Size
	is	1024 when it's really 2047 GB?
References: <8D07631D47C3CB4F867AD7BCF07D5C2307F48A@excs01.bucoks>
In-Reply-To: <8D07631D47C3CB4F867AD7BCF07D5C2307F48A@excs01.bucoks>
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

James A. Dinkel wrote:
> This is rather odd.  The partition is actually 2047 GB (full size of the disk), but pvdisplay reports the PV Size as 1024.00 GB.  Another oddity is if you take the PE Size and multiply it by the Total PE, then it comes out as the correct 2047 GB.  It seems like something I could safely ignore, but this is going to be a critical production server and I would like to hear from more experiences persons if I should be concerned about this:
> 
>   --- Physical volume ---
>   PV Name               /dev/sde1
>   VG Name               vg-samba-data1
>   PV Size               1024.00 GB / not usable 8192.00 EB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              524030
>   Free PE               524030
>   Allocated PE          0
>   PV UUID               e3ubYN-DZtL-Ee1M-yaNC-mRif-KVB6-166mVR
> 
> Here is the version of lvm2 installed on RedHat EL 5:
> 
> [brazen@server2 ~]$ rpm -qa | grep lvm
> lvm2-2.02.16-3.el5

That's a pretty old release - the current package for RHEL 5 on RHN
should be lvm2-2.02.32-4.el5. There were some display bugs fixed in
older releases, so it's worth checking with the updated package.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iEYEARECAAYFAkkTLWEACgkQ6YSQoMYUY96ABACffOyDVYhFctdsF81u0PHwQ2Gf
ouYAnR/tclgE3TKndR31yAXgnGdYYXZa
=lIDN
-----END PGP SIGNATURE-----
