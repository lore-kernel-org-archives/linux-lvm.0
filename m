Return-Path: <mauelshagen@sistina.com>
Date: Wed, 25 Jul 2001 11:01:50 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] different outputs in LVM tools (bug?)
Message-ID: <20010725110150.B24685@sistina.com>
References: <3B5E7271.887177CC@atix.de>
Mime-Version: 1.0
In-Reply-To: <3B5E7271.887177CC@atix.de>; from julien@atix.de on Wed, Jul 25, 2001 at 09:17:05AM +0200
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

On Wed, Jul 25, 2001 at 09:17:05AM +0200, Julien Baboud wrote:
> hi,
> 
>  I'm using the 0.9.1 beta 7 version, and I have encountered a problem
> (but perhaps it is not) with the LVM tools :
>  when I use the 'vgdisplay' command I obtain this :
> 
> --- Volume group ---
> VG Name               vg1
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                4
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                2
> Act PV                2
> VG Size               1000 MB
> PE Size               4 MB
> Total PE              250
> Alloc PE / Size       100 / 400 MB
> Free  PE / Size       150 / 600 MB
> VG UUID               qnJMzM-yuCq-N59y-cTey-kayU-9Wo3-hGILhU
> 
> 
> and with the 'vgdisplay -c' command, the output is :
> 
> vg1:3:5:0:256:4:0:268427264:256:2:2:1024000:8192:250:100:150:qnJMzM-yuCq-N59y-cTey-kayU-9Wo3-hGILhU
>                                             ----
> 
> The difference is in the 'PE Size' field : in the first we have 4 MB and
> in the second 8192 (ie : 8 MB)
> Is this a known bug or is there any explanation ?

Julien,

internally LVM uses units of 512 byte -> 8192 * 512 byte == 4 MB.

> 
> 
> Julien,
> 4 Atix
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
