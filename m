Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5JBjc009666
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 07:45:38 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.185])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5JBjbe1002003
	for <linux-lvm@redhat.com>; Sat, 19 Jun 2004 07:45:38 -0400
Received: from [212.227.126.208] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1BbeHu-00079B-00
	for linux-lvm@redhat.com; Sat, 19 Jun 2004 13:45:34 +0200
Received: from [217.230.161.203] (helo=pd9e6a1cb.dip0.t-ipconnect.de)
	by mrelayng.kundenserver.de with asmtp (TLSv1:RC4-MD5:128)
	(Exim 3.35 #1) id 1BbeHu-0002Os-00
	for linux-lvm@redhat.com; Sat, 19 Jun 2004 13:45:34 +0200
From: Hauke Laging <mailinglisten@hauke-laging.de>
Date: Sat, 19 Jun 2004 13:45:32 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200406191345.32913.mailinglisten@hauke-laging.de>
Subject: [linux-lvm] vgcfgbackup: backup of several VGs into one file fails
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
To: linux-lvm@redhat.com

Hello,

I just tried to make a backup of all my VGs into one file using the 
following command:

vgcfgbackup -d -f lvm--2004-06-19
  : open failed: No such file or directory
  Volume group "storage" successfully backed up.
  : open failed: No such file or directory
  Volume group "linux" successfully backed up.

Unfortunately after that the file lvm--2004-06-19 contains information 
about the VG "linux" only.

strace shows this:
[...]
rename("./.lvm_server_12035_1954474236", "lvm--2004-06-19.tmp") = 0
rename("lvm--2004-06-19.tmp", "lvm--2004-06-19") = 0
[...]
rename("./.lvm_server_12035_348633387", "lvm--2004-06-19.tmp") = 0
rename("lvm--2004-06-19.tmp", "lvm--2004-06-19") = 0
[...]

It seems to me that both VG backups are written to the same file by writing 
them to a temporary file and then renaming this. Of course, by this all 
former backups are overwritten as the file is overwritten every time.

The ": open failed: No such file or directory" message is probably caused 
by this:
stat64("lvm--2004-06-19.tmp", 0xbfffc9a0) = -1 ENOENT (No such file or 
directory)
open("", O_RDONLY|O_LARGEFILE)          = -1 ENOENT (No such file or 
directory)
These two lines immediately follow the "rename" lines.

Do I misunderstand anything? The man page does not look too complicated...


vgcfgbackup --version
  LVM version:     2.00.15 (2004-04-19)
  Library version: 1.00.09-ioctl (2004-03-31)
  Driver version:  4.1.0


Best regards,

Hauke Laging
