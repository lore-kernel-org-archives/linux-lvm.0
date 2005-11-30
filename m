Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAUKhUV20840
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 15:43:30 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.196])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAUKhRLQ002072
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 15:43:27 -0500
Received: by wproxy.gmail.com with SMTP id i22so80602wra
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 12:43:27 -0800 (PST)
Message-ID: <479b70ed0511301243v1138c05drda62bb29cbf0f89e@mail.gmail.com>
Date: Wed, 30 Nov 2005 14:43:27 -0600
From: Ben Beuchler <insyte@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re-sizing a PV
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
To: linux-lvm@redhat.com

I found in the archives a reference to using this series of commands
to grow a PV to fill a disk that has grown (in this case, a hardware
RAID volume that has had disks added to it):

vgcfgbackup
edit file
pvcreate --restorefile --uuid
vgcfgrestore

I would appreciate a little clarification on step #3:

I assume I need to specify the name of the backup file as the value to
the --restorefile option.  Do I specify the id of the vg or the pv as
the option to --uid?

Thanks!

Oh, and do the filesystems have to be unmounted while this is happening?

-Ben
