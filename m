Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k25Egi105097
	for <linux-lvm@redhat.com>; Sun, 5 Mar 2006 09:42:44 -0500
Received: from mail.volved.com (c-71-192-139-98.hsd1.ma.comcast.net
	[71.192.139.98])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k25EgcdQ030561
	for <linux-lvm@redhat.com>; Sun, 5 Mar 2006 09:42:38 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.volved.com (Postfix) with ESMTP id 1F0671B8D
	for <linux-lvm@redhat.com>; Sun,  5 Mar 2006 08:51:58 -0500 (EST)
Received: from mail.volved.com ([127.0.0.1])
	by localhost (monolith [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 20605-06 for <linux-lvm@redhat.com>;
	Sun,  5 Mar 2006 08:51:50 -0500 (EST)
Received: from [192.168.0.210] (unknown [192.168.0.210])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.volved.com (Postfix) with ESMTP id A5FA41B8C
	for <linux-lvm@redhat.com>; Sun,  5 Mar 2006 08:51:50 -0500 (EST)
Message-ID: <440AECFD.5070305@volved.com>
Date: Sun, 05 Mar 2006 08:51:57 -0500
From: Barnaby Claydon <bclaydon@volved.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] New disk;
	"Couldn't find uuid" after successful pvcreate&vgextend
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

Hi all,

I've been successfully running LVM2 (2.01.04) on Debian Sarge 
(2.6.8-2-686) for months.

As I've done many times before, I added a new disk yesterday. I 
successfully ran the following, both without error:

pvcreate -v /dev/hdc
and
vgextend -v mono_media /dev/hdc

As standard practice to make sure everything was ok, I then ran:

vgscan -v

At this point I got several references to "Couldn't find uuid..." 
repeated with the same uuid several times. At this point it seemed 
logical to back-out my changes, so I tried to run the following:

vgreduce -v mono_media /dev/hdc

Unfortunately this gave the same "Couldn't find uuid..." errors as 
'vgscan'. As it seemed somewhat logical, I tried running the same 
'pvcreate' command, again without error:

pvcreate -v /dev/hdc

After 'pvcreate' had finished, I was THEN able to run 'vgreduce' and 
restore my 'mono_media' VG to working order.

At this point I was a bit baffled, running 'lvmdiskscan' after the 
initial 'pvcreate' shows the disk as present, but if I reboot after just 
that first 'pvcreate' step and run 'lvmdisksacn' after the reboot, 
/dev/hdc isn't shown.

To rule-out a hardware problem I successfully ran 'mkfs.ext3 /dev/hdc' 
and was able to mount and navigate the volume without errors. Last night 
I also left 'badblocks -svw /dev/hdc' running which is almost complete 
and hasn't found any errors yet.

I will reply with full command output once 'badblocks' has finished, but 
I hope this brief synopsis makes sense.

Thanks everyone!
-Barnaby
