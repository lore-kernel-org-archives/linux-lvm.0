Message-ID: <3873A8BF.196353CE@msede.com>
Date: Wed, 05 Jan 2000 21:25:35 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: Stephan.Mueller@suse.de
MIME-Version: 1.0
Subject: Re: [linux-lvm] [3 Questions... (fwd) (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message

-------- Original Message --------
From: Stephan Mueller <Stephan.Mueller@suse.de>
Organization: SuSE Muenchen GmbH
Subject: Re: [linux-lvm] [3 Questions... (fwd)
Date: Tue, 4 Jan 2000 07:53:01 +0100

Am Die, 04 Jan 2000 schrieben Sie:
> -------- Original Message --------
> Subject: 3 Questions...
> Date: Tue, 4 Jan 2000 00:44:36 +0000 (GMT)
> From: James Pattinson <jamesp@emporia.u-net.com>
> X-Sender: jamesp@greebo.jj.net
> To: linux-lvm@msede.com
> Message-ID: <Pine.LNX.4.10.10001040025340.1128-100000@greebo.jj.net>
> 
> Hi,
> 
> I have a few questions... well... I keep thinking of more :)
> 
> 1. Raid / LVM
> 
> Does anyone have a patch against 2.2.13 that contains both the LVM
> patch
> and the super-raid patch (the one that uses MMX)? I want to get max
> performance by having a striped /dev/md0 as my PV. 

Why are you doing this?? Just use each physical harddisk as a PV. And
after this you can combine several PVs within one VG (yes, it is
simmilar
to a stripped softraid). AFAIK you will have a performace drop when
you use a
LVM on top of a (softraid-) stripped device.

Cheers
Stephan
