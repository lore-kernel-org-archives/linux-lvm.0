Message-ID: <48A18FB1.1000102@redhat.com>
Date: Tue, 12 Aug 2008 14:27:13 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Found duplicate PV 7TGP3THphAvROCTtC4OI2gZrvrAGrn15:
	using /dev/sdah not /dev/sdq Found duplicate PV
	Qbpd3ov1sd3GHCwCQHUzkI00X53lbcDC:
	using /dev/sdai not /dev/sdr Found duplicate PV
	v0YURmuRm51dfY8br0Bx7XxOOIJyV6oa: using /dev/sdt no
References: <47311dd20808120607w3a20fe0u2e776d9e86a08a9f@mail.gmail.com>
In-Reply-To: <47311dd20808120607w3a20fe0u2e776d9e86a08a9f@mail.gmail.com>
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
To: Pedro Gonzalez Zamora <pedroche5@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Pedro Gonzalez Zamora wrote:
> Hi Bryan
> 
> How can I configure multipathing if I  have scsi enviroment with multiple
> paths?

As well as the upstream documentation & website, if you are using Red
Hat Enterprise Linux or Fedora (or CentOS), take a look in the Red Hat
knowledge base:

What are the general steps for configuring a dm-multipath?
http://kbase.redhat.com/faq/FAQ_43_13026.shtm

How do I make device mapper multipath ignore my local disks when
generating the multipath maps in Red Hat Enterprise Linux 4?
http://kbase.redhat.com/faq/FAQ_85_7319.shtm

How do I configure device-mapper-multipath with an EMC Clariion SAN?
http://kbase.redhat.com/faq/FAQ_46_8983.shtm

Why I get the message "Found duplicate PV" when when a physical volume,
volume group, or logical volume is created or displayed on the EMC
powerpath or other multipathing device?
http://kbase.redhat.com/faq/FAQ_80_12135.shtm

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIoY+x6YSQoMYUY94RAoWmAJ4nZcka33RSf+Td4Hyq7oL36HcLagCggLxG
qHKdPkyMvG2mJ37qL5yg/Dw=
=D7xm
-----END PGP SIGNATURE-----
