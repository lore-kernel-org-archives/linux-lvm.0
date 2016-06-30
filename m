Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5U9B6L2010188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2016 05:11:06 -0400
Received: from viruswall.wits.ac.za (viruswall.wits.ac.za [146.141.15.4])
	by mx1.redhat.com (Postfix) with ESMTP id 8864B8AE72
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2016 09:10:59 +0000 (UTC)
Received: from [127.0.0.1] (helo=imss.wits.ac.za)
	by viruswall.wits.ac.za with esmtp (Exim 4.63)
	(envelope-from <Scott.Hazelhurst@wits.ac.za>) id 1bIXzr-0004LT-C2
	for linux-lvm@redhat.com; Thu, 30 Jun 2016 11:10:55 +0200
Received: from imss.wits.ac.za (localhost.localdomain [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 44D4767CD24
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2016 11:10:55 +0200 (SAST)
Received: from Coltus.ds.WITS.AC.ZA (coltus.ds.wits.ac.za [146.141.11.222])
	by imss.wits.ac.za (Postfix) with ESMTP id 374C367CD22
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2016 11:10:55 +0200 (SAST)
From: Scott Hazelhurst <Scott.Hazelhurst@wits.ac.za>
Date: Thu, 30 Jun 2016 09:10:55 +0000
Message-ID: <9884100F-2885-48D2-82D4-CB35078A9DA3@wits.ac.za>
Content-Language: en-US
Content-ID: <268DF13D9F8D3D4D808163B1A1DEFE71@wits.ac.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM problem after upgrade to Ubuntu 16.04 (Part 2)
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
Content-Type: text/plain; charset="utf-8"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>


Dear all

I sent the email below about three weeks ago. Today I upgraded another machine — I had exactly the same thing happen and I appear to have lost some LVM volumes

Hmm. At least I  know it’s a problem and can backup the LVM volumes before doing upgrade but it’s hugely annoying.

Scott




Dear all

I upgraded a server from Ubuntu 15.10 to 16.04. All went smoothly and the machine appeared in good state. However, there seems to be a problem with LVM. I have one volume group with several logical volumes. lvs showed all the logical volumes but only 2 of the 7 volumes were active (and appearing in /dev/mapper). 

I activated the other volumes using lvchange -ay and then I can see all logical volumes in /dev/mapper. 

However, there appear to a problem with some of the LVs which are used as the images for virtual machines (qemu-kvm). The VMs don't boot. Moreover, previously I could mount the sub-partitions of the LV by doing a kpartx -a on the logical volume. That no longer works (e.g. kpartx -l /dev/mapper/cloud-VNAME shows nothing, while it used to show the 3 partitions of the underlying virtual machine).

One of the LVs didn't have a problem -- this just contained a data disk.

This particular server is not a serious problem for me because  I can clone the VM from elsewhere, but I am about to start an upgrade of all our other machines and it will be very time-consuming if I have to do this with each machine.

Does anyone have any ideas about what went wrong? How the situation could be remedied

Thanks

Scott
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="width:100%;"> 
<tr>
<td align="left" style="text-align:justify;"><font face="arial,sans-serif" size="1" color="#999999"><span style="font-size:11px;">This communication is intended for the addressee only. It is confidential. If you have received this communication in error, please notify us immediately and destroy the original message. You may not copy or disseminate this communication without the permission of the University. Only authorised signatories are competent to enter into agreements on behalf of the University and recipients are thus advised that the content of this message may not be legally binding on the University and may contain the personal views and opinions of the author, which are not necessarily the views and opinions of The University of the Witwatersrand, Johannesburg. All agreements between the University and outsiders are subject to South African Law unless the University agrees in writing to the contrary. </span></font></td>
</tr>
</table
