Return-Path: <riel@conectiva.com.br>
Date: Tue, 6 Feb 2001 19:04:37 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot.
In-Reply-To: <20010206143902.C5041@sistina.com>
Message-ID: <Pine.LNX.4.21.0102061856030.1535-100000@duckman.distro.conectiva>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 6 Feb 2001, AJ Lewis wrote:

> > It's still vg_read_with_pv_and_le() that's spitting out
> > errors and causing vgscan to segfault. The error I am
> > seeing here hasn't changed in the last month...
> 
> Hmm...This appears to be different from the bug posted with the
> subject "0.9.1 vgscan doesn't detect upgraded vg's" today.  Can
> you confirm this?

I'm not sure if it's related or not ...

> Have you been able to get to your data since you first posted
> the bug report?  What steps did you take to get to this point?

I am able to use my data with 0.8final on Conectiva's kernel RPM.

Basically, I have 3 PVs in my VG:

PV1: /dev/hdd1   (full)
PV2: /dev/hdb1   (almost full)
PV3: /dev/hda5   (still empty)

Whenever I run vgscan, it will encounter the (empty) hda5
first and somehow gets confused.

Removing /dev/hda5 from my VG meant I could use 2.4.0 and
normally access my data. Doing a pvextend /dev/hda5 gave
a kernel oops. This removing had to be done with 0.8final
since 0.9+tools were confused.

In 2.4.1, I did a pvextend vg0 /dev/hda5 and everything
seemed to work fine. Didn't get around to grow a filesystem
into the last PV.

When I came back after a power failure, I found my system
in a rather bad state. Now I am unable to remove /dev/hda5
from me VG or grow a LV into that VG ... all tools seem
confused. Luckily I can still access the data using 0.8.

The fact that 0.8 and 0.9 fail in different ways, however,
seems to suggest that there's nothing but simple implementation
bugs keeping me from using my system with 2.4 again and testing
if my latest VM changes really help ;)

> What I'm wondering is this:  did your attempt to use the LVM
> tools with the broken kernel patch in 2.4.0 mess up the on-disk
> format,

I don't think this is the case since the 0.8final tools
(and kernel driver) didn't complain after my 2.4.0 tests.
However, after my 2.4.1 tests I'm no longer completely sure.

> or is this a continued problem that can be reproduced
> with new VGs created with 0.9.1_beta3 or converted with the
> latest tools from 0.8final or 0.8.1?

I haven't created any VGs with the new tools, this thing
comes straight from 0.8final (+fixed tools, close to 0.8.1).

regards,

Rik
--
Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml

Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
