Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 4 Apr 2001 09:06:16 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] problem with vgcreate ...
Message-ID: <20010404090616.A537@tykepenguin.com>
References: <3ACAD385.9FE9BF6C@gazeta.pl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ACAD385.9FE9BF6C@gazeta.pl>; from darwin@agora.pl on Wed, Apr 04, 2001 at 09:55:49AM +0200
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

On Wed, Apr 04, 2001 at 09:55:49AM +0200, Artur Wiak wrote:
> Hi !
> 
> I have problem with LVM beta6.
> I have RedHat 7.0 with 2.4.2 kernel (compilation with
> util-linux 2.10o, modutlis 2.4.2 & e2fsprogs 1.19).
> After compilation all is OK.
> I'm installing LVM (first- .configure - OK,
> second- compilation with LVM as module - OK,
> third- make - OK, fourth- make install - OK).
> but when i started module and i want create lvm group
> (vgcreate lvmgrp /dev/sd?? /dev/sd??) I obtain:
> lvm -- lvm_chr_ioctl: unknown command 4004fe0a
> vgcreate -- ERROR "Invalid argument" creating VGDA for volume group
> "lvmgrp" in kernel.
> I don't known what i do bad (maybe any patch)?
> (With beta4 end beta5 this error recurs too.)
> Help me please.

You'll need to patch your kernel too to get beta6, it sounds like
you have just upgraded the tools.

patrick
