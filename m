Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CBeK7p028735
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 07:40:20 -0400
Received: from rgminet01.oracle.com (rgminet01.oracle.com [148.87.113.118])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4CBeEH0026970
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 07:40:15 -0400
Received: from rgmgw2.us.oracle.com (rgmgw2.us.oracle.com [138.1.186.111])
	by rgminet01.oracle.com (Switch-3.1.6/Switch-3.1.6) with ESMTP id
	k4CBe8vH011696
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 05:40:08 -0600
Received: from [141.144.128.190]
	(dhcp-emea-uk-csvpn-gw7-141-144-128-190.vpn.oracle.com
	[141.144.128.190])
	by rgmgw2.us.oracle.com (Switch-3.1.7/Switch-3.1.7) with ESMTP id
	k4CBe7p7028084
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 05:40:08 -0600
Message-ID: <44647414.2010509@oracle.com>
Date: Fri, 12 May 2006 13:40:04 +0200
From: "Egbert van.der Zande" <egbert.van.der.zande@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM: pvcreate fails with: Cant' open exclusively
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

Hi experts,

I have a Linux system that has 4 x 300G disks (dev/hd[efgh]). All four 
have a 20G raw device on partition 1 that is used by Oracle ASM. I 
wanted to assign the remaining diskspace to a logical volume. This was 
successful for /dev/hd[efg]2 but on /dev/hdh2 I get:

pvcreate /dev/hdh2
"Cant' open exclusively, Mounted filesystem?"

I'm in single user mode, as far as I can see /dev/hdh2 is not mounted 
(service rawdevices stop; so /dev/hdh1 is not used either)
fuser /dev/hdh2 does not reveal anything

Tried pvcreate --debug /dev/hdh2 but no additional info is given. I 
first thought it was the ASM / LVM combination but the other 3 disks 
work fine.

Then I removed all partitions and tried to do a
pvcreate /dev/hdh, same error (did a dd if=/dev/zero of=/dev/hdh bs=512 
count=1 to wipe out)
Also wiped out the entire disk.

Finally I created a partition and did a mkfs -ext3 /dev/hdh1, works fine

But LVM simply refuses!?

Any thoughts? Is there a way to get debug info?

LVM 2.02.01, driver 4.5.0
Redhat EL AS V4 U3 2.6.9-34 EL
