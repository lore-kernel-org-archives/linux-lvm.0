Return-Path: <bluca@comedia.it>
Date: Tue, 17 Jul 2001 01:36:10 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Newbie question
Message-ID: <20010717013610.G29657@colombina.comedia.it>
References: <FDEJIMPDHJAAPNLFKBMGAECACEAA.tgs@iafrica.com> <20010712094638.B418@btconnect.com> <200107121612.MAA13656@burns.luca.2y.net> <20010713131200.C32198@sistina.com> <200107131652.MAA15766@burns.luca.2y.net> <20010716133321.E11625@sistina.com> <235800000.995296082@dizzy>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <235800000.995296082@dizzy>; from lembark@wrkhors.com on Mon, Jul 16, 2001 at 10:08:02AM -0500
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

On Mon, Jul 16, 2001 at 10:08:02AM -0500, Steven Lembark wrote:
> 
> >> Now I have a question. I read the HOWTO migrate the old root partition to a
> >> LV
> 
> Think really, really hard before trying this.  Linux on an X86 doesn't have
> an LVM aware bios and you cannot boot w/o LVM (e.g., HP's "-lm").  This
> means that if you have any error at all in LVM you cannot boot.

and HP9000 haven't either!
-lm works because the vg layout is saved in a file in /stand
they have LVM activation in the kernel tough (sorta, they still need a contiguous root, placed
on the same PV as the kernel is)

> A safer approach -- especially if you havn't used LVM before -- is to use
> the first 2-3 partitions for /, swap and /var.  This allows you to boot even if
maybe / if linux had a sane use for /sbin, but swap and var are unneeded.

(btw i have lvm root and i am happy)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
