Message-Id: <4.2.1.9.19991003080618.00a7b500@mail.msy.bellsouth.net>
Date: Sun, 03 Oct 1999 08:06:22 -0500
From: Daniel Whicker <heimdall@mail.org>
Subject: Re: [linux-lvm] LVM, raw-io, devfs
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

At 02:43 AM 10/3/99 , Harald Milz wrote:
>Drew Smith <drew@winterland.mainland.ab.ca> wrote:
>
> >       IBM's ADSM(*) (well, TSM now, thanks to Tivoli) uses raw logical
> > volumes on a fairly native level as storage pools, etc.  I'm curious,
> > having never looked into raw IO under Linux, whether it's the same
> > principles - and, that said, whether or not IBM will be porting the TSM
> > server to Linux?

   This is a bit off topic, buy hey.  ADSM (TSM) actually gives you the 
option of using either files or raw i/o.  I don't see that there would be 
any problems with a Linux port of the server.  They could simply disable 
the ability to use raw i/o for your disk storage pools, log volumes, and db 
volumes.  What may pose a problem is the amount of disk space required for 
a significant ADSM server.  If you're looking at a half terabyte or more of 
disks, you may run into the limit of Linux major/minor numbers for SCSI 
disks.  (Btw: I'm unclear on whether the devfs patch resolves this?)
									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
