Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p974dk8q019983
	for <linux-lvm@redhat.com>; Fri, 7 Oct 2011 00:39:46 -0400
Received: from mailhub4.uq.edu.au (mailhub4.uq.edu.au [130.102.149.131])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p974deVI024523
	for <linux-lvm@redhat.com>; Fri, 7 Oct 2011 00:39:41 -0400
Received: from smtp3.uq.edu.au (smtp3.uq.edu.au [130.102.128.18])
	by mailhub4.uq.edu.au (8.13.8/8.13.8) with ESMTP id p974ddu6024186
	for <linux-lvm@redhat.com>; Fri, 7 Oct 2011 14:39:40 +1000
Received: from wotan.di.uq.edu.au (wotan.di.uq.edu.au [130.102.227.150])
	(authenticated bits=0)
	by smtp3.uq.edu.au (8.13.8/8.13.8) with ESMTP id p974dds4001109
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 7 Oct 2011 14:39:39 +1000
Message-ID: <4E8E8283.1030207@uq.edu.au>
Date: Fri, 07 Oct 2011 14:39:31 +1000
From: Marcus Schull <c.schull@uq.edu.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM Logical Volumes on a LUN visible by 2 Linux servers
	over a SAN
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Linux LVM mailing list,


Just a quick question regarding LVM and clustered systems:

I have two RHEL6 servers that can see the same LUN via a SAN, but only 
one will mount the LV (with an ext4 filesystem) at a time.

The situation is one that allows a manual failover (by mounting the 
filesystem on the second server) if the first server fails.

Are there any LVM-related processes (ongoing or at bootup/shutdown) that 
could run on server2 that could affect the PV/VG and/or LV that is 
mounted and in use on server1?

Again I am fully aware of the dangers of concurrently mounting 
filesystems in two places, but not sure if the mere visibility of the 
LVM-related metadata to both servers concurrently poses any risk.

I am not using clvm, just the standard lvm.


Thanks for any advice on this.


Regards,

Marcus.
