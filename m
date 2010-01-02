Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o02AWVZW016799
	for <linux-lvm@redhat.com>; Sat, 2 Jan 2010 05:32:31 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o02AWKxl008239
	for <linux-lvm@redhat.com>; Sat, 2 Jan 2010 05:32:20 -0500
Message-ID: <4B3F1A65.90100@gmx.at>
Date: Sat, 02 Jan 2010 11:05:25 +0100
From: Sulla <Sulla@gmx.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] size of a PV > 2TB possible? (kernel with LBD support)
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear all!

I'm sorry I have to ask this question to this mailing list, but I have not
been able to find sufficient and conclusive informaiton on the web. The
mailing-list archive at redhat seems not to be searchable.

What is the maximum size of a PV in LVM2?

I run linux 2.6.24 kernel (Ubuntu server 8.04 LTS, 32bit i386) with lvm2
2.02.26 and mdadm 2.6.3.
The kernel has CONFIG_LBD=y in its configuration.

I currently use a 2TB (just under 2TB, 1.98TB actually) raid5 array /dev/mdN
as the one and only PV in a VG. I would like to grow the array by addition
of another disk to 3TB and then expand the PV.

As far as I understand mdadm, on a kernel with LBD support it should be able
to create a blockdevice >2TB, but I am not sure that LVM2 will accept it as
a PV.

The LVM2-Howto on TLDP (http://tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html)
confirms that LVs can be >2TB (16TB on 32bit OS, 8EB on 64bit OS), but says
nothing at all about PVs. Could somebody add that information?

thanx for support
kind regards,
Sulla












-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iD8DBQFLPxplR6b2EdogPFsRApOQAKCq5lWWCZEU3lOqDN0yNwtjSWTx/wCfb7Bu
m2SeTwsAeRU3008a1RvWBC8=
=IBoj
-----END PGP SIGNATURE-----
