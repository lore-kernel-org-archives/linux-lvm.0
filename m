Date: Mon, 24 Aug 2020 10:33:25 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200824153325.GB4771@redhat.com>
References: <CALOnQv5via9sF2FP81uGXe+CzLqX0it7T0NvRSVxV8TBbhUuvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALOnQv5via9sF2FP81uGXe+CzLqX0it7T0NvRSVxV8TBbhUuvg@mail.gmail.com>
Subject: Re: [linux-lvm] What to do about new lvm messages
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
To: L A Walsh <lvm@tlinx.org>
Cc: linux-lvm@redhat.com

On Sat, Aug 22, 2020 at 04:36:27AM -0700, L A Walsh wrote:
> pvcreate  -M2 --pvmetadatacopies 2 /dev/sda1
>   Failed to clear hint file.
> So why am I getting a message about not clearing a hint file (running s root)

I'm guessing that no commands have permission to use /run/lvm/hints, so
they just skip it.  But, this is one place printing a warning about it.
I'll remove the warning.  Run 'pvs', and check if /run/lvm/hints exists.
If not, you might want to look at permission issues.

> and how do I modify a VG that I don't want to make any modifications to?

To fix that header you can run 'vgck --updatemetadata Backup'.

> From an online man page, I should have been able to use -ff to recreate
> a pv over the top of a preexisting one, but that didn't seem to work.  I
> got:
>  pvcreate -ff -M2 --pvmetadatacopies 2 /dev/sda1
>   Failed to clear hint file.
>   WARNING: PV /dev/sdd1 in VG Backup is using an old PV header, modify
> the VG to update.
>   Cannot access VG Space with system ID Ishtar with unknown local system ID.
>   Device /dev/sda1 excluded by a filter.

You're not using system ID correctly.

> I also ran into a problem on how to tell vgcreate to use the whole pv.
> That was complicated by trying to specify my hostname as a system id:

>   Cannot access VG Space with system ID Ishtar with unknown local system ID.

The machine needs to have a system ID configured.  See lvmsysystemid(7)
and edit lvm.conf/lvmlocal.conf.  Then vgcreate will use the machine's
system for the new VG.  Using --systemid overrides the local value which
you don't want.
