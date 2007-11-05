Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lA5CZoAI029296
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2007 07:35:50 -0500
Received: from pat.uio.no (pat.uio.no [129.240.10.15])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lA5CZgf8030121
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2007 07:35:42 -0500
Received: from mail-mx1.uio.no ([129.240.10.29])
	by pat.uio.no with esmtp (Exim 4.67)
	(envelope-from <martingi@ifi.uio.no>) id 1Ip1B3-0005a2-6L
	for linux-lvm@redhat.com; Mon, 05 Nov 2007 13:35:37 +0100
Received: from edelsten.ifi.uio.no ([129.240.71.14])
	by mail-mx1.uio.no with esmtp (Exim 4.67)
	(envelope-from <martingi@ifi.uio.no>) id 1Ip1B2-0001Vq-EX
	for linux-lvm@redhat.com; Mon, 05 Nov 2007 13:35:36 +0100
Message-ID: <472F0E18.20906@ifi.uio.no>
Date: Mon, 05 Nov 2007 13:35:36 +0100
From: Martin Giese <martingi@ifi.uio.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Extend LVM physical volume
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

Hi,

I have a task I'm not sure how to do from the information in the LVM man
pages.

I want to resize a LVM Physical Volume, i.e. a partition that has LVM on
it.  I have some free space on the disk just before the LVM partition.

[ DOS ][ Boot ][***FREE***][ LVM ][Swap]

According to the pvresize man page, I just need to change the place used
by the LVM partition to include the free space, e.g. using fdisk, and
then run pvresize.  However, I read somewhere that this will only work
if the free space comes behind the existing LVM area.  Is that right?
If so, is there a way of moving the filesystem data from the end to the
beginning of the enlarged space?

Making the free space into a new partition doesn't work since I already
have 4 primary partitions.

Any ideas?

Regards,
    Martin
