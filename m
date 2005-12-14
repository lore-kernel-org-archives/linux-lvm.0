Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBEJ6W122796
	for <linux-lvm@redhat.com>; Wed, 14 Dec 2005 14:06:32 -0500
Received: from smtp108.plus.mail.mud.yahoo.com
	(smtp108.plus.mail.mud.yahoo.com [68.142.206.241])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jBEJ6VhH025087
	for <linux-lvm@redhat.com>; Wed, 14 Dec 2005 14:06:31 -0500
From: Ron Joffe <rjoffe@yahoo.com>
Date: Wed, 14 Dec 2005 14:06:22 -0500
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200512141406.22544.rjoffe@yahoo.com>
Subject: [linux-lvm] Restoring some data from a faild Dual Drive LVM
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

Hey Folks,

Is there a method (or possibility) of restoring any data from a dual drive 
spanned LVM array when one of the drives has failed?

Drives = WD 2500 (250GB IDE)
OS     = SuSE 9.0
LVM    = 1.0.7-105
fs     = reiserfs 3.6.9-33

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdd1" of VG "volume2" [232.84 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb1" of VG "volume2" [232.84 GB / 0 free]
pvscan -- total: 2 [465.74 GB] / in use: 2 [465.74 GB] / in no VG: 0 [0]

Thanks,

Ron
