Return-Path: <russell@coker.com.au>
From: Russell Coker <bofh@coker.com.au>
Date: Sun, 17 Dec 2000 09:17:09 +0100
MIME-Version: 1.0
Message-Id: <0012170917090F.00774@lyta>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Fwd: [md@Linux.IT: LVM tools broken on PPC (and many other archs)]
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
To: md@Linux.IT
Cc: linux-lvm@sistina.com

This is a general LVM driver issue, and therefore something that's more=20
appropriate for the main LVM developers to deal with, as don't have acces=
s to=20
non-Intel hardware and I don't have the knowledge of LVM driver internals=
=20
that these people have it doesn't make sense for me to try and deal with =
this.

I am sending this message to the LVM mailing list, hopefully someone ther=
e=20
can resolve this issue.

----------  Forwarded Message  ----------
Subject: [md@Linux.IT: LVM tools broken on PPC (and many other archs)]
Date: Sun, 17 Dec 2000 01:39:48 +0100
From: Marco d'Itri <md@Linux.IT>
To: russell@coker.com.au


Please add this fix to your LVM package, it's needed on most
architectures.

--
ciao,
Marco
Date: Fri, 15 Dec 2000 18:07:27 +0100
From: Marco d'Itri <md@Linux.IT>
To: linux-lvm-patch@ez-darmstadt.telekom.de
Cc: andrea@suse.de
Subject: LVM tools broken on PPC (and many other archs)
Message-ID: <20001215180727.A1985@wonderland.linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=3Dus-ascii
Content-Disposition: inline
User-Agent: Mutt/1.3.12i

pv_get_size() tries parsing the MBR, but that fails on PPC because of
the different endianess from what the function expects.

The result is that the tools think the partition is as big as the whole
disk, and everything seems to work until you put enough data in the
file system and some of the non existent blocks are used (the kernel
will complain and return EIO, but at least it does not explode).

=46rom the changelog I see Andrea Arcangeli contributed a very crude
workaround for the alpha platform, which has the same endianess of i386
but (I suppose) a different disk label format.
The same "fix" works for PPC too (and sparc, and so on), so I think the
#ifndef __alpha__ at the beginning of lib/pv_get_size.c should really be
#ifdef __i386__ until some better code is written (FYI, you can find
byte swapping code within fdisk).

The fix needs to be fixed too, because other code will expect something
in the buffer pointed by the second argument. I just added that at the
end of the function:

        if (dummy)
                memset(dummy, 0, sizeof (struct partition));

With this fix, everything seems to work fine.

--
ciao,
Marco

-------------------------------------------------------

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
