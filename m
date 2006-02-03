Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k13H9M103289
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 12:09:22 -0500
Received: from mta07-winn.ispmail.ntl.com (mta07-winn.ispmail.ntl.com
	[81.103.221.47])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k13H9JPW027543
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 12:09:20 -0500
Received: from aamta12-winn.ispmail.ntl.com ([81.103.221.35])
	by mta07-winn.ispmail.ntl.com with ESMTP id
	<20060203170910.SMMG19933.mta07-winn.ispmail.ntl.com@aamta12-winn.ispmail.ntl.com>
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 17:09:10 +0000
Received: from [192.168.11.10] (really [62.253.210.226])
	by aamta12-winn.ispmail.ntl.com with ESMTP id
	<20060203170910.XLOL12811.aamta12-winn.ispmail.ntl.com@[192.168.11.10]>
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 17:09:10 +0000
Message-ID: <43E38E34.7080502@watford53.freeserve.co.uk>
Date: Fri, 03 Feb 2006 17:09:08 +0000
From: Jim Ford <jaford@watford53.freeserve.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Adding another disk to Kubuntu/Ubuntu.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm <linux-lvm@redhat.com>

I'm using LVM  on a Kubuntu setup that I now want to add another disk 
to.  I've used software RAID before, but am new to LVM and am aware that 
one false move can render the whole lot unusable. I therefore feel the 
need for a bit of handholding! I've had a look at the docs and there 
seems to be a whole slew of utilities concerning LVM, some seem to be 
applicable to LVM1 and some LVM2 - which does little for my confidence 
in getting it right first time. (Perhaps I should have gone down the 
plain vanilla disk system route during the initial installation, but I 
was seduced by the hype concerning LVM!)

I _think_ I've created a new physical volume, ready to add to my 
filesystem, but am not certain what to do next. Output from pvscan is:

  PV /dev/hda5   VG Ubuntu   lvm2 [18.77 GB / 0    free]
  PV /dev/hdb1   VG Ubuntu   lvm2 [7.86 GB / 7.86 GB free]
  Total: 2 [26.64 GB] / in use: 2 [26.64 GB] / in no VG: 0 [0   ]

and output from lvmdiskscan:

  /dev/hda1 [      243.14 MB]
  /dev/hda5 [       18.78 GB] LVM physical volume
  /dev/hdb1 [        7.87 GB] LVM physical volume
  0 disks
  1 partition
  0 LVM physical volume whole disks
  2 LVM physical volumes

Output from DF is:
/dev/mapper/Ubuntu-root
                      18715076   6466152  11298244  37% /
tmpfs                   112264         0    112264   0% /dev/shm
tmpfs                   112264     12588     99676  12% 
/lib/modules/2.6.12-10-386/volatile
/dev/hda1               233335     19166    201721   9% /boot


I want to add the 7.87GB /dev/hdb1 to the 18.78GB Ubuntu /dev/hda5 and 
would be grateful for any advice.

Jim Ford
