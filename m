Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
References: <85256906.006BCDB7.00@d54mta02.raleigh.ibm.com>
From: "Martin K. Petersen" <mkp@linuxcare.com>
Date: 23 Jun 2000 22:55:44 +0200
In-Reply-To: benr@us.ibm.com's message of "Thu, 22 Jun 2000 15:37:29 -0400"
Message-ID: <yq1r99oi0bz.fsf@tyra.mkp.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benr@us.ibm.com
Cc: linux-lvm@msede.com

>>>>> "Ben" == benr <benr@us.ibm.com> writes:

[Musings deleted]

Ben> This is exactly what you would have under the LVMS described in
Ben> the white paper.  Your example shows nothing which could not be
Ben> done through the LVMS architecture with partitions.  Am I missing
Ben> something here?

I am advocating:

1. Using existing partitioning schemes to encapsulate logical disks.

   This is only relevant in the migration case and if people want to
   test LVMS on a few disks that are already partitioned.  If your
   system has hundreds of disks connected, you'll use a 1:1 physical
   to logical disk mapping anyway.

2. Avoid using existing partitioning schemes to encapsulate logical
   partitions/extents.

-- 
Martin K. Petersen, Principal Linux Consultant, Linuxcare, Inc.
mkp@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
