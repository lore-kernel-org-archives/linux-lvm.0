Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0OMF7K5001534
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 17:15:07 -0500
Received: from mars.math-info.univ-paris5.fr (mars.math-info.univ-paris5.fr
	[193.48.200.18])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0OMEiKp026082
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 17:14:44 -0500
Received: from [127.0.0.1] (mars.math-info.univ-paris5.fr [127.0.0.1])
	by mars.math-info.univ-paris5.fr (8.14.1/jtpda-5.4) with ESMTP id
	m0OMEg8b010498
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 23:14:42 +0100
Message-ID: <47990DD2.1020001@math-info.univ-paris5.fr>
Date: Thu, 24 Jan 2008 23:14:42 +0100
From: =?ISO-8859-1?Q?Fran=E7ois_Patte?=
	<francois.patte@math-info.univ-paris5.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] naive questions
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bonsoir,

I would like to change my linux install and I need to modify /home which
is now like this:

__________________________|__________
         sdc1                 sdb2 = 4126 extends

If I reduce /home by 4127 extends may I be sure that /home will now stay
on sdc1 only?


I have another question question related to this one: when I created
this /home volume, I could not master the fact that it will be on two
different physical disks.

Was it possible to be aware of this before discoring it after install?

What happens if sdb disk crashes? Shall I loose all my data in /home?

Thanks for attention.

- --
Fran�ois Patte
UFR de math�matiques et informatique
Universit� Paris Descartes
45, rue des Saints P�res
F-75270 Paris Cedex 06
T�l. +33 (0)1 44 55 35 61
http://www.math-info.univ-paris5.fr/~patte
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHmQ3RdE6C2dhV2JURAsSpAJ9YO7+RpmQ3o41t0NKqBPNHjVV+YACdFoR7
eFdOuOgABlGTa0pxSOFXOic=
=sDyH
-----END PGP SIGNATURE-----
