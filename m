Return-Path: <heartboy@nycap.rr.com>
From: Joe Morris <heartboy@nycap.rr.com>
Subject: Re: [linux-lvm] vgcreate
Date: Tue, 3 Jul 2001 09:38:22 -0400
References: <85063BBE668FD411944400D0B744267A481B89@AUSMAIL>
In-Reply-To: <85063BBE668FD411944400D0B744267A481B89@AUSMAIL>
MIME-Version: 1.0
Message-Id: <01070309382200.01132@alb-66-66-254-86>
Content-Transfer-Encoding: 8bit
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

On Monday 02 July 2001 10:14 pm, you wrote:
> Can you run vgcreate -v volname /dev/hde11, and give more verbose output?
> also, some disks, after setting the type, you may actually need to reboot
> so the kernel recognizes it properly. It could also be that it's an logical
> drive on an extended partition too.

Well, while experimenting last night, I was able to create a volume group 
with and earlier version lvm (I think beta2), so I believe it is a bug in 
beta7.  Oh, and one more thing, last night I created a volume group of 10 
gigs.  I made 2 logical volumes of around 5 gigs apiece formatted with 
reiserfs.  I then reduced the second volume by 500M and extended the first 
one by 500M.  But when I ran resize_reiserfs on the first one, I got and 
error that the first one was too small.  What is going on?  Thanks!
Joe
