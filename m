Message-ID: <20010908192308.773.qmail@web13903.mail.yahoo.com>
Date: Sat, 8 Sep 2001 12:23:08 -0700 (PDT)
From: William Vadnais <giordanobruno@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] lvcreate is segfaulting
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
To: linux-lvm@sistina.com

Hello--

I'm getting segfaults when attempting to build a
logical volume using lvcreate...

[root@mp3gimp /root]# lvcreate -v -n now -L 8G test
lvcreate -- checking volume group name "test"
lvcreate -- checking volume group existence
lvcreate -- checking volume group activity
lvcreate -- checking logical volume path
/dev/test/now" 
    [other verbosity ignored]
lvcreate -- setting up logical volume
lvcreate -- setting read ahead sectors
lvcreate -- creating logical volume VGDA in kernel
Segmentation fault (core dumped)

This is a Redhat 7.1 box with a custom kernel. I've
tried using both 2.4.9 and 2.4.10pre5 to no avail. LVM
module is compiled into the kernel directly and I've
applied the patches in the /PATCHES dir.  I've also
tried the latest tarball release of rc2 as well as a
CVS install as late as today (September 8th, 2001).

If anybody has any insight on this, i'd appreciate it.
Thanks.

-Willie



__________________________________________________
Do You Yahoo!?
Get email alerts & NEW webcam video instant messaging with Yahoo! Messenger
http://im.yahoo.com
