Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i48Mlwv22916
	for <linux-lvm@redhat.com>; Sat, 8 May 2004 18:47:58 -0400
Received: from mail.demonnet.org ([83.148.73.2])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i48Mls0m011648
	for <linux-lvm@redhat.com>; Sat, 8 May 2004 18:47:56 -0400
Message-ID: <409D63BB.8090207@demonnet.org>
Date: Sun, 09 May 2004 01:48:27 +0300
From: Nikolay Dimitrov <nIks@demonnet.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Strange problems, is it the lvm?
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

Hi,
I've created a 680gb volume group with reiserfs on top of lvm, which is 
used frequently by users. it worked fine for two weeks and now I have 
that strange problem:
root@main:~# ls /users
/usr/bin/ls: /users/Hell: Permission denied
/usr/bin/ls: /users/Blade: Permission denied
/usr/bin/ls: /users/Ferdy: Permission denied
...
Seems like a fs corruption to me. I fixed that with reiserfsck 
--rebuid-tree. The system worked fine again for a few days and the 
problem appeared again. My configuration is Slackware 9.1 updated to 
current, linux kernel 2.6.4.
  LVM version:     2.00.08 (2003-11-14)
  Library version: 1.00.07-ioctl (2003-11-21)
  Driver version:  4.0.0

IMHO the problem is in the lvm or the combination lvm + reiserfs? 
Perhaps my lvm version is old or i need some patches to the linux kernel?
Do you have any idea what is the problem here? Any suggestions?

P.S. Please apologize me if you find that post a bit offtopic but I'm 
despaired.
