Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0PDkggB006445
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 25 Jan 2017 08:46:42 -0500
Received: from mail.intelliad.de (mail1.intelliad.de [80.190.153.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 366DE274880
	for <linux-lvm@redhat.com>; Wed, 25 Jan 2017 13:46:40 +0000 (UTC)
From: Francois Blondel <fblondel@intelliad.de>
Date: Wed, 25 Jan 2017 13:46:36 +0000
Message-ID: <1485351995.3931.4.camel@intelliad.de>
Content-Language: de-DE
Content-ID: <91D2437A99A4BB42900C5D5A287D05A4@muc.intelliad.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM snapshot: in memory COW table
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
Content-Type: text/plain; charset="iso-8859-1"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi all,

We currently use LVM snapshot as a solution to backups block devices.
The snapshot is not active for a long time, only for the time during
which we need to upload the backup to the backup server.

As I could read, for example here: http://www.nikhef.nl/~dennisvd/lvmcr
ap.html, snapshots multiply the IO needs of the origin Logical Volume.
We would like to avoid that.

As our servers have enough free RAM, and the COW table of the
snapshot remains quite small, I had the project to store the snapshot
(or its cow table) in RAM.
The goal there is to avoid additional IO aimed at the disk and redirect
them to memory.
Yes, this would lead to the loss of the snapshot in case of power
failure, but this is not an issue for our use case.

I tried to use lvmcache with an in memory block device for the caches,
but I could not create a snapshot using lvmcache.

Any hints or experience on that?

Many thanks,

Fran=C3=A7ois Blondel
