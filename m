Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A481AD6@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] Software Raid 1 problems(core dumps)
Date: Sat, 23 Jun 2001 22:50:33 -0500
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

The error you're getting actually sounds correct, not that it should
core-dump but an error should be displayed to tell you it must read a
partition otherwise it can't really do what it's supposed to do. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Robert_Macaulay@Dell.com [mailto:Robert_Macaulay@Dell.com]
> Sent: Saturday, June 23, 2001 4:26 PM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Software Raid 1 problems(core dumps)
> 
> 
> This is on the CVS version of LVM checked out June 23rd.
> 
> When using the entire block device for a MD RAID1 device 
> along with LVM,
> vgscan will core dump after VG's are defined. Example
> 
> /dev/md0 = /dev/sdc and /dev/sdd
> 
> The following commands work fine.
> vgscan
> pvcreate /dev/md0
> vgscan
> vgcreate test_vg /dev/md0
> vgscan(core dump)
> 
> But once I try a vgscan after the vgcreate, it core dumps. 
> Changing from
> /dev/sdc to /dev/sdc1 in the /etc/raidtab makes it work just fine. 
> 
> Perhaps a line in the faq about core dumping with MD devices 
> could help
> someone in the future.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
