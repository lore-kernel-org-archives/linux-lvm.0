Return-Path: <lembark@wrkhors.com>
Message-ID: <3B1CC8D5.9F227A36@wrkhors.com>
Date: Tue, 05 Jun 2001 06:56:05 -0500
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
References: <20010604190123.C2560@pc.ilinx>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

> > Just curious, /boot only needs to be like 100 megs tops why would you want
> > that to be an LV. Isn't it more trouble than it's worth?
> 
> If nothing else, how about "on principle"?  :-)  Seriously though, I
> want to abandon screwing around with MS-DOS partitions and use LVs
> instead.  They just make so much better sense than partitions.

It is seriously less hassle to have the root volume (with /boot
on it) as a simple file system.  Main point is that any error
in LVM will prevent you from booting to the point where you can
come up far enough to clean up the LVM system.  "Doable" and 
"make sense" aren't necessarly the same thing.  If you want to
use LVM for nearly everything create a 128MB root, 64MB swap and
few-hundred MB /var and use the 4th partition as pv00.  This 
will usually get you far enough up to fix anything that gets 
broken.  Until the PC BIOS mfr's include a sane boot system w/
console prompt that allows you to boot w/o LVM for damaged system
this will be much safer.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
