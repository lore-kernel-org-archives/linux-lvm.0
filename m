Return-Path: <bill@mbsmm.com>
Message-ID: <3AA79CDF.4AA3324C@mbsmm.com>
Date: Thu, 08 Mar 2001 09:53:19 -0500
From: Bill Clark <bill@mbsmm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] EXT2-fs panic (device lvm(58,0)):
References: <200103080552.f285qaV21678@webber.adilger.net>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Andreas Dilger wrote:
> 
> Bill Clark writes:
> > I also tried the patch and it didn't panic this time, the machine just
> > re-booted  :(  I was trying to cp the file and it aborted with:
> >
> > cp: win2000.dsk: Input/output error
> 
> Any error messages in /var/log/messages?
> 

The one thing I do see in the messages file is that there are some SCSI
errors, but they only start after the cp bombs, so the question is which
one causes the other?




> > > Also, the output from debugfs "stat <inode_number>" would help as well.
> >

Here is the output from the debugfs:

[root@zale log]# debugfs
debugfs 1.18, 11-Nov-1999 for EXT2 FS 0.5b, 95/08/09
debugfs:  open /dev/vg00/vmware01
debugfs:  stat win2000.dsk
Inode: 12   Type: regular    Mode:  0664   Flags: 0x0  
Version/Generation: 592822
User:     0   Group:     0   Size: 1108485120
File ACL: 0    Directory ACL: 0
Links: 1   Blockcount: 2167144
Fragment:  Address: 0    Number: 0    Size: 0
ctime: 0x3aa54634 -- Tue Mar  6 15:19:00 2001
atime: 0x3aa79587 -- Thu Mar  8 09:21:59 2001
mtime: 0x3aa54634 -- Tue Mar  6 15:19:00 2001
BLOCKS:
521 531 534 535 536 537 538 539 540 541 542 543 544 545 546 547 548 549
550 551 552 553 554 555 556 557 558 559 560 

 ...Plus a LOT more blocks...it is a 1.1G file

> > Filesystem state:         not clean with errors
> 
> This means that there is something wrong with the filesystem (could be a

Ran e2fsck and it rans for 5 minutes spitting out errors.  I beginning
to think the whole filesystem is hosed...glad it is only test data.

FYI, I am still running with the patch you sent.

Thanx for your help!

Bill
