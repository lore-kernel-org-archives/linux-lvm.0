Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8EIe5r31268
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 14:40:05 -0400
Received: from storix.com ([206.71.178.18])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8EIdnMv027871
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 14:39:50 -0400
Received: from [192.168.1.126] (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id AE90F157C9
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 11:30:26 -0700 (PDT)
From: rich turner <rich@storix.com>
Message-Id: <1095187380.3140.11.camel@rich>
Mime-Version: 1.0
Date: Tue, 14 Sep 2004 11:43:00 -0700
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] device-mapper major number
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

how is the major number device-mapper assigned? i have one system that
has it as 253 (mdp is 254) and one that has it as 254 (from
/proc/devices). is there anyway of loading dm-mod with a certain major
number?

the reason i ask is because when lilo is run it writes the root device
major and minor number to the disk. if the major number happens to
change when the system boots up then there is a possibility of the root
filesystem (built on lvm) not being mounted.

also, when i create a logical volume with "persistent y" it requires me
to indicate the major and minor numbers for the device. i understand
needing the minor number but why the major number? in fact, it just
ignores the number i indicate for the major number anyways and uses the
major number for device-mapper. my memory may be failing me but it seems
that the major number was not needed to create a persistent logical
volume in the past.
