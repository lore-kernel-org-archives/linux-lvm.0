Message-Id: <5.1.0.14.0.20020105233609.00b13e08@pop.ihug.com.au>
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
Date: Sat Jan  5 10:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

At 02:27 PM 3/01/2002 -0700, Andreas Dilger wrote:
>Well, this seems to become my specialty:
>
><snipped>
>
>- If the PV sizes do not match, you also need to fix pe_on_disk.size, pv_size,
>   pe_total, and pe_start (maybe).  I can tell you how to do this also, but
>   it is complicated so I'd rather not unless needed.
>- At this point, vgscan should be able to detect the whole VG.  If the
>   pe_on_disk.size value (and/or pe_start) is wrong, then you will get
>   misaligned data for your filesystems that have data on that PV, and you
>   have to work out the correct value.

OK, I've done all this. pvdata now displays correct information, and vgscan 
picks
up the volume groups with no problems. My /var, /var/share and /var/chroot 
all seem
to mount fine, but my /usr has inconsistencies, and my /home won't mount due to
a bad XFS magic number. I assume that this is because the pe_on_disk.size is
wrong or something.

The only structure that I had to resurrect was the pv_disk_t, and for most of
this I have simply copied values from the other pv structs, with the exception
of pv_uuid, pv_major, pv_number, pe_allocated and also pv_size (hda6 is 
actually
32KB larger than hda[78] - hda6 is 8,388,576K, hda[78] are both 8,388,544K).
I haven't changed pe_on_disk.size or pe_total. These PV's were created with
the 0.9.1beta6 lvm tools, so from what I can see from the 0.9.1beta6 lvm.h,
pe_start didn't exist at that time ... for all the other PV's on my system 
pv_start
is set to 0, so I assume it should be the same for hda6.

I couldn't work out how to find out the value for lv_cur, as this must be 
the number
of LVs that use the PV, and I couldn't find a way to work this out. I've 
set it to 1 at
the moment, but that might need to be 2 as both my /usr and /home volumes seem
like they are using the hda6 PV. Any further comments appreciated.

Thanks,

Timshel

--
Timshel Knoll <timshel@pobox.com>
Debian GNU/Linux developer, email <timshel@debian.org>
