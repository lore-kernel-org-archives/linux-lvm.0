Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2SNMGnV022265
	for <linux-lvm@redhat.com>; Tue, 28 Mar 2006 18:22:16 -0500
Received: from smtp-03.arnet.com.ar (smtp-03.arnet.com.ar [200.45.191.14])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k2SNMAEW013693
	for <linux-lvm@redhat.com>; Tue, 28 Mar 2006 18:22:11 -0500
Message-ID: <4429C39E.4040406@arnet.net.ar>
Date: Tue, 28 Mar 2006 20:15:42 -0300
From: German Staltari <gstaltari@arnet.net.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] gfs with multipath
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

Hi, It's possible to do a multipath device with devices that are part of 
a already created gfs filesystem without losing data? If the question 
it's not clear here is a detailed explanation:

I have created a gfs filesystem (the usual procedure) that has two paths 
to the same device (QLogic hba connected to an IBM SAN)
Example: /dev/sdb is the same as /dev/sdc and my PV was created with 
/dev/sdc.
Now I would like to create a multipath device with this devices 
(/dev/sdb and /dev/sdc) but I don't want to lose my data. Is that possible?

FC4
kernel-smp-2.6.15-1.1831_FC4
device-mapper-multipath-0.4.4-2.3
 LVM version:     2.01.08 (2005-03-22)
 Library version: 1.01.02 (2005-05-17)
 Driver version:  4.4.0
Fibre Channel: QLogic Corp. QLA2312 Fibre Channel Adapter (rev 02)


My question is related to my previous post:
https://www.redhat.com/archives/linux-lvm/2006-March/msg00051.html

Thanks
German Staltari
