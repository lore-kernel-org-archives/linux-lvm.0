Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FKd8K7017655
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 16:39:08 -0400
Received: from web31801.mail.mud.yahoo.com (web31801.mail.mud.yahoo.com
	[68.142.207.64])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k7FKd1Tx013516
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 16:39:02 -0400
Message-ID: <20060815203856.13265.qmail@web31801.mail.mud.yahoo.com>
Date: Tue, 15 Aug 2006 13:38:55 -0700 (PDT)
From: Edward Quillen <ed@quillen.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvmove of lvs while filesystems mounted not supported?!?
Reply-To: ed@quillen.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Redhat support is telling me (see quote below) that pvmove is not supported when there are mounted
filesystems on top of the lvs that are being moved. Can this be true? Everyother lvm that I have
worked with allows this. I am currently experiencing device mapper hangs when I run pvmove while
there are filesystems mounted even if there is no processes using the filesystems. 
Is this supposed to work? If so, has anyone had similar issues? Any help would be appreciated? 

Thanks,
Ed
ed@quillen.net

server info:

<Z>sys66# uname -a
Linux sys66.kelly.com 2.6.9-34.ELsmp #1 SMP Fri Feb 24 16:56:28 EST 2006 x86_64 x86_64 x86_64
GNU/Linux
<Z>sys66# rpm -qa | egrep 'lvm|device-map'
device-mapper-1.02.02-3.0.RHEL4
lvm2-2.02.01-1.3.RHEL4
system-config-lvm-1.0.16-1.0
device-mapper-1.02.02-3.0.RHEL4


redhat response:

Hello,
The pvmove command attempts to move all of the data off the pv for a vg. Since the pvmove cannot
lock the vg from putting information back on the pv this operation does not work. A pvmove is
normally done when a the vgs\lvs connected to it are not mounted. Once the pvmove is completed you
would start removing the space allocated to the vg. This operation is not supported while the
assocated filesystems are mounted.

Thank You
