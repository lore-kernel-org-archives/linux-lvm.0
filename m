Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8BBIMr28462
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 07:18:22 -0400
Received: from copilotconsulting.com (ip-66-181-5-46.cust.i2bnetworks.com
	[66.181.5.46])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8BBIDvS019942
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 07:18:16 -0400
Received: from localhost (copilotconsulting.com [127.0.0.1])
	by copilotconsulting.com (Postfix) with ESMTP id 11C0FA933F
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 04:08:34 -0700 (PDT)
Received: from copilotconsulting.com ([127.0.0.1])
	by localhost (copilotconsulting.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 11740-09 for <linux-lvm@redhat.com>;
	Sat, 11 Sep 2004 04:08:30 -0700 (PDT)
Date: Sat, 11 Sep 2004 04:08:30 -0700
From: Tracy R Reed <treed@copilotconsulting.com>
Message-ID: <20040911110830.GC32306@copilotconsulting.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline
Subject: [linux-lvm] massive LV corruption
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I am running Fedora Core 1 with stock RedHat kernel 2.4.22-1.2188.nptl. I
filled my /usr/local to 100% and decided I needed some more space so I ran
the lvextend and resize_reiserfs commands like I have done many times
before to add a couple gig to the volume. A few hours later I began
noticing very strange behaviors. My .vimrc file was filled with garbage.
All of my email disappeared. Lots of filesystem errors began appearing on
the console.  I rebooted the machine and upon the reboot my entire /home
logical volume was nowhere to be found. The /usr/local lv existed but the
fs was corrupted very badly. I tried restoring the lvm config with vgcfg
restore to no avail. I tested the memory with memtest and found no
problems. I did a non-destructive badblocks test of all 80G of the drive
with everything unmounted and / mounted RO and came up with no problems.
The symptoms really look like disk was allocated improperly and diskspace
already in use got overwritten. I have saved a bunch of output from
various lvm commands and other things and the backup vgcfg file from right
after I made the change which probably caused the damage in case they are
of use to someone. They can be found here:
=20
http://ultraviolet.org/tmp

Unfortunately I had to get the server back up and running so I didn't have
time to try to reproduce it or do any more debugging although I am afraid
to use lvm on this box now. I eventually deleted the corrupted lv's and
remade from scratch and all seems well for the moment. I am SO glad to
have made a backup a couple days before so I didn't lose too much.

--=20
Tracy Reed                     The attachment is a digital signature.
http://copilotconsulting.com   More info: http://copilotconsulting.com/sig

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBQtyu9PIYKZYVAq0RAjpdAKCFMs3z80xJbpbwILlL8N9d32DVIwCgjsLe
c4M0nUHaX4M9Cy+CqpYszAw=
=9+KO
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
