Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBTGgGr04446
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2004 11:42:16 -0500
Received: from sv0.iquer.net (sv0.iquer.net [195.234.230.70])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id iBTGgAaX005265
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2004 11:42:10 -0500
From: Erik Wasser <erik.wasser@iquer.net>
Date: Wed, 29 Dec 2004 17:42:04 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200412291742.04569.erik.wasser@iquer.net>
Subject: [linux-lvm] Very long startup times of the lv*-tools
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

Hello linux-lvm@redhat.com,

I've just created a LVM here and the lv* commands are taking very long 
(lvcreate is working for 10 minutes and is keep on going). I used a 
'strace -p PID' to get some more infos and I was amazed:

------------------------------------------------------------------------

stat64
("/dev/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc125/ide/host0/bus0/target0/lun0/part1", 
0xbfffe31c) = -1 ENOENT (No such file or directory)
stat64
("/dev/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc10/discs/disc160/ide/host0/bus0/target0/lun0/part1", 
0xbfffe31c) = -1 ENOENT (No such file or directory)
[...]

There were thousand of lines with that or similar. Is that normal? Is it 
a bug?

------------------------------------------------------------------------

I've done the following (from the gentoo homepage: 
http://www.gentoo.org/doc/en/lvm2.xml):

% mkdir -p /etc/lvm
% echo 'devices { filter=["r/cdrom/"] }' >/etc/lvm/lvm.conf
% vgscan
% vgchange -a y
% pvcreate /dev/hde1 /dev/hdf1 /dev/hdg1
% vgcreate backup-raid /dev/hde1
% vgextend backup-raid /dev/hdf1
% vgextend backup-raid /dev/hdg1
% lvcreate -L566G -nmain  backup-raid

I'm using lvm2 2.00.08 on a 'Linux fuzz 2.6.9-gentoo-r13 #1 Wed Dec 29 
10:41:06 CET 2004 i686 AMD Athlon(tm) XP 2800+ AuthenticAMD GNU/Linux'

Is there is something known about this issue? What else can I check?

-- 
So long... Fuzz
