Return-Path: <pascal_heger@hotmail.com>
From: "Pascal Heger" <pascal_heger@hotmail.com>
Subject: Re: [linux-lvm] pvscan - - invalid i/o protocol version
Date: Mon, 09 Jul 2001 10:20:26 +0200
Mime-Version: 1.0
Message-ID: <F179ZKoEh63qsNwh1Ut00002caa@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks for your reply.

I did have the LVM module loaded. I don't know what the problem was. 
Probably incompatibility between Kernel module, and program version or 
something.

Was able to resolve the issue by upgrading to version 0.9-1 "redhat binary".

Cheers,
Pascal



>From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
>Reply-To: linux-lvm@sistina.com
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] pvscan - - invalid i/o protocol version
>Date: Mon, 9 Jul 2001 09:58:34 +0200
>MIME-Version: 1.0
>Received: from [208.210.145.141] by hotmail.com (3.2) with ESMTP id 
>MHotMailBD12B0A900B3400431D7D0D2918D12B40; Mon, 09 Jul 2001 01:04:58 -0700
>Received: (qmail 3914 invoked from network); 9 Jul 2001 08:04:03 -0000
>Received: from localhost (HELO hermes.sistina.com) (127.0.0.1)  by 
>localhost with SMTP; 9 Jul 2001 08:04:03 -0000
>Received: (qmail 3744 invoked from network); 9 Jul 2001 08:03:01 -0000
>Received: from p3e9e0805.dip.t-dialin.net (HELO srv.sistina.com) 
>(root@62.158.8.5)  by hermes.sistina.com with SMTP; 9 Jul 2001 08:03:01 
>-0000
>Received: (from root@localhost)by srv.sistina.com (8.9.3/8.9.3/SuSE Linux 
>8.9.3-0.1) id JAA12408for linux-lvm@sistina.com; Mon, 9 Jul 2001 09:58:50 
>+0200
From linux-lvm-admin@sistina.com Mon, 09 Jul 2001 01:05:44 -0700
>Return-Path: <root@srv.sistina.com>
>Delivered-To: linux-lvm@sistina.com
>Message-ID: <20010709095834.A12405@sistina.com>
>References: <F2153oryKFRJrzdDW6l00000349@hotmail.com>
>X-Mailer: Mutt 1.0.1i
>In-Reply-To: <F2153oryKFRJrzdDW6l00000349@hotmail.com>; from 
>pascal_heger@hotmail.com on Sun, Jul 08, 2001 at 01:34:23PM +0200
>X-Sender: Mauelshagen@Sistina.com
>Sender: linux-lvm-admin@sistina.com
>Errors-To: linux-lvm-admin@sistina.com
>X-BeenThere: linux-lvm@sistina.com
>X-Mailman-Version: 2.0.4
>Precedence: bulk
>X-Reply-To: Mauelshagen@sistina.com
>List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
>List-Post: <mailto:linux-lvm@sistina.com>
>List-Subscribe: 
><http://lists.sistina.com/mailman/listinfo/linux-lvm>,<mailto:linux-lvm-request@sistina.com?subject=subscribe>
>List-Id: linux-lvm general discussion <linux-lvm.sistina.com>
>List-Unsubscribe: 
><http://lists.sistina.com/mailman/listinfo/linux-lvm>,<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
>List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
>
>On Sun, Jul 08, 2001 at 01:34:23PM +0200, Pascal Heger wrote:
> > Hi,
> >
> > I'm new to LVM, and desperate to get it working on a 3 disk linux box.
> > I'm running Kernel version 2.4.6, and installed the binary 'RedHat' 
>version
> > 8.1 of LVM.
> > I have compiled the kernel with LVM as a module, and everything seems to
> > work fine at bootup (/proc/lvm is there).
> > The module is loaded at bootup, and i put the vgscan and vgchange 
>scripts in
> > rc.sysinit.
> >
> > I have changed the partition type of hdb, and hdc to 0x8e. But when i 
>try to
> > run pvcreate /dev/hdb1 i get:
> >
> > pvcreate - - ERROR: "/etc/lvmtab" doesn't exist; please run vgscan.
> >
> > And when i run vgscan:
> >
> > vgscan - - invalid i/o protocol version
> >
> > What did i do wrong? Did i install the wrong version of LVM?
> > Any help will be greatly appreciated.
>
>You don't have the driver in your kernel.
>
>Check in your kernel configuration if LVM is activated.
>
>In case you've got the driver as a module, you need to load it manually or
>preferably have it loaded by kmod. Maybe your modules.conf doesn't cover
>the LVM module load?
>
>
> >
> > Pascal.
> > 
>_________________________________________________________________________
> > Get Your Private, Free E-mail from MSN Hotmail at 
>http://www.hotmail.com.
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>--
>
>Regards,
>Heinz    -- The LVM Guy --
>
>*** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>Heinz Mauelshagen                                 Sistina Software Inc.
>Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
>Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

_________________________________________________________________________
Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.
