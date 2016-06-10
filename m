Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5A7BVii024148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 03:11:31 -0400
Received: from marcus3.wits.ac.za (marcus3.wits.ac.za [146.141.15.5])
	by mx1.redhat.com (Postfix) with ESMTP id E863871096
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 07:11:27 +0000 (UTC)
Received: from [127.0.0.1] (helo=imss.wits.ac.za)
	by marcus3.wits.ac.za with esmtp (Exim 4.63)
	(envelope-from <Scott.Hazelhurst@wits.ac.za>) id 1bBGbC-0005OW-He
	for linux-lvm@redhat.com; Fri, 10 Jun 2016 09:11:22 +0200
Received: from imss.wits.ac.za (localhost.localdomain [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6FF1E67CC02
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 09:11:22 +0200 (SAST)
Received: from Charon.ds.WITS.AC.ZA (charon.ds.wits.ac.za [146.141.11.220])
	by imss.wits.ac.za (Postfix) with ESMTP id 6199D67CC01
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 09:11:22 +0200 (SAST)
From: Scott Hazelhurst <Scott.Hazelhurst@wits.ac.za>
Date: Fri, 10 Jun 2016 07:11:22 +0000
Message-ID: <6C3AC57E-9B69-4A32-80B8-0396A2D476D7@wits.ac.za>
Content-Language: en-US
Content-ID: <5D9A1813BD11044FA5322FD8AB010169@wits.ac.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM problem after Ubuntu upgradee
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
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>




Dear all
        
I upgraded a server from Ubuntu 15.10 to 16.04. All went smoothly and the machine appeared in good state. However, there seems to be a problem with LVM. I have one volume group with several logical volumes. lvs showed all the logical volumes but only 2 of the 7 volumes were active (and appearing in /dev/mapper). 

I activated the other volumes using lvchange -ay and then I can see all logical volumes in /dev/mapper. 

However, there appear to a problem with some of the LVs which are used as the images for virtual machines (qemu-kvm). The VMs don't boot. Moreover, previously I could mount the sub-partitions of the LV by doing a kpartx -a on the logical volume. That no longer works (e.g. kpartx -l /dev/mapper/cloud-VNAME shows nothing, while it used to show the 3 partitions of the underlying virtual machine).

One of the LVs didn't have a problem -- this just contained a data disk.

This particular server is not a serious problem for me because  I can clone the VM from elsewhere, but I am about to start an upgrade of all our other machines and it will be very time-consuming if I have to do this with each machine.

Does anyone have any ideas about what went wrong? How the situation could be remedied

Thanks

Scott=
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="width:100%;"> 
<tr>
<td align="left" style="text-align:justify;"><font face="arial,sans-serif" size="1" color="#999999"><span style="font-size:11px;">This communication is intended for the addressee only. It is confidential. If you have received this communication in error, please notify us immediately and destroy the original message. You may not copy or disseminate this communication without the permission of the University. Only authorised signatories are competent to enter into agreements on behalf of the University and recipients are thus advised that the content of this message may not be legally binding on the University and may contain the personal views and opinions of the author, which are not necessarily the views and opinions of The University of the Witwatersrand, Johannesburg. All agreements between the University and outsiders are subject to South African Law unless the University agrees in writing to the contrary. </span></font></td>
</tr>
</table>
