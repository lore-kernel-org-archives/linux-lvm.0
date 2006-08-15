Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FBDth3015685
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 07:13:55 -0400
Received: from smtp-04.arnet.com.ar (smtp-04.arnet.com.ar [200.45.191.26])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k7FBDfLC024158
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 07:13:47 -0400
Message-ID: <44E1AB70.8080702@arnet.net.ar>
Date: Tue, 15 Aug 2006 08:09:36 -0300
From: German Staltari <gstaltari@arnet.net.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] expanded volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi, I've expanded a LV but the disks that I've added to the LV/VG are 
not being used (the I/Os to this disks are almost null and the old ones 
still with high I/Os). Is there a way to force I/O to the new disks?
Thanks
German
