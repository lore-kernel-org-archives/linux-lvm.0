Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6L9PPrw021501
	for <linux-lvm@redhat.com>; Mon, 21 Jul 2008 05:25:26 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m6L9PPg6010752
	for <linux-lvm@redhat.com>; Mon, 21 Jul 2008 05:25:25 -0400
Message-ID: <48845605.7010004@redhat.com>
Date: Mon, 21 Jul 2008 10:25:25 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Split LV mirror or something
References: <bf6f43f40807160121j27df33c5o5135e1fb9fdd16f1@mail.gmail.com>	<Pine.LNX.4.44.0807161020330.715-100000@bmsred.bmsi.com>
	<bf6f43f40807200925p5bb2d9a2xc22a7ff323ced6ce@mail.gmail.com>
In-Reply-To: <bf6f43f40807200925p5bb2d9a2xc22a7ff323ced6ce@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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

Levy Abinajm Melero Sant'Anna wrote:
> Dear Stuart and list,
> 
> I was thinking about snapshot and copy, but it looks like "less
> professional" than split a LV mirror.
> I can explain: When I copy is difficult to say that I kept the same
> permissions and ownership; Different of a mirror, that the process really
> guarantee by itself that the data is still with the same characteristic.

If you do a block-by-block copy (e.g. dd) then you needn't worry about
ownership/permissions. These will be preserved since you are just taking
a complete copy of the file system data.

It would be useful to have a command that could perform a data clone of
an LV in this way.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIhFYF6YSQoMYUY94RAgTvAJkBqGZRcC4g3rtmBodEe+gBT6vLzwCgtfFc
zJQpOGlDQcG5TuyyQVv+gT0=
=zeBC
-----END PGP SIGNATURE-----
