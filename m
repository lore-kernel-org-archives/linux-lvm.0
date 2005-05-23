Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	j4NDPP1e017280
	for <linux-lvm@redhat.com>; Mon, 23 May 2005 15:25:26 +0200
Date: Mon, 23 May 2005 15:25:25 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Message-ID: <20050523132525.GA30779@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] *** Announcement: dmraid 1.0.0.rc8 ***
Reply-To: mauelshagen@redhat.com,
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


               *** Announcement: dmraid 1.0.0.rc8 ***

dmraid 1.0.0.rc8 is available at
http://people.redhat.com:/heinzm/sw/dmraid/ in source tarball,
source rpm and i386 rpm (with shared and static dietlibc binary).

This release fixes a stripe size bug in NVidia and avoids using
the Silicon Image incarnation number for RAID name creation
(should avoid some sets not grouping properly).
It adds an '--ignorelocking' in order to allow dmraid to run in
early boot where no read/write access to /var is given.


dmraid (Device-Mapper RAID tool) discovers, [de]activates and displays
properties of software RAID sets (i.e. ATARAID) and contained DOS
partitions using the device-mapper runtime of the 2.6 kernel.

The following ATARAID types are supported on Linux 2.6:

Highpoint HPT37X
Highpoint HPT45X
Intel Software RAID
LSI Logic MegaRAID
NVidia NForce
Promise FastTrack
Silicon Image Medley
VIA Software RAID

Please provide insight to support those metadata formats completely.

Thanks.


See files README and CHANGELOG, which come with the source tarball for
prerequisites to run this software, further instructions on installing
and using dmraid!


Call for testers:
-----------------

I need testers with the above ATARAID types, to check that the mapping
created by this tool is correct (see options "-t -ay") and access to the
ATARAID data is proper.

In case you have a different ATARAID solution from those listed above,
please feel free to contact me about supporting it in dmraid.

You can activate your ATARAID sets without danger of overwriting
your metadata, because dmraid accesses it read-only unless you use
option -E together with -r in order to erase ATARAID metadata
(see 'man dmraid')!

This is a release candidate version so you want to have backups of your valuable
data *and* you want to test accessing your data read-only first in order to
make sure that the mapping is correct before you go for read-write access.


Contacts:
---------

The author is reachable at <Mauelshagen@RedHat.com>.

For test results, mapping information, discussions, questions, patches,
enhancement requests and the like, please subscribe and mail to
<ataraid-list@redhat.com>.

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
