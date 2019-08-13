Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48F613796
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2019 07:12:02 +0000 (UTC)
Received: from postamt.cs.uni-dortmund.de (postamt.cs.uni-dortmund.de
	[129.217.4.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A98DC049D62
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2019 07:12:00 +0000 (UTC)
Received: from postweb.cs.uni-dortmund.de (postweb [129.217.4.49])
	(authenticated bits=0)
	by postamt.cs.uni-dortmund.de (8.12.6/8.12.6) with ESMTPSA id
	x7D7Bw58029658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 13 Aug 2019 09:11:58 +0200 (MEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 13 Aug 2019 09:11:58 +0200
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
Message-ID: <843935217a8de82c4cf47f02953489c6@cs.uni-dortmund.de>
Subject: [linux-lvm] dmsetup says "Device does not exist", though it exists
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello,

I have a volume group with 20 logical volumes. Only the last one of 
these volumes has a strange problem with dmsetup, shown by these 
commands and output on the command line:

root@host:/home/linux# /sbin/dmsetup info -c -o name --noheadings 
/dev/vg/lv20
Device does not exist.
Command failed

root@host:/home/linux# lvdisplay -c /dev/vg/lv20
   /dev/vg/lv20:vg:3:1:-1:0:4194304:512:-1:0:-1:253:19

root@host:/home/linux# mount /dev/vg/lv20 /mnt
root@host:/home/linux# ls /mnt
lost+found data1 data2

That is, dmsetup says "Device does not exist" about a logical volume, 
though the volume exists and is operating normally. What is the possible 
problem here?

Regards
   Christoph
