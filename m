From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Recovering from a disaster...
Message-ID: <98420000.1039364520@[192.168.100.3]>
In-Reply-To: <Pine.LNX.4.44.0212061842370.13951-100000@dragon.inside.ntisys.com>
References: <Pine.LNX.4.44.0212061842370.13951-100000@dragon.inside.ntisys.c
 om>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Sun Dec  8 10:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>   And to fuss a bit more, "the BIOS" is an outdated term.  Most systems do
> not have a single "BIOS" anymore; they have multiple components, each with
> their own "BIOS".  These various "BIOSes" are just firmware; they contain
> what is needed to run the device and bootstrap the OS (plus a ton of
> legacy code leftover from the days of MS-DOS and floppy-only systems).
>
>   Server-class systems built on the x86-compatible "PC" design now have
> many (but not all) of the firmware features previously only found in
> propriatary systems from Sun, SGI, etc.

Among the things they don't have is a sane boot command prompt
that allows cleaning up the system by bypassing LVM on startup
(e.g., "boot -lm /dev/blah" on HP PARISC systems). And, yes,
this is true of Wintel-look-alike systems also, AMD has not
done any better job of leaving you with a command line at boot
to handle nasty situations.

Net result is that if LVM gets zapped you have no way to access
the root volume without it if your root volume is in LVM if you
have a Wintel motherboard or a clone or a lookalike or a nearly
similarly functional item of the general motherboard type (think
that covers all of it).

At least if your root volume (80MB of generally non-changing
space) is on a partition then you can boot it if LVM -- or
software RAID -- has problems and fix it using native tools
on the root voulme. Obviously, if you install your LVM or
RAID application and supporting files into /usr or /opt then
having the root volume online won't help much -- you can always
shoot yourself in the foot at some point. But with the simple
step of having recovery files on the root volume, booting single
user is usually sufficient to fix or recover things.

In theory people will have rescue CD's or floppys with the
current versions of everything on them that they can use to
recover it all; and printouts of the volume group configs;
and drive slowly enough that we don't have speed-related
accidents. Right. So, given the number of people who do get
zapped by this, the simple expedient of keeping the root
volume on a simple partition seems like a really easy fix...

>> Someday we'll even see PC-class machines without a BIOS.
>
>   Perhaps I misunderstand, but how does one boot without a BIOS?

Hardwire the behavior to the level that even a ROM-ed BIOS
cannot modify it. Cheaper than dealing with copyrighted
code and leaves the machines even more braindead at boot.
You can do it with a MUX and a timer: iterate the bus wires
kicking them with a "boot me" sequence until something responds.
No configuration required: everything directly addressable
via the MOBO's bus will get kicked in turn; first one wins.
You won't be able to boot off of external cards since the
wires don't run there but the board mfr's are into cheap not
effective.



--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
