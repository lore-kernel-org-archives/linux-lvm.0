Return-Path: <smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Date: Tue, 26 Jun 2001 09:40:50 -0400
Message-ID: <000301c0fe45$9d865940$7d80a8c0@dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] pvmove error
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

=20
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Heinz:

Good news, I was lucky enough that the pe in question was near the
end of the lv, so i could reduce the fs, reduce the lv, then create
another lv of 1 pe to put there so nothing actually uses the
offset-affected pe, and bring the volume/fs back to original size...
and i checked the other pv's i have and this disk seems the only one
affected by this offset problem, so i can live with losing 4MB on
this drive :)

Thanks again!

Scott Denton
smdenton@bellsouth.net=20

-----BEGIN PGP SIGNATURE-----
Version: PGP 7.0.1

iQA/AwUBOziQ4nC+DNfF0nVpEQIOsQCeJwZH/FUu3Ni/aTOSGN4wG4P+w2YAn3gz
B9/P2B1dz5rR3Che0fN9CJyz
=3DWbbA
-----END PGP SIGNATURE-----
