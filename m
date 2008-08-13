Message-ID: <48A2B2F4.2080903@redhat.com>
Date: Wed, 13 Aug 2008 11:09:56 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM with large arrays,	one large or mutiple small
	PV's?
References: <54AA5D29CDD96948959171E0DF2990295352@EMC1.uvic.ca>
	<325343817.20080813114338@marki-online.net>
In-Reply-To: <325343817.20080813114338@marki-online.net>
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
To: Marek Podmaka <marki@marki-online.net>, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marek Podmaka wrote:
> I think from LVM side it doesn't matter if you have 10x PV of size 100
> GB or 1 PV of size 1 TB. But it really depends on the SAN disk array
> you have and how it handles each virtual disk. Does it have queues,
> caches for each vdisk or for the entire array? For example for HP EVA
> arrays it is recommended to prefer smaller vdisks if possible.

It does affect LVM - the performance of the LVM2 tools is affected by
the number of physical volumes in a volume group. Strictly speaking,
it's the number of metadata areas which defaults to one per physical
volume. This means that for large volume groups you can use the
"--metadatacopies" option to pvcreate to control the number of metadata
areas present (set it to zero for some PVs) and avoid the sluggish tool
performance you might otherwise see.

Recent releases of LVM2 improve performance for large VGs as they
perform caching of metadata read from disk under some circumstances.
There were also a series of fixes to ensure that the tools behave
correctly when they find PVs with no metadata.

See earlier threads in the archives on this subject for more information
& examples of creating VGs with reduced numbers of metadata areas.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIorLz6YSQoMYUY94RAhMRAJ4hwLFf1dGfQRmNq5+C3F/hjCwVNgCfawJJ
hm3SO7u8tJSPz23rZcwT5XQ=
=0PG6
-----END PGP SIGNATURE-----
