Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oATB1G8E001881
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 06:01:16 -0500
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oATB1CmF024268
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 06:01:12 -0500
Received: by wyb28 with SMTP id 28so4416643wyb.33
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 03:01:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2D.98.07087.690A2FC4@cdptpa-omtalb.mail.rr.com>
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
	<2D.98.07087.690A2FC4@cdptpa-omtalb.mail.rr.com>
Date: Mon, 29 Nov 2010 18:01:11 +0700
Message-ID: <AANLkTinUmZoqSWNZ7NK+tg5DTpc5JFbbPPZV6YONq+ox@mail.gmail.com>
From: hansbkk@gmail.com
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM over RAID,
	or plain disks? A:"Yes" = best of both worlds?
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
To: Leslie Rhorer <lrhorer@satx.rr.com>
Cc: linux-raid@vger.kernel.org, linux-lvm@redhat.com

On Mon, Nov 29, 2010 at 1:34 AM, Leslie Rhorer <lrhorer@satx.rr.com> wrote:
>> - I am not at this point overly concerned about performance issues -
>> reliability/redundancy and ease of recovery are my main priorities.
>
> � � � �In that case, I'm not sure about your desire for the additional
> complexity. �Someone else suggested RAID6, which from an operational
> standpoint is much simpler. �The main reason, it seems to me, for the more
> complex topologies would be enhancing perfromance.

I can see how RAID6 is simpler than RAID10, but compared to RAID1?

>> The mirroring at the top level would be set up between the individual
>> LVs on the TopRAID1 side and regular filesystem partitions (no RAID or
>> LVM) on the TopRAID2 side. In the event of a massive host failure, the
>> filesystems on the TopRAID2 side could be easily mounted for data
>> recovery and/or service resumption on another machine, and the
>> TopRAID1 disk set rebuilt from scratch and then re-mirrored from the
>> TopRAID2 disks.
>
> � � � �This will certainly work. �Let me ask you this: �What advantage do
> you seek from using LVM on side 1? �Growth? �Re-sizing?

It's a filer, servicing an ever-changing mix of dozens of clients
(from a storage POV, both clients and servers), possibly using iSCSI,
definitely samba and nfs. Creating new shares and/or iSCSI targets or
re-configuring existing ones can't interfere with the operations of
the other hosts. I can't see doing this without LVM myself. I'm likely
to implement this with Openfiler, and in fact I believe it's
install/configuration routines force the use of LVM for exactly this
reason.

>> One design goal would be to not allow any LV to get so large that it
>> won't fit on a single physical disk on the TopRAID2 side. If this is
>> not possible, then the corresponding TopRAID2 side would need to
>> comprise a multiple disk set, perhaps striped by RAID0 - not as
>> straightforward to recover as single disks, but at least without the
>> LVM layer.
>
> � � � �To my mind, a solution which assumes the data payload will not
> exceed a certain physical size is poorly considered unless the server hosts
> only a very specific application whose data extents are specifically limited
> by the application itself. �The beauty, as it were, of LVM is that it can
> easily accommodate changing space needs within a pool of available storage
> space. �If there are strict limits on the payload size, then I'm not certain
> how LVM would offer advantages, especially if you are disallowing striping
> the volumes.

Sorry I wasn't more clear. I'm using LVM on the TopRAID1 side for
exactly this reason. The TopRAID2 side is simply to enable cloning a
given LV to a straightforward partition for easy disaster recovery.

If and when a given LV needs to be resized, I would break the RAID1 to
the TopRAID2 beforehand and manually prepare an appropriate new
"static" target on the TopRAID1 side and then re-mirror.

> � � � �What you are proposing can certainly be done, but it sounds awfully
> frail, to me. �I think a better solution would be to be a RAID1 mirror of
> every volume - each volume being a RAID or LVM of some number of disks, with
> no disk being host to more than one volume on either side. �Then, rather
> than failing an element, you can fail the entire volume set, stop the volume
> and take all the disks offline at once. �Not only that, but if I were you, I
> would make it a 3 volume mirror, keeping at least 2 volumes online at one
> time. �Given your need to rotate the entire volume set, I don't believe
> RAID10 will be ideal for what you want, but if not a relatively simple
> matrix of RAID0 and RAID1 should work. �I'm not all that familiar with
> RAID10, though, so one of the more expert members of the list may want to
> chime in.

> � � � �It sounds practical to me in terms of setting it up, but not in
> terms of being reliable, given the way you intend to use it.

Yes, I see that I shouldn't rely on the TopRAID2 side for reliability,
and now plan to make the TopRAID1 side reliable in and of itself, and
of course am also taking frequent backups.

This now allows me to consider the TopRAID2 side as "expendable" only
for the purpose of cloning a given LV to a straightforward partition,
and I can test and experiment as I like.

It would certainly be more conventional to just use a partition
cloning tool like Acronis or BESR to make a copy of an LVM snapshot
into a file; I was hoping I could use mdm instead to allow me to take
normal partitions offsite ready to mount, rather than filesystems
needing a restore procedure.
