Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3AE6BA27.1FC18A3C@in.tum.de>
Date: Wed, 25 Apr 2001 13:51:03 +0200
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
References: <200104022100.f32L0jL13101@webber.adilger.int> <01040307345000.00915@darkvader>
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

Oh yes, this procedure has helped me too! I had the same problem and now I can
use my VG  with no single byte being lost. But from now on I'll start making
backups of my data... :) Thanks!

> > OK, I have figured out why vgcfgrestore doesn't work properly with broken
> > UUIDs.  It is because vgcfgrestore only restores the backup VGDA data to
> > each disk separately.  This means it is not possible to have consistent
> > UUIDs generated for all PVs in a VG when vgcfgrestore is run.
> >
> > You can try the following (experimental) procedure to fix the UUIDs:
> >
> > Check each PV with "pvdata -PP /dev/hdX" to ensure it has a valid
> > UUID assigned.  Also get the PV numbers (starting with 1) for each of
> > the PVs.  Finally, check the pv_uuidlist_on_disk.base for each PV.
> > It will normally be 6144, but it does not have to be.
> >
> > for each PV (in PV# order)
> >     dd if=/dev/hdX bs=1 skip=44 count=128 >> /tmp/uuids
> >
> > This should create a file /tmp/uuids which has all of the PV UUIDs in it.
> > Make sure there are as many UUIDs in the file ("od -a /tmp/uuids" is good)
> > as you have PVs (8 in your case).
> >
> > Now, we want to write the UUID list back to the PVs so vgscan is happy:
> >
> > for each PV (in any order)
> >     dd if=/tmp/uuids of=/dev/hdX bs=1 seek=<pv_uuidlist_on_disk.base for
> > hdX>
>
> Unfortunately this doesn't work. I get on of=/dev/hda2 an invalid argument.
> Can you write to a partition with dd ? Or has it to be a disk such as
> /dev/hda ?
>
> >
> > example:
> >     dd if=/tmp/uuids of=/dev/hda2 bs=1 seek=6144
> >
> > Now vgscan should be able to detect all of the disks and work properly.
> >
> > Cheers, Andreas
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod@in.tum.de)
 http://dvr.ismad.com
 "Ein Computer ohne Windows ist wie ein Fisch ohne Fahrrad."
