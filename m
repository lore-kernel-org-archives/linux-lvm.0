Message-ID: <876CAF46D28ED2118D8100A0C9F2BB24248C6C@SEABDC01>
From: "Gerrish, Robert" <Robert.Gerrish@trimsystems.com>
Subject: RE: [linux-lvm] unresolved symbols.
Date: Tue, 5 Oct 1999 14:14:43 -0400 
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'theodore russell wickell' <twickell@indiana.edu>, linux-lvm@msede.com

It looks like you need to compile the modules and install them.  
I had this problem with RAID, forgot to install the modules after
I told the kernel via .config to load RAID1 as a modules.  You are
trying to load lvm.o from your 2.2.5-15 modules.

Bob

> -----Original Message-----
> From:	theodore russell wickell [SMTP:twickell@indiana.edu]
> Sent:	Friday, October 01, 1999 11:20 AM
> To:	linux-lvm@msede.com
> Subject:	[linux-lvm] unresolved symbols.
> 
> Hi,
> 
> I compiled the 2.2.12 kernel with the lvm as a module using the
> patch-2.2.11-LVM.gz patch with no problem.
> When I boot I find though it can not load the lvm module because of the
> following unresolved dependencies:
> 
> Oct  1 11:42:32 persephone insmod: /lib/modules/2.2.5-15/block/lvm.o:
> unresolved
>  symbol del_mddev_mapping
> Oct  1 11:42:32 persephone insmod: /lib/modules/2.2.5-15/block/lvm.o:
> unresolved
>  symbol md_hd_struct
> Oct  1 11:42:32 persephone insmod: /lib/modules/2.2.5-15/block/lvm.o:
> unresolved
>  symbol add_mddev_mapping
> 
> 
> Has anyone seen this? Am I forgetting some other option?
> 
> Thanks,
> Rusty
> 
> --------------------------------------------------------------------------
> --
> Rusty Wickell					200 S. Jordan Ave.
> Digital Library Sytem Administrator		Simon 060
> Indiana University				Bloomington IN 
> 812-856-5174					47405
> --------------------------------------------------------------------------
> --
> 
