Message-Id: <s73c32dd.084@mossergrp.com>
Date: Fri, 14 May 1999 14:27:32 -0400
From: "SHAD GUNDERSON" <sgunderson@mossergrp.com>
Subject: [linux-lvm] Volume Group Creation
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

I have successfully patched and compiled the lvm code and kernel.... and I =
am able to create the physical volumes using "pvcreate /dev/sdb[12]". =
However, the next step in the documention is where I run into problems... =
upon execution of the "vgcreate test_vg /dev/sdb[12]" I receive an error =
that no physical volumes exist.  Am I missing something. I have changed =
the system ids on the partitions. I am running kernel 2.2.8 with lvm 0.6 =
and the devfs patch for May 3rd.=20

Thanks,
shad
