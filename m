Date: Fri, 14 Sep 2001 19:16:09 +0200 (CEST)
From: "A.R. (Tom) Peters" <tpeters@xs4all.nl>
Subject: Re: [linux-lvm] How to boot with LVM?
In-Reply-To: <002b01c13c98$d3080be0$6601a8c0@foobarhouse.com>
Message-ID: <Pine.LNX.4.21.0109141908220.617-100000@tompth.localdomain>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 13 Sep 2001, Neil Macvicar wrote:

> A few notes I missed: This ramdisk I made myself. You can mount it on
> loopback after untarring it to examine it's contents. It's size sould be set
> to 8192.

> ----- Original Message -----
> From: "Neil Macvicar" <neilm@foobarhouse.com>
> To: <linux-lvm@sistina.com>
> Sent: Thursday, September 13, 2001 1:15 PM
> Subject: Re: [linux-lvm] How to boot with LVM?
> 
> 
> > If it's any help, I have put my initrd on public ftp at
> > fruits.foobarhouse.com in the LVM directory. It's served me well for as
> long
> > as I've been using LVM'ed root.
> >
> > I'm currently using LVM 0.9.1beta8.

The past week I have tried very many times to get Linux mount the root
on my LVM disk: but whenever the linuxrc on the initrd finishes, the
kernel finds itself without a root.
Switching root is supposed to happen automatically, but that mechanism is
obsoleted: instead, we are supposed to do a pivot_root and chroot (see
/usr/src/linux/Documents/initrd.txt).  neither method works.
I suspect a kernel problem now.  I suppose I should go back to an earlier
kernel version, and maybe to a 0.9 LVM.  Can you please advice what kernel
you use?
Additionally, would you try out the latest kernel (2.4.10-pre8) and LVM
(1.0.1-rc2) to see if that works for you?

	Thanx,
--
#>!$!%(@^%#%*(&(#@#*$^@^$##*#@&(%)@**$!(&!^(#((#&%!)%*@)(&$($$%(@#)&*!^$)^@*^@)

	Tom "thriving on chaos" Peters
		NL-1062 KD nr 149	tel.    +31-204080204
 			Amsterdam	e-mail  tpeters@xs4all.nl
