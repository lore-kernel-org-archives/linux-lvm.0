Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i6FKZqsL011834
	for <linux-lvm@redhat.com>; Thu, 15 Jul 2004 22:35:53 +0200
Date: Thu, 15 Jul 2004 22:35:53 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Message-ID: <20040715203553.GA18626@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] *** Announcement: dmraid 1.0.0-rc2 ***
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


               *** Announcement: dmraid 1.0.0-rc2 ***

Following a good tradition, dmraid 1.0.0-rc2 is available at
http://people.redhat.com:/~heinzm/sw/dmraid/ in source and i386 rpm,
before I leave for a 2 weeks vacation trip followed by LWE ;)

Won't read my email before July, 30th.

dmraid (Device-Mapper Raid tool) discovers, [de]activates and displays
properties of software RAID sets (ie. ATARAID) and contained DOS
partitions using the device-mapper runtime of the 2.6 kernel.

The following ATARAID types are supported on Linux 2.6:

Highpoint HPT37X
Highpoint HPT45X
Intel Software RAID
Promise FastTrack
Silicon Image Medley

This ATARAID type can be discovered only in this version:
LSI Logic MegaRAID

Please provide insight to support those metadata formats completely.

Thanks.

See files README and CHANGELOG, which come with the source tarball for
prerequisites to run this software, further instructions on installing
and using dmraid!

CHANGELOG is contained below for your convenience as well.


Call for testers:
-----------------

I need testers with the above ATARAID types, to check that the mapping
created by this tool is correct (see options "-t -ay") and access to the ATARAID
data is proper.

You can activate your ATARAID sets without danger of overwriting
your metadata, because dmraid accesses it read-only unless you use
option -E with -r in order to erase ATARAID metadata (see 'man dmraid')!

This is a release candidate version so you want to have backups of your valuable
data *and* you want to test accessing your data read-only first in order to
make sure that the mapping is correct before you go for read-write access.


The author is reachable at <Mauelshagen@RedHat.com>.
Later, I told you ;)

For test results, mapping information, discussions, questions, patches,
enhancement requests and the like, please subscribe and mail
to <ataraid@redhat.com>.

CHANGELOG:
---------

Changelog from dmraid 1.0.0-rc1 to 1.0.0-rc2		2004.07.15

o Intel Software RAID discovery and activation support
o allow more than one format handler name with --format
o display "raid10" sets properly rather than just "mirror"
o enhanced activate.c to handle partial activation of sets (eg, degraded RAID0)
o enhanced command line option checks
o implemented a library context for variables such as debug etc.
o fixed memory leak in discover_partitions
o fixed recursion in _find_set()
o continued writing subsets in case we fail on one because of RAID1
o format handler template update
o fixed dietlibc build
o fixed shared library configure
o use default_list_set() instead of &raid_sets where possible
o name change of list_head members to the more commonly used 'list'
o renamed msdos partition format handler to dos
o lots of inline comments corrected/updated
o streamlined tools/*.[ch]
o moved get.*level() and get_status to metadata.[ch] and changed level
  name to type

--

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
