Message-ID: <508E8FA7.8090808@redhat.com>
Date: Mon, 29 Oct 2012 14:16:07 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <CAMcVf+o=RAvK9=E_khXBzVLWrY3vD9FeWwKuQC=BRoACc7nHwA@mail.gmail.com>
	<73174f8bcbb44d62139eff5fcd851635.squirrel@smail.ankh.org>
In-Reply-To: <73174f8bcbb44d62139eff5fcd851635.squirrel@smail.ankh.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Error: Doesn't contain a valid partition table
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: James Hawtin <oolon@ankh.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10/29/2012 02:08 PM, James Hawtin wrote:
> This is to be expected. because it is possible to have partition tables on
> logical volumes created by LVM. if you don't like this use the "filter"
> line in /etc/lvm/lvm.conf to include/exclude what you want to be searched.
> This is also useful if you want to exclude multipathed/mirrored devices.

fdisk is just scanning everything that it finds in /proc/partitions:

/*
 * for fdisk -l:
 * try all things in /proc/partitions that look like a full disk
 */
static void
print_all_partition_table_from_option(unsigned long sector_size)

This doesn't use the LVM2 filters so will continue to report for all
device-mapper devices when using '-l'.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlCOj6cACgkQ6YSQoMYUY96/mwCeJasISaP/K7UliUBZO8k5toQH
BcgAn21U4z8nPRXzthVPZ3qGOVeOjbR0
=BIU2
-----END PGP SIGNATURE-----
