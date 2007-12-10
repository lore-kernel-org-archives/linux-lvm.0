Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lBAFTDbF004294
	for <linux-lvm@redhat.com>; Mon, 10 Dec 2007 10:29:13 -0500
Message-ID: <475D5B49.6090800@redhat.com>
Date: Mon, 10 Dec 2007 15:29:13 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Is LVM2 available on upstream kernel?
References: <475D598B.3010809@qlogic.com>
In-Reply-To: <475D598B.3010809@qlogic.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Seokmann Ju wrote:
> Is LVM2 available on upstream kernel?
> If so, where is the source located in the tree?
> If not, can anyone share with me if there is any efforts going on to make this happen?

LVM2 is a purely user space application - there are no kernel components
to LVM itself. Instead, it uses the general device-mapper framework to
manage mapped devices. This is part of the mainline 2.6 kernel (you'll
find the code in the drivers/md directory in the kernel sources).

LVM2 sources are available here:

http://sourceware.org/lvm2/

Kind regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHXVtJ6YSQoMYUY94RAhxzAJ4kPAy+D0MAWDYjxs1j4Nm54q2nZgCeLojh
rEECKr5BaLJropqHxVEpeKM=
=McFL
-----END PGP SIGNATURE-----
