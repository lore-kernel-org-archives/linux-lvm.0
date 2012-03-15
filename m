Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2FN72DR000677
	for <linux-lvm@redhat.com>; Thu, 15 Mar 2012 19:07:02 -0400
Received: from smtp1.businessgrade.com (smtp1.businessgrade.com
	[66.151.104.17])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2FN71R6023768
	for <linux-lvm@redhat.com>; Thu, 15 Mar 2012 19:07:02 -0400
From: Errol Neal <eneal@businessgrade.com>
Date: Thu, 15 Mar 2012 19:00:53 -0400
Message-ID: <1331852453111518500@businessgrade.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Storage Virtualization and LVM
Reply-To: eneal@businessgrade.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com


Hola.
I've been doing something in my virtualization environment and I thought I better check with the experts before I continue my pratices and run into issues.
I use SCST to carve out luns via iSCSI and FC to servers in my environment. Generally I will take a hardware RAID volume from the controller, create a volume group and a number of logical volumes and share those out to servers using the targets I mentioned above. Most of these servers are running XCP and they also use LVM and the VG and LVs are not only visible on the initiator but also on the target. 
So here is where I need so help understanding if I'm doing something "bad" or something that could create scenarios where data can be corrupted. I've begun doing off-host backups by using partclone, nfsclone and dd from the SCST server. I just create a snapshot of the visible LV associated with the XCP SR and then run partclone or ntfsclone, depending upon the OS on the snapshot. My question is around the snapshot. Since the snapshot was not created on the XCP host but on the storage server, how does the kernel on the XCP host react? Could my practices result data being corrupted?

Thanks in advance for your thoughts..
