Message-Id: <5.1.0.14.0.20020106044723.00b14150@pop.ihug.com.au>
From: Timshel Knoll <timshel@pobox.com>
Subject: Re: [linux-lvm] Fixing corrupted LVM PV headers?
In-Reply-To: <20020103142740.A12868@lynx.no>
References: <3C352FFF.1946.1910201@localhost>
    <3C352FFF.1946.1910201@localhost>
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
Date: Sat Jan  5 11:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

At 02:27 PM 3/01/2002 -0700, Andreas Dilger wrote:
><snip>
>
>- If the PV sizes do not match, you also need to fix pe_on_disk.size, pv_size,
>   pe_total, and pe_start (maybe).  I can tell you how to do this also, but
>   it is complicated so I'd rather not unless needed.
>- At this point, vgscan should be able to detect the whole VG.  If the
>   pe_on_disk.size value (and/or pe_start) is wrong, then you will get
>   misaligned data for your filesystems that have data on that PV, and you
>   have to work out the correct value.

Don't worry about my last email, I have got this working now YAY!  :-) 
(apologies
for the caps - I'm just getting a little carried away here). Thanks very much
for your help. I traced through the code in tools/lib/pv_setup_for_create.c and
tools/lib/vg_setup_for_create.c in the old 0.9.1beta6 LVM distribution, and 
from
the code in vg_setup_for_create I worked out that the pe_on_disk.size value was
the offending value - the other two similar PVs had a value of 0x3d1e00, but it
should have been 0x3d9c00 for hda6. So /usr and /home both mount properly now.
I still don't know what lv_cur should be - probably just 2? Oh well, not to 
worry now,
I should get some sleep - only got 3 hours before I have to get up :-(

Thanks for all the help,

Timshel


--
Timshel Knoll <timshel@pobox.com>
Debian GNU/Linux developer, email <timshel@debian.org>
