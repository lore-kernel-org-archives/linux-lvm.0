From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM on IA64
Message-ID: <20011022133008.E557@tykepenguin.com>
References: <Pine.LNX.4.32.0110221243510.27769-100000@omega.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.32.0110221243510.27769-100000@omega.suse.de>; from sf@suse.de on Mon, Oct 22, 2001 at 01:00:56PM +0200
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
Date: Mon Oct 22 07:29:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 22, 2001 at 01:00:56PM +0200, Stefan Fent wrote:
> Hi,
> 
> On IA64 lvcreate segfaults when 'lv_allocated_le'
> is bigger than 1 (mostly 125).
> I need information about where this value is created, and what it is good
> for, as this seem to happen randomly.
> Program received signal SIGSEGV, Segmentation fault.
> 0x20000000001a0fd1 in chunk_alloc () from /lib/libc.so.6.1
> (gdb) bt
> #0  0x20000000001a0fd1 in chunk_alloc () from /lib/libc.so.6.1
> #1  0x200000000019f720 in malloc () from /lib/libc.so.6.1
> #2  0x200000000007af10 in vg_cfgrestore (vg_name=0x80000fffffffb9d4
> "volg02",
>     vg_backup_path=0x80000fffffffa870 "/etc/lvmtab.d/volg02", opt_v=0,
> vg=0x20000000000aab30)
>     at vg_cfgrestore.c:177
> #3  0x2000000000067540 in lvm_tab_vg_read_with_pv_and_lv
> (vg_name=0x80000fffffffb9d4 "volg02",
>     vg=0x80000fffffffae38) at lvm_tab_vg_read_with_pv_and_lv.c:60
> #4  0x4000000000008420 in main (argc=3, argv=0x80000fffffffb728) at
> libio.h:633
> (gdb)

If it's crashing in malloc then almost certainly some memory is being
overwriten elsewhere in the code.

I know rc4 works fine on Alpha so that should rule out any 64bit related 
problems. It's probably worth trying ElectricFence or some such malloc debugger
to isolate just where the corruption is occurring.

patrick
