Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4EIdr313702
	for <linux-lvm@redhat.com>; Fri, 14 May 2004 14:39:53 -0400
Received: from server.echohome.org (s233-64-29-217.try.wideopenwest.com
	[64.233.217.29])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4EIdqAX007086
	for <linux-lvm@redhat.com>; Fri, 14 May 2004 14:39:52 -0400
Received: from echo (echo.echohome.org [192.168.2.254])
	by server.echohome.org (8.12.8/8.12.8) with ESMTP id i4EIdkSO004767
	for <linux-lvm@redhat.com>; Fri, 14 May 2004 14:39:46 -0400
From: "Erik Ch. Ohrnberger" <Erik@echohome.org>
Date: Fri, 14 May 2004 14:39:46 -0400
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA1z/y+RiMjUG0rnE3+S6yhMKAAAAQAAAA9PM3uSfHCESqMaQcwxAYfwEAAAAA@EchoHome.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't seem to make pvmove do the work
Reply-To: Erik@echohome.org,
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
To: linux-lvm@redhat.com

It's strange.  I need to reduce a disk, either hdg or hdh from the volume
group.

I've already gone and reduced the allocated size using e2fsadm to change
free file system space into free pv allocations.  Here is what vgdisplay -v
says:

--- Physical volumes ---
PV Name (#)           /dev/hdg1 (4)
PV Status             available / allocatable
Total PE / Free PE    9814 / 0

PV Name (#)           /dev/hdh1 (3)
PV Status             available / allocatable
Total PE / Free PE    9815 / 880

PV Name (#)           /dev/hde1 (2)
PV Status             available / allocatable
Total PE / Free PE    19078 / 8347

PV Name (#)           /dev/hdf1 (6)
PV Status             available / allocatable
Total PE / Free PE    19078 / 5365

Now, I perform the following pvmove command:

Pvmove /dev/hdg1

And it says that there are insufficient free/allocatable physical extents.

But if I look at the list, the 9814 pvs on hdg1 should be across hdh1, hde1
and hdf1.

Have I got this correct?  Is there perhaps a step that I'm missing?  If I
am, do please let me know.

	Thanks,
		Erik.
