Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lASDQS6r003714
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2007 08:26:28 -0500
Received: from bay0-omc2-s1.bay0.hotmail.com (bay0-omc2-s1.bay0.hotmail.com
	[65.54.246.137])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lASDPp9t009096
	for <linux-lvm@redhat.com>; Wed, 28 Nov 2007 08:25:52 -0500
Message-ID: <BAY140-W4219331DE43A364FBD6EB4DA770@phx.gbl>
From: Tahir Saleh <tahirsaleh@hotmail.com>
Date: Wed, 28 Nov 2007 18:25:46 +0500
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] question about reducing LVM partition
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


ive been givin a task to find such a way that by shrinking an LVM logical volume implemented on RAID, lets say to half its size without losing any data on the partition present in such a state that the data is supposedly smaller than the shrinked logical volume.what i did is that i implemented logical volume through LVM2(on RAID) packaged with the distro RHEL4 and tried the test but with no success. my question is that does e2fsadm utility provided by LVM1 gives the facility of data intagrity while shrinking the filesystem what iam trying to ask is that will LVM1 would do the job if not is there any otherway.
regards

_________________________________________________________________
Discover the new Windows Vista
http://search.msn.com/results.aspx?q=windows+vista&mkt=en-US&form=QBRE
