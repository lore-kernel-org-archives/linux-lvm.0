Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Wed, 6 Dec 2000 14:20:48 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] WebMin LVM module development
Message-ID: <20001206142048.G12090@srv.t-online.de>
References: <3A2E0A5B.2EB3CCEB@elinux.com.sg>
Mime-Version: 1.0
In-Reply-To: <3A2E0A5B.2EB3CCEB@elinux.com.sg>; from michael@elinux.com.sg on Wed, Dec 06, 2000 at 05:43:55PM +0800
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
Cc: mge@sistina.com

On Wed, Dec 06, 2000 at 05:43:55PM +0800, Michael Boman wrote:
> Hi,
> 
> for the past week I've been working on a WebMin (http://www.webmin.com)
> module for LVM.
> 
> I have a few questions I need to get answered as well as I seek people
> that is willing to try the LVM module out.
> 
> My questions are:
> - How can I check what PV's are availble to use with a VG. I know the
> pvscan command, but it takes quite a long while to complete and I wonder
> if there is any shortcuts to find what PV's that is free to use with a
> VG.

No. pvscan's purpose is to do that.
You probably saw the "-n" option to search for free PVs?

> 
> - I have problem using MD as a PV of my VG, any hints what it can be?
> <output>
> mike:/mnt# vgextend vg_test /dev/md0
> vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgextend -- ERROR: no physical volumes usable to extend volume group
> "vg_test"
> </output>

That's a bug which in 0.9.
There's a fix in 0.8.1 which probaly didn't make it.
0.9.1 should fix this again.

> 
> Seeking bug-hunters and feedback:
>  I'd like to offer the oppertunity for you guy's (and gal's) that are
> living on the edge to try out my WebMin LVM module. It's not fully
> operational yet (Can only display VG's and assosiated info as well as
> create VG's), but I am hoping that a early beta release will provide me
> with enuff feedback to make this a good and useful module to WebMin.
> 
> The code is under GNU GPL License version 2 or later, and currently
> given out on a per-request basis. I nor the company I work for offers no
> garranty that it wont eat your data etc.. #include <std/disclaimer.txt>
> as per usual.
> 
> Jargon file for the uninformed:
> MD = Multiple Devices, software raid.
> PV = Physical Volume
> PE = Physical Extent
> LV = Logical Volume
> VG = Volume Group
> 
> Best regards
>  Michael Boman
> 
> PS
>  Sorry for cross-posting here, but I wanted to make sure all relivant
> parties got informed.
> DS
> 
> -- 
> "eLINUX  ---  Enabling the Net Economy on Linux"
> ----------------------------------------------------------
> Michael Boman                   eLinux Pte Ltd
> Technical Consultant            http://www.elinux.com.sg
> michael@elinux.com.sg           Tel:    (65)  227 6180
>                                 Fax:    (65)  227 5808
> ----------------------------------------------------------
Content-Description: Card for Michael Boman


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
