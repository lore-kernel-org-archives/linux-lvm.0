Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4MD1Jal019883
	for <linux-lvm@redhat.com>; Thu, 22 May 2008 09:01:19 -0400
Received: from victor.provo.novell.com (victor.provo.novell.com
	[137.65.250.26])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4MD11hW004305
	for <linux-lvm@redhat.com>; Thu, 22 May 2008 09:01:03 -0400
Message-Id: <4835BC14.D5D9.0001.0@novell.com>
Date: Thu, 22 May 2008 07:06:25 -0600
From: "R Ramkumar" <rramkumar@novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Removing PVs from Volume Groups which have allocated LVs
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

I have a LVM setup where I have a VG with 3 PVs.. I have created 2 LVs from the VG which eventually has taken physical storage space from one or two of the PVs.. Now, when I want to shrink the VG, I need to know the unallocated PV so that I can remove from the VG.. 

Is there anyway that I can find out which PV is unallocated and which PV to remove from the VG.. Please let me know your views..

Thanks,
Ram
