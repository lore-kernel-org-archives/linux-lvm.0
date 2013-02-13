Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1DFh9PU020932
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2013 10:43:09 -0500
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.120])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1DFh741003136
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2013 10:43:07 -0500
Message-ID: <511BB48A.3010009@ubuntu.com>
Date: Wed, 13 Feb 2013 10:43:06 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove doesn't work the way the man page says
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

LVM 2.02.66-4ubuntu7 on Ubuntu 12.04 LTS:

The man page for pvmove says it creates many temporary mirror segments
to sync each segment then breaks the mirror and mirrors the next
segment, thus allowing the move to be resumed after a reboot
approximately where it left off.

This does not appear to be the case.  Looking at dmsetup table during
a move of two logical volumes, there is one mirror segment for the
entire logical volume being moved, and a linear for the next logical
volume.  So it appears that logical volumes are copied as a whole unit
and a reboot will restart the copy from the beginning.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJRG7SKAAoJEJrBOlT6nu75v9EIANJebrBr5xmUEVV6yp0Kd7pT
rYqmpt3+VTvp433IgNQ+AaFyP637Bi14EZc9j+2KHas7nw9aNCPcqYSry5VvqyXG
1VMu5v3/af8f49KauZnMyFPkfroIBWOpzCe1d3XcyRHrzNCbnosYhLP2V6VsbOh8
Vs7DcJhJjxnCsSKfvQ6SoQZmQeGwe+DHxoUpAB2kXuRf1JTBFlu5VB90ETGmLTyr
WAW5SgFiv0F87w72MDxH8AFdNu80tQSjqXSiKcCNsGgvldncGu/wPbFjWDBTa7R4
/vsbsD10Kg64QZCLobie75uBC2cdLB2a4LFDVei4rwNEd/Ofs3Pt0uSG64IF0ao=
=iRzK
-----END PGP SIGNATURE-----
