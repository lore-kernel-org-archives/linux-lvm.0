Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l627Cbvl014951
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 03:12:37 -0400
Received: from jogback.se (root@mail1.jogback.se [192.165.82.16])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l627CZKb015778
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 03:12:36 -0400
Received: from [130.244.254.1] (account lm HELO [127.0.0.1])
	by mail1.jogback.se (CommuniGate Pro SMTP 5.1.9)
	with ESMTPA id 4525085 for linux-lvm@redhat.com;
	Mon, 02 Jul 2007 09:12:32 +0200
Message-ID: <4688A567.2030005@swip.net>
Date: Mon, 02 Jul 2007 09:12:39 +0200
From: =?ISO-8859-1?Q?Lars_Michael_Jogb=E4ck?= <lm@swip.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problems(?) with pvresize
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

Hi,

I've got a similar problem to the one reported earlier in June by Peter 
Daum.

I've got a hardware-raid5 that I've extended (/dev/sdk), and after 
extending it, I get the kernel to recognize the new size.
But pvresize is still using the old size. I'm pretty convinced that a 
reboot will solve this issue for me, but isn't there a way
of solving this without rebooting?

$ cat /sys/block/sdk/size
4882708480

# blockdev --getsz /dev/sdk
3906166784

# pvresize -v -d /dev/sdk
    Using physical volume(s) on command line
    Wiping cache of LVM-capable devices
    Archiving volume group "vg01" metadata (seqno 123).
    No change to size of physical volume /dev/sdk.
    Resizing volume "/dev/sdk" to 3906166400 sectors.
    Updating physical volume "/dev/sdk"
    Creating volume group backup "/etc/lvm/backup/vg01" (seqno 124).
  Physical volume "/dev/sdk" changed
  1 physical volume(s) resized / 0 physical volume(s) not resized

# lvm version
  LVM version:     2.02.07 (2006-07-17)
  Library version: 1.02.08 (2006-07-17)
  Driver version:  4.7.0

Best Regards,
/LM
