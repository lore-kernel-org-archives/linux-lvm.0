Return-Path: <bluca@comedia.it>
Date: Fri, 27 Apr 2001 22:47:40 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and I must scream"
Message-ID: <20010427224740.D2260@colombina.comedia.it>
References: <3AE91AEF.22ABDC51@home.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3AE91AEF.22ABDC51@home.com>; from banal@home.com on Fri, Apr 27, 2001 at 12:08:31AM -0700
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

On Fri, Apr 27, 2001 at 12:08:31AM -0700, Evan Day wrote:
> After activating vg00 and umounting /proc (in initrd/linuxrc), the system 
> dies:
> 
> Kernel panic: I have no root and I must scream!
> 
i use lilo not grub,
but try adding either
root=0x3a00
or 
root=/dev/vg01/lvol1

to the oprions you pass to the kernel.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
