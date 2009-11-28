Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nASArIXn026031
	for <linux-lvm@redhat.com>; Sat, 28 Nov 2009 05:53:19 -0500
Received: from lvps87-230-0-242.dedicated.hosteurope.de
	(lvps87-230-0-242.dedicated.hosteurope.de [87.230.0.242])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nASAr2qD007721
	for <linux-lvm@redhat.com>; Sat, 28 Nov 2009 05:53:03 -0500
Date: Sat, 28 Nov 2009 11:52:53 +0100
From: Michael Guntsche <mike@it-loops.com>
Message-ID: <20091128105253.GA4389@gibson.comsick.at>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Strange behaviour with initramfs and read-ahead settings
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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

Hi list,

I am currently running the 2.6.32-rc8 kernel with lvm2 version 2.02.54-1
on debian unstable.
Since my root is on LVM as well I use an initramfs for booting. The
setup I have consists of 5 disks in a RAID-5 with one PV on top of it.
Now for my problem. The md device correctly sets the read-ahead to 4096.
If I understand correctly lvm should get this value and set the
read-ahead on the LVs accordingly. This is not working correctly for
all my LVs.
Apart from the FIRST LV on the disk all the others show

Read ahead sectors     auto
  - currently set to     256

Since this did not seem to work I changed the RA with lvchange -r 4096
and rebooted. Swap now showed 

Read ahead sectors     4096

while the other LVs still showed


Read ahead sectors     4096
  - currently set to     256

lvs -o lv_read_ahead after boot 

 Rahead 
 2.00m 
 2.00m 
 2.00m 
 2.00m 
 2.00m

blockdev --getra  showed 256 for each LV apart from the first one.

For testing purposes I took one LV (home) offline and back online again

lvchange -an;lvchange -ay

After that the readahead was set correctly to 4096. I am not sure what's
happening here. I would understand a problem with getting the values
automatically but right now they are saved in the metadata but are still
set to 256. 

I am glad for any help on this topic, in the mean-time I am using
blockdev --setra to work around this problem.

Kind regards,
Michael Guntsche
