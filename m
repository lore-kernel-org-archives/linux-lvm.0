Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9NJV8jv001114
	for <linux-lvm@redhat.com>; Thu, 23 Oct 2008 15:31:08 -0400
Received: from qmail-admn-norm-0.netfirms.com (q0-admin-norm.netfirms.com
	[38.113.184.28])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m9NJV3dY022339
	for <linux-lvm@redhat.com>; Thu, 23 Oct 2008 15:31:05 -0400
Date: Thu, 23 Oct 2008 15:31:42 -0400
Message-ID: <20081023193142.GA17753@netfirms.com>
MIME-Version: 1.0
Content-Disposition: inline
From: Steve Shorter <steve@netfirms.com>
Subject: [linux-lvm] LVM corruption possibilites??
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

Howdy!

	I intend a simple minimal setup  of LVM. I have a number
of hardware nodes connected to a SAN. On the SAN is a pool of  drives.
If I assign whole drives to Volume Groups and dedicate each Volume Group
to a single node, am I correct in assuming that data/metadata corruption
will/can not occur? Each node will only modify the VG that it is assigned.
Are there any other issues that need to be considered? Am I correct
in assuming that Volume/LVM metadata for a volume is written only
to disks in that volume and volumes are independent of each other and
that in this simple setup some kind of clustering solution  is not
neccessary? 

	thanx - steve
