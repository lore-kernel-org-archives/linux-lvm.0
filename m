Return-Path: <rasmus@jaquet.dk>
Date: Tue, 5 Jun 2001 15:46:57 +0200
From: Rasmus Andersen <rasmus@jaquet.dk>
Subject: Re: [linux-lvm] Problems with 0.9.1b7 and 2.2.20-2
Message-ID: <20010605154656.A1384@jaquet.dk>
References: <20010605092436.B856@jaquet.dk> <20010605123417.A23541@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010605123417.A23541@sistina.com>; from Mauelshagen@sistina.com on Tue, Jun 05, 2001 at 12:34:17PM +0200
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

On Tue, Jun 05, 2001 at 12:34:17PM +0200, Heinz J. Mauelshagen wrote:
> 
> This sounds like a well known ext2 problem.
> Did you run fsck successfully? And if so, didn't it work again?

Uhm. Known problem? Could you elaborate a bit? I have not seen it
before and would like to know if it is something I will encounter
regularily using ext2 and LVM.

I have run e2fsck a number of times now, and while I do not get
the kernel log message after the reboot (se below) fsck complain
and fix stuff every time in lost+found which contain a lot of
junk I cannot delete manually either.

> 
> 
> > 
> > I can do a 'dd if=/dev/<diskX> of=/dev/null' for the disks that are
> > part of the volume group without problems but if I do it for /dev/vg1/
> > lvol4, I get the error above (without the EXT2-part).
> 
> Did you *really* run "dd if=/dev/vg1/lvol4 of=/dev/null" and got that error
> in the log? Never have seen that before.

I will try to reproduce. But trying to get as much as the (used) 
filesystem with off the disk with tar resulted in a kernel panic
(this was just after my last mail):

panic: brw_page: page not locked for IO

This was put after a couple of lines of 

Jun  5 10:04:35 firewall kernel: attempt to access beyond end of device 
Jun  5 10:04:35 firewall kernel: 08:01: rw=0, want=530420, limit=410608 
Jun  5 10:04:35 firewall kernel: dev 3a:03 blksize=1024 blocknr=622592 sector=1060832 size=4096 count=1 

on the console.

-- 
Regards,
        Rasmus(rasmus@jaquet.dk)

"I'm not going to have some reporters pawing through our papers. We are
the president."  -Hillary Clinton commenting on the release of subpoenaed
documents.
