Received: from hex.gsslab.fab.redhat.com (desk-22-98.gsslab.fab.redhat.com
	[10.33.22.98])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBLCo9Tu000961
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2015 07:50:11 -0500
Date: Mon, 21 Dec 2015 12:50:08 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20151221125008.GB16946@hex.gsslab.fab.redhat.com>
References: <5677F0E5.5050101@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5677F0E5.5050101@gmail.com>
Subject: Re: [linux-lvm] Extend VG - Expand LUN vs New Disk
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Dec 21, 2015 at 08:30:29AM -0400, Jorge F=EF=BF=BDbregas wrote:
> Are there any major differences between expanding an existing LUN
> (already striped & mirrored on storage-array) and use pvresize &
> "lvextend -r ..." vs adding a new disk to your VG when you need to
> expand an existing filesystem?
=20
Expanding an existing LUN may involve resizing partitions - that is
normally the step that makes this the more complicated route since
depending on system configuration and use it may not be easy to resize
the partition without downtime (the Linux kernel has for some time
enforced restrictions on resizing in-use partitions - device-mapper
devices and whole disk devices do not share this limitation).

> At work we do the latter and almost everyone believes expanding an
> existing LUN is not a safe operation.  Is there really a preferred
> method? Or is it just a matter of personal preference?

It's safe enough - it's just that the kernel generally won't let you
do it while the existing partition is active and in use.

Expanding an existing partition may be seen as the "cleaner" option,
since it avoids creating additional PVs and associated labels and
metadata areas, but unless you are working with very large numbers of
devices it makes little difference to most operations.

Gluing lots of devices together is one of the main reasons for using a
volume manager and for typical uses it adds no appreciable overhead
or additional complexity.

Regards,
Bryn.
