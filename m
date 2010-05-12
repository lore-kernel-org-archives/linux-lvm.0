Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4CFAxlj022088
	for <linux-lvm@redhat.com>; Wed, 12 May 2010 11:10:59 -0400
Received: from n12.bullet.mail.ac4.yahoo.com (n12.bullet.mail.ac4.yahoo.com
	[74.6.228.92])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o4CFAoD0007162
	for <linux-lvm@redhat.com>; Wed, 12 May 2010 11:10:50 -0400
Message-ID: <129178.23877.qm@web65504.mail.ac4.yahoo.com>
Date: Wed, 12 May 2010 08:10:47 -0700 (PDT)
From: Don Hoover <dxh@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] lvdisplay ignoring filter in /etc/lvm.conf?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I am seeing some odd behavior on Redhat 5.5 LVM.

I just noticed that lvdisplay seems to ignore the filter configuration in /etc/lvm.conf.

We are getting "Found duplicate PV" errors on the /dev/sd? devices on our systems that are using clvm even though we filter those out in the lvm.conf to use the /dev/mapper/mpath* devices.  

We are running in a cluster, does clvm cause lvdisplay ignore this filter?  Is there a way to stop these "duplicate pv" errors from lvdisplay that is different on RHEL 55 than what worked before(filter line)?


It seems that its just lvdisplay in redhat 5.5 that is ignoring them.

For "lvscan -vvvvvvvvvvvvvvvvv"

I see this in the debug output:
#filters/filter-regex.c:172         /dev/sdgy: Skipping (regex)


For "lvdisplay -vvvvvvvvvvvvvvvvv"

I see this in the debug output:
#cache/lvmcache.c:1224       Ignoring duplicate PV Gw7zqCRUj0mjfGltw3AaHhMfznSjmMTc on /dev/sdgy - using dm /dev/mapper/mpath91

And no filter/skipping lines at all for any /dev/sd* devices...it scans them anyway for some reason.


I wonder if this is a bug that has been introdced in the latest lvm packages...I am seeing this on a RHEL55 box running:
lvm2-2.02.56-8.el5.x86_64
lvm2-cluster-2.02.56-7.el5.x86_64
