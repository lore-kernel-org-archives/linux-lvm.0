Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q22DiLKn005063
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2012 08:44:21 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q22DiJQC031947
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2012 08:44:20 -0500
Received: by eaaq12 with SMTP id q12so611681eaa.33
	for <linux-lvm@redhat.com>; Fri, 02 Mar 2012 05:44:19 -0800 (PST)
Message-ID: <4F50CEB1.7040601@profitbricks.com>
Date: Fri, 02 Mar 2012 14:44:17 +0100
From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM Thin Provisioning size limited to 16 GiB?
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

Hi list,

I've tested LVM thin provisioning with the latest LVM user-space from
git and today together with kernel 3.2.7.

I've got 24 SAS HDDs put together into 12 MD RAID-1 arrays. So I want to
have a thin pool with striping over all RAID-1 arrays. But this seems to
be size limited to 16 GiB. With bigger size the pool can't be activated
and LVM can't be removed any more - forces me to reboot.

I've also tested to explicitly set the --poolmetadatasize to 16 GiB and
the data pool to 100 GiB, but same result. I also did some benchmarks.
Performance wasn't that bad, but could be really better (at least doubled).

Is this the current development state or do I do something wrong?

Here are my commands:
   vgcreate test /dev/md/test*
   lvcreate -i 12 -I 64 -L 16G -T test/pool
   lvcreate -V 45G -T test/pool -n test00

Furthermore, when writing and afterwards reading to/from the thin LV it
is only possible with up to 11 GiB. Then there are messages like the
following in the kernel log.

   device-mapper: space map metadata: out of metadata space
   device-mapper: thin: dm_thin_insert_block() failed

Seems like pool meta-data and pool data aren't separated at current
development state.

Regards,

Sebastian Riemer
