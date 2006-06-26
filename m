Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5QGl9iH012271
	for <linux-lvm@redhat.com>; Mon, 26 Jun 2006 12:47:09 -0400
Received: from web33408.mail.mud.yahoo.com (web33408.mail.mud.yahoo.com
	[68.142.206.140])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k5QGl34m013253
	for <linux-lvm@redhat.com>; Mon, 26 Jun 2006 12:47:03 -0400
Message-ID: <20060626164657.79277.qmail@web33408.mail.mud.yahoo.com>
Date: Mon, 26 Jun 2006 09:46:57 -0700 (PDT)
From: Rehan <rehan1212@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Setting up LVM with existing RAID 1 (Mirror)
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

Hi All,
I have SUSE 9.0 SP2 installed with two 70GB Hardware
RAID 1(Its a DEll Poweredge mirrored). We have an /opt
partition which is alomst full. We need to use LVM to
expand OPT. We have plenty of free space on the disk.
I think LVM2 is installed but not configured since we
have a lvm.conf file under /etc/lvm. I have not used
LVM before so I was wondring if you guys can help me
out with what needs to be done to expand /opt. My
first question is it possible to expand opt using LVM
with existing RAID 1. My second question is do we have
to break the mirror and what are the steps involved to
get it done? If you guys know of any document that I
can read and figure this out it would be great. 

dda006:/etc/lvm # lvscan
  No volume groups found

dda006:/etc/lvm # fdisk -l

Disk /dev/sda: 73.2 GB, 73274490880 bytes
255 heads, 63 sectors/track, 8908 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id
 System
/dev/sda1   *           1         784     6297448+  83
 Linux
/dev/sda2             785        8907    65247997+   f
 W95 Ext'd (LBA)
/dev/sda5             785        1176     3148708+  82
 Linux swap
/dev/sda6            1177        1960     6297448+  83
 Linux
/dev/sda7            1961        2744     6297448+  83
 Linux
/dev/sda8            2745        3528     6297448+  83
 Linux
/dev/sda9            3529        3790     2104483+  83
 Linux
/dev/sda10           3791        4052     2104483+  83
 Linux
dda006:/etc/lvm # df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1             6.1G  1.2G  4.9G  20% /
tmpfs                1013M   12K 1013M   1% /dev/shm
/dev/sda9             2.1G  1.4G  699M  66% /home
/dev/sda8             6.1G  5.6G  435M  93% /opt
/dev/sda10            2.1G  1.3G  778M  63% /tmp
/dev/sda6             6.1G  2.5G  3.6G  41% /usr
/dev/sda7             6.1G  149M  5.9G   3% /var
hco431brgdda006:/etc/lvm #


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
