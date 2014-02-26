Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1QH4heP008916
	for <linux-lvm@redhat.com>; Wed, 26 Feb 2014 12:04:43 -0500
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.120])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1QH4f8o008075
	for <linux-lvm@redhat.com>; Wed, 26 Feb 2014 12:04:41 -0500
Message-ID: <530E1EA8.9020301@ubuntu.com>
Date: Wed, 26 Feb 2014 12:04:40 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] libdevmapper's handling of devices with spaces in the
	name
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

So if I tell dmsetup to create a device named 'foo bar' it ends up
actually naming it 'foo\x20bar'.  If I run parted on 'foo\x20bar', it
appears that libdevmapper helpfully tries to unescape the name,
returning 'foo bar' from dm_task_get_name().  Unfortunately, such a
dev node does not actually exist so this creates a problem trying to
open it.

This seems like a bug in libdevmapper.  I'd say the name of the actual
dev node should not be escaped in the first place.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJTDh6oAAoJEI5FoCIzSKrwDQgH/ikb56o0nnptlD98L1dW9LNi
pZQL7IixpwVCLHrI2DBIZvtGAQKgrN16lMLIkLnH7LzRXNaw9Lkw/QG9Jgs+Zibm
fd5yYTgHlOCCsw8OEIOoXLT3YRWB6fjsWrGuFo9/SnJQpZVjxeLCGoopIkusNd6A
aP8BnX4iWl/eJgs/4gOuFjbimckDui5jYnp4ZJ8ena7a+tv1H/rywPkboOlKrz2+
/dI9WMJYFyUYqaVgZCXstBStCQTF6156HZAkB+qqwAo2um9SP+yQlU7zqixieK9T
h/Rd7MuDHPe+TObNVmLRRXJ1+c2yoEKa8ra8WH+C/G7u2V6qtzZf0CfSMzk0p+A=
=wPZ8
-----END PGP SIGNATURE-----
