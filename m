Return-Path: <root@srv.sistina.com>
Date: Tue, 22 May 2001 12:30:40 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems applying lvm patches for kernel 2.4.4
Message-ID: <20010522123040.B15681@sistina.com>
References: <D339456E76CDD211BC7300A0C9A28E30013B8414@SES000900-017>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <D339456E76CDD211BC7300A0C9A28E30013B8414@SES000900-017>; from plpm@mapfre.com on Tue, May 22, 2001 at 10:36:51AM +0200
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Paniagua,

this is a known problem already fixed in our CVS repository.

Ether get the SW from http://www.sistina.com/lvm or
change get_hardblocksize to get_hardsect_size and recompile.

Regards,
Heinz    -- The LVM Guy --


On Tue, May 22, 2001 at 10:36:51AM +0200, Paniagua Moreno, Pedro Luis wrote:
> Hello:
> 	I'm having a problem with a patched 2.4.4 kernel updated with
> patches for LVM 0.91beta7. This is the message I get when I load lvm-mod:
> 	[root@ues023921-002 /root]# insmod lvm-mod
> 	Using /lib/modules/2.4.4/kernel/drivers/md/lvm-mod.o
> 	/lib/modules/2.4.4/kernel/drivers/md/lvm-mod.o: unresolved symbol
> get_hardblocksize
> 
> 	And here's my environment:
> 	� RedHat 7.0+kernel 2.4.4 from www.kernel.org
> 	� LVM 0.91beta_7 (upgraded from LVM 0.8):
> 		lvm-iop10-0.9.1_beta7-1
> 		lvm-iop10-lib-0.9.1_beta7-1
> 		lvm-iop10-man-0.9.1_beta7-1
> 		lvm-base-1.1-1
> 		lvm-iop10-patchgen-0.9.1_beta7-1
> 	I followed all the steps on upgrading the LVM software as well as
> the kernel patcher. Here is the Makefile I touched according to the
> instructions:
>  <<Makefile>> 
> 	I also did the rc.sysinit update in order to get VG's activated at
> boot time.
> 	Before I patched the kernel, I succesfully managed to create a VG,
> LV, f/s, etc. Just this message on dmesg looks strange to me:
> 	May 21 16:45:49 ues023921-002 kernel: LVM version 0.9.1_beta2  by
> Heinz Mauelsha
> 	gen  (18/01/2001)
> 	May 21 16:45:49 ues023921-002 kernel: lvm -- Module successfully
> initialized
> 	May 21 16:45:49 ues023921-002 kernel: lvm -- lvm_chr_ioctl: unknown
> command 4004
> 	fe0a
> 
> 	Well, this is all for the moment. I will try hacking a bit to try to
> guess anything more. Any help will be appreciated.
> 
> Thanks in advance
> > 			 Pedro Luis Paniagua Moreno 
> > 			MAPFRE AMERICA
> > 			Inform�tica - Area T�cnica
> > 			Tel: (+34) 915 81 50 18
> > 			Fax: (+34) 915 81 11 19
> > 			e-mail: plpm@mapfre.com
> > 
> > 

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
