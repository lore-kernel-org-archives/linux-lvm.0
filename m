Return-Path: <root@srv.sistina.com>
Date: Mon, 18 Jun 2001 17:39:11 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems with 0.9.1b7 and 2.2.20-2
Message-ID: <20010618173911.A15676@sistina.com>
References: <20010605092436.B856@jaquet.dk> <20010605123417.A23541@sistina.com> <20010605154656.A1384@jaquet.dk>
Mime-Version: 1.0
In-Reply-To: <20010605154656.A1384@jaquet.dk>; from rasmus@jaquet.dk on Tue, Jun 05, 2001 at 03:46:57PM +0200
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

On Tue, Jun 05, 2001 at 03:46:57PM +0200, Rasmus Andersen wrote:
> On Tue, Jun 05, 2001 at 12:34:17PM +0200, Heinz J. Mauelshagen wrote:
> > 
> > This sounds like a well known ext2 problem.
> > Did you run fsck successfully? And if so, didn't it work again?
> 
> Uhm. Known problem? Could you elaborate a bit?

I was refering to ext2 consistency problems in older kernels which have been
fixed in the meantime. You need to have recent ext2 tool as well.

> I have not seen it
> before and would like to know if it is something I will encounter
> regularily using ext2 and LVM.

No, you shouldn't in case you have recent ext2 software.

> 
> I have run e2fsck a number of times now, and while I do not get
> the kernel log message after the reboot (se below) fsck complain
> and fix stuff every time in lost+found which contain a lot of
> junk I cannot delete manually either.
> 
> > 
> > 
> > > 
> > > I can do a 'dd if=/dev/<diskX> of=/dev/null' for the disks that are
> > > part of the volume group without problems but if I do it for /dev/vg1/
> > > lvol4, I get the error above (without the EXT2-part).
> > 
> > Did you *really* run "dd if=/dev/vg1/lvol4 of=/dev/null" and got that error
> > in the log? Never have seen that before.
> 
> I will try to reproduce. But trying to get as much as the (used) 
> filesystem with off the disk with tar resulted in a kernel panic
> (this was just after my last mail):
> 
> panic: brw_page: page not locked for IO
> 
> This was put after a couple of lines of 
> 
> Jun  5 10:04:35 firewall kernel: attempt to access beyond end of device 
> Jun  5 10:04:35 firewall kernel: 08:01: rw=0, want=530420, limit=410608 
> Jun  5 10:04:35 firewall kernel: dev 3a:03 blksize=1024 blocknr=622592 sector=1060832 size=4096 count=1 
> 
> on the console.
> 
> -- 
> Regards,
>         Rasmus(rasmus@jaquet.dk)
> 
> "I'm not going to have some reporters pawing through our papers. We are
> the president."  -Hillary Clinton commenting on the release of subpoenaed
> documents.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
