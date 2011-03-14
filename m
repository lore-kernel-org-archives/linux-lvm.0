Date: Mon, 14 Mar 2011 16:00:57 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110314200057.GB18904@redhat.com>
References: <4D7E4689.9060300@cox.net> <20110314171726.GA18249@redhat.com>
	<4D7E68F6.5040700@cox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4D7E68F6.5040700@cox.net>
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Karel Zak <kzak@redhat.com>

On Mon, Mar 14 2011 at  3:13pm -0400,
Ron Johnson <ron.l.johnson@cox.net> wrote:

> On 03/14/2011 12:17 PM, Mike Snitzer wrote:
> >On Mon, Mar 14 2011 at 12:47pm -0400,
> >Ron Johnson<ron.l.johnson@cox.net>  wrote:
> >
> >>Hi,
> >>
> >>Is there any concern with mixing 4KB-sector drives with 512-byte
> >>sector drives in the same LV?
> >
> >Both LVM2 and Device Mapper have been updated to accommodate stacking
> >such a mix of drives.
> >
> >See this for a bit more detail:
> >http://people.redhat.com/msnitzer/docs/io-limits.txt
> >
> >Particularly, the "Stacking I/O Limits" section.
> >
> >The concern raised for partial (4k) writes to the 512b drive was
> >discussed a bit more here: http://lkml.org/lkml/2010/2/22/295
> >
> 
> Does this mean that util-linux v2.17.1 fdisk correctly handle AF
> disks?  (Note that I will *not* be booting off an AF device.)
> 
> ftp://ftp.kernel.org/pub/linux/utils/util-linux/v2.17/v2.17.1-ReleaseNotes
> 
> fdisk:
>    - cleanup alignment, default to 1MiB offset  [Karel Zak]
>    - don't check alignment_offset against geometry  [Karel Zak]
>    - fallback for topology values  [Karel Zak]
>    - fix ALIGN_UP  [Karel Zak]
>    - fix check_alignment()  [Karel Zak]
>    - fix default first sector  [Karel Zak]
>    - use "optimal I/O size" in warnings  [Karel Zak]
>    - use 1MiB offset and grain always when possible  [Karel Zak]
>    - use more elegant way to count and check alignment  [Karel Zak]
>    - use optimal_io_size  [Karel Zak]

Given that changelog, yes.

(cc'ing kzak for the authoritative answer ;)
