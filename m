From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011202152556.D27109@colombina.comedia.it>
References: <Pine.LNX.4.21.0111291649440.435-100000@sol.rune.org> <Pine.LNX.4.33.0111291608480.4437-100000@lx1.daboard.com> <20011129190920.B23998@kluge.net> <20011130020118.C17482@wookimus.net> <20011130114912.K26718@kluge.net> <20011130183933.A20547@colombina.comedia.it> <3C07C9D4.6020904@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C07C9D4.6020904@st-peter.stw.uni-erlangen.de>; from galia@st-peter.stw.uni-erlangen.de on Fri, Nov 30, 2001 at 07:03:00PM +0100
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
Date: Sun Dec  2 08:24:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 30, 2001 at 07:03:00PM +0100, svetljo wrote:
> >>With / on LVM, you're definately unable to boot if LVM has problems.
> >>
> >with / on ext2 you're definately unable to boot if ext2 has problems.
> >
> sorry , but you can not compare the PB's
> it's not about the FS , but the device access

why not? see below

> >>This is a problem I've seen a number of times on HPUX.  The OS disk is
> >>
> >you cannot extend / under HP-UX (they don't have initrd)
> >
> initrd ?
> isn't that smth special for linux ?
yes, i was *joking*, what i meant was that lvm information for
booting is fed statically to the kernel.

> the next version of LVM should work without initrd and EVMS works 
> without initrd
> the kernel should be able to activate the devices without additional 
> binaries
linux also has _initfunc, which should free the kernel from bloat of
driver initialization code (eg kernelspace implementations of
vgscan/vgchange)
> >besides i don't see the difference with someone having / un one disk
> >and /usr on another without LVM.
> >
> isn't it common for all *nix OSes that they have a small / with only the 
> very essential libraries , binaries and conf's
> and everything other goes to /usr 
please I'd be thankful if ppl did read emails in the thread before replying
I was responding to Theo's claims, who said that if a luser extends /
over two disks he duubles the chance of failure. I was saying that lusers
has many ways of of shooting themselves in the feet.

my point is that there is no reason saying that root lvm is dangerous
and should be avoided. i have been using it for almost an year, and
i consider it as stable as root on an extended pc partition.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
