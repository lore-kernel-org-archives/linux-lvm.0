Date: Mon, 20 Nov 2000 14:03:46 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Any known problems with ReiserFS and LVM?
Message-ID: <20001120140346.D29032@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <3A18E859.5BB343B8@elinux.com.sg>
Mime-Version: 1.0
In-Reply-To: <3A18E859.5BB343B8@elinux.com.sg>; from michael@elinux.com.sg on Mon, Nov 20, 2000 at 05:01:13PM +0800
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Boman <michael@elinux.com.sg>
Cc: linux-lvm@msede.com


Hi Michael.

On Mon, Nov 20, 2000 at 05:01:13PM +0800, Michael Boman wrote:
> Is there any known problems with ReiserFS and LVM, or doesn't LVM care
> at all about what filesystem it's using? If so, will it work with RAW
> devices as well?

As Patrick Boutilier pointed out ReiserFS works fine with LVM.
Basically LVM is transparent to any Filesystem/Database System etc.

ReiserFS needs special support to work on LVM snapshots though.
Chris Mason and I created a VFS extensions which even allows ReiserFS
to be mounted on LVM snapshot logical volumes.
Hopefully this patch will make it into 2.4.0.
BTW: it will be included in LVM 0.9.
It is (not yet) available for 2.2 though.

Talking about RAW device support, Stephen Tweedies raw device patch 
allows you to bind a character device to _any_ block devices
(including LVM) to provide genuine Unix raw character device semantics.

2.4.0-textX contains it.

There's a raw device support patch for 2.2.17 available at
ftp://ftp.kernel.org:/pub/linux/kernel/people/sct/raw-io/

> 
> Please advice
>  Michael Boman
> 
> -- 
> "eLINUX  ---  Enabling the Net Economy on Linux"
> ----------------------------------------------------------
> Michael Boman                   eLinux Pte Ltd
> Technical Consultant            http://www.elinux.com.sg
> michael@elinux.com.sg           Tel:    (65)  227 6180
>                                 Fax:    (65)  227 5808
> ----------------------------------------------------------

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
