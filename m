Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1CEwxYG000775
	for <linux-lvm@redhat.com>; Tue, 12 Feb 2013 09:58:59 -0500
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.120])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1CEwvFn014975
	for <linux-lvm@redhat.com>; Tue, 12 Feb 2013 09:58:58 -0500
Message-ID: <511A58B0.3080509@ubuntu.com>
Date: Tue, 12 Feb 2013 09:58:56 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Data alignment
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

I have been getting warnings from mke2fs lately that my logical
volumes are not aligned properly.  I am using a raid5 array as a pv
and it has a 1.5 MB stripe width, so logical volumes should be aligned
to that, but it appears lvm is not doing this.

It looks like you can specify this alignment at pvcreate time, but I
don't think I did and it doesn't seem to have been picked up
automatically.  Is there a way to change this without rebuilding the vg?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJRGliwAAoJEJrBOlT6nu75u38IANP/fcPpeXdzymKzDBmKFjJ/
hVSR0Ig8lcym3nbL9wCz/PIGRrta5j9M2lVrIoMP68iTcywqsyON7f+iPN3f20MO
v3Vjm0kRET4rw8inJE2g+6o5RlOAn+45vN6G6LtkncPFEo8MhxwHO2EMno3nql7Y
Ds5eFd9OjK8BkpUaMjzUJR61of5SL32HXTAm7mVMXSzV1IIzFvSMq8P5bzI6GGnx
mtoMqcND64+5AvU/FBnmB12k0MVNbnpLRvj1CZnhM8rrHu5cN921O1zK3M8rZ7sb
vk9GalquS+AuELBwLOiY2t6a5ebW2aWB4Yi2docdOjudeN1y7LrvgmNmhIbxE+k=
=C45A
-----END PGP SIGNATURE-----
