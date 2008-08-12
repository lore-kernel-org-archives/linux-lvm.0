Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7C3rvij017547
	for <linux-lvm@redhat.com>; Mon, 11 Aug 2008 23:53:57 -0400
Received: from ocelot.uvic.ca (ocelot.uvic.ca [142.104.151.81])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7C3rg6W021169
	for <linux-lvm@redhat.com>; Mon, 11 Aug 2008 23:53:42 -0400
From: "David S. Broome" <dbroome@uvic.ca>
Date: Mon, 11 Aug 2008 20:53:26 -0700
Message-ID: <54AA5D29CDD96948959171E0DF2990295352@EMC1.uvic.ca>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM with large arrays, one large or mutiple small PV's?
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello - This is a best practices style question.

LVM with large arrays, one large or mutiple small PV's?

What is the suggested physical partition layout with large hardware RAID arrays (is NAS or SAN) in the case where there can be one VG?

ie I have two Raid 5 Arrays that can either present one large logical volume ie 3.5T and 2.9T each or a multiple smaller logical volumes ie 500G.

Would it be better have the hardware present add multiple smaller logical volumes to as PV's or the single larger volumes?

If there is a need for multiple VG's then obviously there needs to be multiple PVs.

The smaller volumes would have the advantage of being able to pvmoved to other hardware in the future with more flexibility due to the size of PV's.

There would be some overhead space lost due to the multiple PV's, although this would be small.

Thanks in advance for any comments.

Dave,
--
David Broome  Sr. Programmer Analyst @ FineArts.UVic.CA /BSc
250.721-6307 | dbroome@uvic.ca | FIA 221
