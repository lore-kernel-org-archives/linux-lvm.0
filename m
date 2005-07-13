Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6DCT8V05528
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 08:29:08 -0400
Received: from jason.comodo.net (firewall2.comodogroup.com [195.92.253.138])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j6DCSrUv018666
	for <linux-lvm@redhat.com>; Wed, 13 Jul 2005 08:28:58 -0400
From: susmitha <sushmitha@comodo.com>
Message-Id: <1121258369.13309.29.camel@fortocent.comodo.net>
Mime-Version: 1.0
Date: Wed, 13 Jul 2005 18:09:29 +0530
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate prblem
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

I am new to LVM.
I want t o create LVM volume group.
So first I created a partition and then runned "pvcreate"
root@localhost ~# pvcreate /dev/hda5
  Device /dev/hda5 not found.


But that is present.I didn't get why it is showing "Device not found"
Can anyone help me.It is urgent for me.

Can I create volume group on EVMS volumes?


Thanks,
susmitha
