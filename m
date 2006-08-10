Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7AE7dDN029876
	for <linux-lvm@redhat.com>; Thu, 10 Aug 2006 10:07:39 -0400
Date: Thu, 10 Aug 2006 22:07:17 +0800
From: wenlinfeng 45817 <wenlf@huawei.com>
Message-id: <fa3001fa1caf.fa1caffa3001@huawei.com>
MIME-version: 1.0
Content-language: zh-CN
Content-transfer-encoding: 7BIT
Content-disposition: inline
Subject: [linux-lvm] A problem about physical volumes.
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
To: Linux-LVM@Sistina.com

Linux-LVM@Sistina.com
I am suffering from a problem about physical volumes, please help me.

I want to create volume group in storage(Sun StorEdge 3510 FC)
My machine is dual (the hostnames are mdcc1 and mdcc2)	.The OS is Suse Linux.

I operate it as follows:
1.pvcreate  /dev/sdb1
2.vgcreate oracledg /dev/sdb1
3.create logical volumes. such as:lvcreate -L 220M -n lvcontrol01 oracledg
4.create notes. such as: mknod /dev/raw/raw16 c 162 16
5.link notes and lv. such as:raw /dev/raw/raw1 /dev/oracledg/lvcontrol01

The former three steps are excuted at mdcc1.
the step 4 and 5 are excuted at mdcc1 and mdcc2.

However,mdcc2 hints a error as follows:


The result is following after excuting the commands pvscan and vgscan. 
mdcc1:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdb1" of VG "oracledg" [203.98 GB / 203.98 GB free]
pvscan -- total: 1 [203.99 GB] / in use: 1 [203.99 GB] / in no VG: 0 [0]

mdcc2:/sbin # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read(): read" reading physical volumes


mdcc1:~ # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "oracledg"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

mdcc2:/sbin # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group


I am looking for your answer. Thank you very much.

******************************************************************************************
 This email and its attachments contain confidential information from HUAWEI, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or em
ail immediately and delete it!
 *****************************************************************************************
