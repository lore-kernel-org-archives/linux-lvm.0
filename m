Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2Q0rDJO009736
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2011 20:53:13 -0400
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2Q0r8pS016304
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2011 20:53:08 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.7) with ESMTP id p2Q0r8h01244
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2011 17:53:08 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.4/8.14.3) with ESMTP id p2Q0r8le003126
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2011 17:53:08 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.4/8.14.3/Submit) id p2Q0r7jU003124
	for linux-lvm@redhat.com; Fri, 25 Mar 2011 17:53:07 -0700
Date: Fri, 25 Mar 2011 17:53:07 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Message-ID: <20110326005307.GA2753@esri.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Performance improved during pvmove??
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

Trying to sort out an odd one.

Have a RHEL 5.6 VM running on top of ESXi 4.1 backed by an NFS data
store.

Had a VG defined comprised of two PV's, one of which was not 4k aligned
properly.  The system showed a lot of iowait, ESXi's Performance stats
showed high IO latency response times and there were noticeable pauses
and glitches when using the system.

I decided to use pvmove to rectify this situation (ref below) by
growing the disk on which the correctly aligned PV lived, adding a
second PV there and pvmoving the "bad" PV to this new PV.

    Before:
        ext4
          VG
            PV1 /dev/sdb1 (not aligned correctly)
            PV2 /dev/sdc1

    After:
        ext4
          VG
            PV2 /dev/sdc1
            PV3 /dev/sdc2

As soon as I kicked off the pvmove (pvmove -v /dev/sdb1), my iowait
dropped to normal levels, and ESXi's performance graphs indicating
write latency dropped to as low as I've seen them.

Interaction with the system became "normal" with no glitchiness
whatsoever.

Normal file system activity continued (we didn't take the system down
for this workload).

After about 8 hours the pvmove finished and I removed /dev/sdb from the
VG and from the system.  Almost immedaitely the IO wait times spiked
again, ESXi is once again showing spikes of 500+ ms latency on IO
requests and the system became glitchy again from the console.

I'd say it's not as bad as before, but what gives?  Why were things
great *during* the pvmove, but not after?

I'm wondering if I goofed by using two PV's on the same disk with this
type of setup.  A single I/O request might need to be serviced by
multiple requests to the completely different spots in the same
physical disk....

I may look to create a brand new physical disk and just migrate all of
the data there.

Anyone have any thoughts?

Thanks,
Ray
