Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3B0124D2.B39973E7@in.tum.de>
Date: Tue, 15 May 2001 14:45:06 +0200
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Lost filesystems on LVs
References: <B45465FD9C23D21193E90000F8D0F3DF683CB1@mailsrv.linkvest.com>
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

Jean-Eric Cuendet wrote:

> Hi,
> I have a BIG problem. I have an LVM VG of 160Gb. There is 3 LVs defined:
> - MS
> - Distrib
> - backups

I assume that all LVs use the ext2 fs...

>
> This morning, I made a e2fsadm to reduce the MS volume and grow the backup
> one.
> I umounted the MS volume, made the e2fsadm. All was OK, no error.
> I then umounted the backups LV and made the e2fsadm. e2fsck refused to work
> saying that there was no filesystem on it! All was OK, until I umount it!
> And now, I'm sticked with the backups LV with no filesystem (it was OK until
> this night, all backups were OK) and the MS LV with things that I don't
> understand (files that shouldn't be here...)
>
> Any idea? Help?
>

Can you deactivate everything (LVs and VG), delete the /dev/<your_vg_nme> and
do a vgscan? I think that LVM has got confused with the special devices' major
and minor numbers, and that would be why you see things where they wouldn't be
expected to be. But I'm (almost) sure that not all of your LVs are using the
same fs, do they?

--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod <at> in DOT tum DOT de)
