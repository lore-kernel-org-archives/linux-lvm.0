Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j26DUqn26786
	for <linux-lvm@redhat.com>; Sun, 6 Mar 2005 08:30:52 -0500
Received: from out1.smtp.messagingengine.com (out1.smtp.messagingengine.com
	[66.111.4.25])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j26DUpdV008649
	for <linux-lvm@redhat.com>; Sun, 6 Mar 2005 08:30:51 -0500
Received: from web4.messagingengine.com (web4.internal [10.202.2.213])
	by frontend1.messagingengine.com (Postfix) with ESMTP id 7E509C5D01F
	for <linux-lvm@redhat.com>; Sun,  6 Mar 2005 08:30:50 -0500 (EST)
Message-Id: <1110115850.4677.216665923@webmail.messagingengine.com>
From: "Ajeet Nankani" <fromkth+lvm@fastmail.fm>
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Date: Sun, 06 Mar 2005 05:30:50 -0800
Subject: [linux-lvm] Reducing the Linux LVM(8e) partition itself (not PV,
	VG or LV)
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
To: LVM general discussion & development <linux-lvm@redhat.com>

Hi,

I have a /dev/hda6 partition as Linux LVM(8e), its size is around 8GB.
I have one PV(no free PEs in it all are allocated) in this partition.
This PV has a total size of around 7GB.
I have also made sure that this PV is contiguous from the start of the
LVM partition hence it is confirmed that the free 1GB is at the end of
LVM partition.
I want to reduce this Linux LVM(8e) partition and recover this 1GB free
space to create a fat32 partition.
When i tried to print partition table of this /dev/hda6 through gnu
parted, it gave error "Error: Could not detect file system." and so
qtparted does not work either.

Is there anyway to reduce this linux LVM (8e) partition safely?

I have FC3 and gnu parted 1.6.15.

Regrads,

-ajeet.
