Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GC8mGn019855
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 08:08:48 -0400
Received: from pluto.sivell.com (z-t3.aifi.com [65.112.245.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3GC8ZCl021460
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 08:08:35 -0400
Received: from ef.sivell.com (ef [192.168.249.210]) (authenticated bits=0)
	by pluto.sivell.com (8.13.1/8.13.1) with ESMTP id n3GCBCBX017795
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 07:11:12 -0500
Message-ID: <49E71F9D.3010401@sivell.com>
Date: Thu, 16 Apr 2009 07:07:57 -0500
From: vu pham <vu@sivell.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
References: <29070.706.qm@web94806.mail.in2.yahoo.com>
In-Reply-To: <29070.706.qm@web94806.mail.in2.yahoo.com>
Content-Transfer-Encoding: 7bit
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

yogeen honnavar wrote:
> Dear users,
> 
> We have created a mirrored logical volume(lv1) in a volume group vg1. we have 2 disks /dev/sda and /dev/sdb. output of lvs command shows that mirror image_0 is stored on /dev/sda3 and image_1 on /dev/sdb3 and mirror log on /dev/sdb2. Copy % shows 100%. so mirroring is setup correctly.
> 
> now we wish to simulate mirror leg failure and recovery. as per the redhat lvm administrators guide we used the following command to trigger the failure of mirror leg1
> 
> dd if=/dev/zero of=/dev/vg1/lv1 count=10
> 
> as per the redhat guide this should result in mirror leg failure and any subsequent write activity to the mirror should convert the mirror into linear volume. but the output of lvs command still shows copy % as 100%. also data in filesystem of lv1 is erased and it is converted into read only filesystem.
> 
> can anyone please let us know the correct way to simulate lvm mirror failure and recovery.
> 
> thanks and regards

I think to simulate error failure you have to write to the underlying 
devices, not the mirrored device. When you write to the mirrored device, 
lvl1 in this case, data is mirrored so there is no failure at all. So I 
think you have to dd to either /dev/sda3 or /dev/sdb3.

Vu
