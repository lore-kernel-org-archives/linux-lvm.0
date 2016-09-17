Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8HI2SNP019699
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 14:02:28 -0400
Received: from zimbra13.linbit.com (zimbra13.linbit.com [212.69.166.240])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1C4F4DD76
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 18:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by zimbra13.linbit.com (Postfix) with ESMTP id 1D7A4360E7C
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 20:02:25 +0200 (CEST)
Received: from zimbra13.linbit.com ([127.0.0.1])
	by localhost (zimbra13.linbit.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xmUGxVOOJMPD for <linux-lvm@redhat.com>;
	Sat, 17 Sep 2016 20:02:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra13.linbit.com (Postfix) with ESMTP id F187D360E7F
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 20:02:24 +0200 (CEST)
Received: from zimbra13.linbit.com ([127.0.0.1])
	by localhost (zimbra13.linbit.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uyJM2mV8TJZf for <linux-lvm@redhat.com>;
	Sat, 17 Sep 2016 20:02:24 +0200 (CEST)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra13.linbit.com (Postfix) with ESMTPS id CC770360E7C
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 20:02:24 +0200 (CEST)
Date: Sat, 17 Sep 2016 20:02:24 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20160917180224.GG3302@soda.linbit>
References: <7e54ddf6638609d4e521287b51964ebd@dds.nl>
	<20160917134936.GF3302@soda.linbit>
	<122228b22984be95a8978ee34307176d@dds.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <122228b22984be95a8978ee34307176d@dds.nl>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] creating DD copies of disks
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Sep 17, 2016 at 04:40:36PM +0200, Xen wrote:
> Lars Ellenberg schreef op 17-09-2016 15:49:
> >On Sat, Sep 17, 2016 at 09:29:16AM +0200, Xen wrote:
> >>I want to ask again:
> >>
> >>What is the proper procedure when duplicating a disk with DD?
> >
> >depends on what you define as "proper",
> >what the desired outcome is supposed to look like.
> >
> >What exactly are you trying to do?
> >
> >If you intend to "clone" PVs of some LVM2 VG,
> >and want to be able to activate that on the same system
> >without first deactivating the "original",
> >I suggest:
> >
> >1) create consistent snapshot(s) or clone(s) of all PVs
> >2) import them with "vgimportclone",
> >which is a shell script usually in /sbin/vgimportclone,
> >that will do all the neccessary magic for you,
> >creating new "uuid"s and renaming the vg(s).
> 
> Right so that would mean first duplicating partition tables etc.
> 
> I will check that out some day. At this point it is already done, mostly. I
> didn't yet know you could do that, or what a "clone" would be, so thank you.

No. You check that out *now*.
It does not matter how you create your "duplicates" "clones" "snapshots"
whatever you name them. If you want, use dd. No one really cares.
What matters is that they are consistent.

Then, if you want to attach them, both original and "duplicate",
you need to change uuids of PV and VG, and the VG name.

And vgimportclone is a script that does all necessary steps for you.

So no, you don't have to write scripts,
or figure out the necessary steps.

Someone else did that for you already.
Just use it.

-- 
: Lars Ellenberg
: LINBIT | Keeping the Digital World Running
: DRBD -- Heartbeat -- Corosync -- Pacemaker
: R&D, Integration, Ops, Consulting, Support

DRBD� and LINBIT� are registered trademarks of LINBIT
