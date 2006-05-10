Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4AKQpmf008726
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 16:26:51 -0400
Received: from sarajevo.idealx.com (sarajevo.idealx.com [213.41.87.90])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4AKQfs8011194
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 16:26:41 -0400
Received: from localhost (sarajevo [127.0.0.1])
	by sarajevo.idealx.com (IDEALX S.A.S Mail Daemon) with ESMTP id
	0AA8811E024
	for <linux-lvm@redhat.com>; Wed, 10 May 2006 22:26:50 +0200 (CEST)
Received: from sarajevo.idealx.com ([127.0.0.1])
	by localhost (sarajevo.idealx.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22044-32 for <linux-lvm@redhat.com>;
	Wed, 10 May 2006 22:26:45 +0200 (CEST)
Message-ID: <44624C66.4050600@idealx.com>
Date: Wed, 10 May 2006 22:26:14 +0200
From: Dominique Quatravaux <dom@idealx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] [BUG] Spaces in LVM1 LV names => *deep trouble* when
 converting to LVM2
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
Cc: pierre.machard@idealx.com, Benoit Picaud <benoit@idealx.com>, 'Mathias BROSSARD' <mbrossard@idealx.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi, I encountered a very serious bug with LVM today. I'm using
lvm2-2.01.04-5 from Debian stable, kernel 2.6.17-rc3

# lvm version
  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.6.0

What I did:

    * created a LV in an LVM1 VG using EVMS (yeah, I know) with a
      space in the name (yeah, yeah, I know, I know :-));
    * converted the VG to LVM2 using vgconvert;
    * as a result the space in the LVM1 metadata was converted over
      into a space in LVM2 textual metadata, which causes a nice
      "Parse error line 123" for every subsequent LVM command on that
      VG, including "vgcfgrestore"...

Of course I did that on the root VG of my work laptop (Backups? What
backups?) and ended up in the aforementioned pickle. I tried some dd
stunts to overwrite the space with a dash, having discovered the
correct offset and block size with strace() (which for the record were
respectively one block and 2560 bytes, YMMV) - But bummer, some
wiseguy put a CRC32 checksum in there! :-) I had to recompile a custom
version of lvm that passes NULL as the checksum_fn parameter to
text_vg_import_fd (again for the record, that's a trivial one-line
patch in function _vg_read_raw_area, in format-text.c around line 286).

The situation definitely needs some fixing. My humble suggestions:

    * vgconvert should surface-test the LVM1 metadata as strictly as
      the command-line "lvcreate" tool does on its arguments;
    * there should be a mechanism for dealing with corrupt LVM
      metadata, at the minimum a global command-line switch to
      temporarily disable checksum verifications.

Now investigating backup software *real seriously* :-) Thanks for your
work on the Linux LVM suite,

- --
Dominique QUATRAVAUX                           Ing=EF=BF=BDnieur senior
01 44 42 00 08                                 IDEALX

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEYkxmMJAKAU3mjcsRApAFAJ4tCEJ0pK1bIBWruaq5VDu2izf75gCeKQCC
zzsNGFC6lPaRBvpRy2am/TM=3D
=3Dad0C
-----END PGP SIGNATURE-----
