Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA240mr11544
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 23:00:48 -0500
Received: from openstreet.com (qmailr@dsl254-118-176.nyc1.dsl.speakeasy.net
	[216.254.118.176])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iA240mJm008654
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 23:00:48 -0500
Message-ID: <4187066F.40604@openstreet.com>
Date: Mon, 01 Nov 2004 23:00:47 -0500
From: Paul Check <paul@openstreet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM to LVM2 Kernel 2.6 migration, RAID 1
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi: I'm trying to get lvm2 running on a Debian box as I also migrate to 
2.6.  Unfortunately, I am not able to boot
into the 2.6 kernel, getting the "VFS: Unable to mount root fs.." error 
(from memory).

Now, my setup is that I DO NOT have /boot and / on LVM, but they are 
raided (RAID 1, hardware, adaptec) together: For FYI here is the output 
from df:

/dev/md1                303260    228986     58617  80% /
tmpfs                  1676944         0   1676944   0% /dev/shm
/dev/md0                155439     16761    130653  12% /boot
/dev/mapper/VGSystem-usr                        8773016   4147920   
4268584  50% /usr
/dev/mapper/VGSystem-var                       10321208    521336   
9275584   6% /var
/dev/mapper/VGSystem-home                   115894732   9249448 
103112976   9% /home
/dev/mapper/VGSystem-tmp                      495844      8253    
461991   2% /tmp
/dev/mapper/VGSystem-usr_local              4128448    676460   3242276  
18% /usr/local

I have read about setting up a mkinitrd script, although it seems that 
this is only needed if / is on lvm. I have Fusion MPT, RAID 1, SCSI 
disk, etc all compiled into the kernel.

Any ideas?

Cheers, Paul
