Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A643352@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] vgcreate
Date: Tue, 3 Jul 2001 11:35:49 -0500 
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

Try unmounting it, remounting it then extend. If that doesn't do it, unmount
it, run reiserfs_repair, then remount it, then extend. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Joe Morris [mailto:heartboy@nycap.rr.com]
> Sent: Tuesday, July 03, 2001 8:38 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] vgcreate
> 
> 
> On Monday 02 July 2001 10:14 pm, you wrote:
> > Can you run vgcreate -v volname /dev/hde11, and give more 
> verbose output?
> > also, some disks, after setting the type, you may actually 
> need to reboot
> > so the kernel recognizes it properly. It could also be that 
> it's an logical
> > drive on an extended partition too.
> 
> Well, while experimenting last night, I was able to create a 
> volume group 
> with and earlier version lvm (I think beta2), so I believe it 
> is a bug in 
> beta7.  Oh, and one more thing, last night I created a volume 
> group of 10 
> gigs.  I made 2 logical volumes of around 5 gigs apiece 
> formatted with 
> reiserfs.  I then reduced the second volume by 500M and 
> extended the first 
> one by 500M.  But when I ran resize_reiserfs on the first 
> one, I got and 
> error that the first one was too small.  What is going on?  Thanks!
> Joe
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
