Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i215wt828593
	for <linux-lvm@redhat.com>; Mon, 1 Mar 2004 00:58:55 -0500
Message-Id: <200403010557.i215vC40023828@bongo.freakout.de>
From: Axel Reinhold <lvm@freakout.de>
Subject: [linux-lvm] snapshot failes with kcopyd error
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  1 14:23:04 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

i'm working with Linux 2.4.25/device-mapper: 4.0.5-ioctl and from
time to time on creating snapshots i get:

device-mapper: Could not create kcopyd client
device-mapper: error adding target to table

after that the system sometimes hangs completely.
Is there any resource low? I use snapshots intensively
and let them stay for long times.

Regards
Axel Reinhold
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAQtC4HQ9JwE2bDw0RAgIuAKD3dIJSPWoZH7G+h+SXau9dA0um5ACgqgcg
jkPRRAvXHzCLfm3QjgHkhRw=
=nZRO
-----END PGP SIGNATURE-----
