Received: from o.ww.redhat.com (vpnuser9.stuttgart.redhat.com [172.16.4.9])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i66J7KoE030088
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 21:07:20 +0200
Date: Tue, 6 Jul 2004 21:07:21 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Message-ID: <20040706190721.GA26208@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] *** Announcement: dmraid 1.0.0-rc1 available at
	http://people.redhat.com:~heinzm/sw/dmraid
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


               *** Announcement: dmraid 1.0.0-rc1 ***

dmraid 1.0.0-rc1 available at http://people.redhat.com:/~heinzm/sw/dmraid/
in source and i386 rpm.

dmraid (Device-Mapper Raid tool) discovers, [de]activates and displays
properties of software RAID sets (ie. ATARAID) and contained MSDOS
partitions using the device-mapper runtime of the 2.6 kernel.

The following ATARAID types are supported on Linux 2.6:

Highpoint HPT37X
Highpoint HPT45X
Promise FastTrack
Silicon Image Medley

These ATARAID types can be discovered only in this version:
Intel Software RAID
LSI Logic MegaRAID

Please provide insight to support those metadata formats completely.

Thanks.

See file README, which comes with the source tarball for prerequisites
to run this software and further instructions on installing and using dmraid!


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

For test results, mapping information, discussions, questions, patches,
enhancement requests, free beer offers and the like, please subscribe and
mail to <ataraid@redhat.com>.

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
