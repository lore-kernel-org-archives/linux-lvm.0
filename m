Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4S6sAYm024084
	for <linux-lvm@redhat.com>; Wed, 28 May 2008 02:54:10 -0400
Received: from victor.provo.novell.com (victor.provo.novell.com
	[137.65.250.26])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4S6rxjq013255
	for <linux-lvm@redhat.com>; Wed, 28 May 2008 02:54:00 -0400
Message-Id: <483D4F0D.D5D9.0001.0@novell.com>
Date: Wed, 28 May 2008 00:59:30 -0600
From: "R Ramkumar" <rramkumar@novell.com>
References: <4835BC14.D5D9.0001.0@novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Fwd: Removing PVs from Volume Groups which have
	allocated LVs
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

Does any one have any update on this issue? In brief, is it possible to know the PV's which are free (which are not being used by the LVs created) inside a VG so that they can be removed from the VG.. 
 
>>> R Ramkumar 05/22/08 6:36 PM >>> 

Hi,

I have a LVM setup where I have a VG with 3 PVs.. I have created 2 LVs from the VG which eventually has taken physical storage space from one or two of the PVs.. Now, when I want to shrink the VG, I need to know the unallocated PV so that I can remove from the VG.. 

Is there anyway that I can find out which PV is unallocated and which PV to remove from the VG.. Please let me know your views..

Thanks,
Ram
