Message-ID: <134691555.1002562652686.JavaMail.root@boots>
Date: Mon, 8 Oct 2001 10:37:04 -0700
From: "Karl" <rmvzj001@sneakemail.com>
Subject: Re: [linux-lvm] LVM seems to be causing SCSI errors.
Mime-Version: 1.0
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

> The only thing I can think is that the SCSI device is not being
> opened/initialised properly by LVM.  This certainly wasn't happening
> before ~July when I put the open/close_pv() functions in.  But should
> be working now.  Puzzled.  You really are using the new tools and not
> old binaries in strange places ?  I've been caught a couple of times
> by this ...

I'm pretty sure I'm using the correct binaries. Date/time stamps on the
only ones I find on my system agree with when I compiled the latest
release.

I'm using the static links so the libraries should not be an issue
either. The only binaries I run on my tests are pvcreate, vgextend,
vgreduce, lvcreate, and lvremove. The patch of the kernel and kernel
recompile went without errors. LVM is compiled as a module, not in the
kernel itself.

-- 
Karl Hakimian
