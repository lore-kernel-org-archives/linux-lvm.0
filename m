Return-Path: <bluca@comedia.it>
Date: Sat, 26 May 2001 08:28:26 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm on root filesystem with devfs
Message-ID: <20010526082826.A8922@colombina.comedia.it>
References: <3B0EE5FA.1923148@americasm01.nt.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B0EE5FA.1923148@americasm01.nt.com>; from harvell@nortelnetworks.com on Fri, May 25, 2001 at 06:08:42PM -0500
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

On Fri, May 25, 2001 at 06:08:42PM -0500, Joe Harvell wrote:
> When I run with devfs, though, the /dev entries don't ever show up in
> /dev when I do a vgscan.  The result is that I am not able to mount the
> lvm root filesystem.
> 
> 
>    * Does the fact that I have lvm compiled as a module have anything to
>      do with this?
When you run with devfs device entries are not created by vgscan.
IIRC they should be created by the kernel whenever you activate the vg.

>    * Assuming the entries are created, then I shouldn't have to use cpio
>      anymore (with devfs).  Right?
right, the devfs mounted on your initrd is the same devfs that gets mounted
on /dev after pivot_root.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
