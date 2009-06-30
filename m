Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5UHI1Ec026589
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 13:18:02 -0400
Received: from smtp.exsequi.com (smtp.exsequi.com [217.41.116.114])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5UHHleW021422
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 13:17:48 -0400
Received: from vampire.exsequi.com ([192.168.1.125])
	by smtp.exsequi.com with esmtpsa (TLSv1:AES256-SHA:256) (Exim 4.67)
	(envelope-from <chris_farey@stormagic.com>) id 1MLgxk-00044L-Fw
	for linux-lvm@redhat.com; Tue, 30 Jun 2009 18:17:44 +0100
Message-ID: <4A4A48B8.9040401@stormagic.com>
Date: Tue, 30 Jun 2009 18:17:44 +0100
From: Chris Farey <chris_farey@stormagic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mapping LVs to physical device
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


I have a requirement to be able to work out which areas of a physical 
device assigned to LVM are being used by various logical volumes. I 
haven't found any easy way to do this using an API, so I've resorted to 
spawning off lvm commands and interpretting the output.

I can use lvdisplay to map logical extents to physical extents, but I 
still need to know where the extents start on the physical device, and I 
can't find a good way of doing that.

pvck tells me the offset and the size of the metadata, and assuming that 
the first extent starts after the metadata seems to work. But pvck 
doesn't seem to be present in older versions of LVM (or one of my 
systems starts running them gets killed), and the help implies its doing 
some checks too (and lengthly checks would be bad in my application).

Is there a better way to map the Logical Block Addresses of LVs to 
physical disks?

Chris Farey
