Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EF18AF987
	for <linux-lvm@redhat.com>; Thu,  2 Jan 2020 18:20:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBADB8023BD
	for <linux-lvm@redhat.com>; Thu,  2 Jan 2020 18:20:04 +0000 (UTC)
Received: from postpony.nebelschwaden.de (v22018114346177759.hotsrv.de
	[194.55.14.20]) (Authenticated sender: postmaster@nebelschwaden.de)
	by mail.worldserver.net (Postfix) with ESMTPA id D11BE3001F6
	for <linux-lvm@redhat.com>; Thu,  2 Jan 2020 19:19:53 +0100 (CET)
Received: from kaperfahrt.nebelschwaden.de (kaperfahrt.nebelschwaden.de
	[172.16.37.5])
	by postpony.nebelschwaden.de (Postfix) with ESMTP id 7CC11D204E
	for <linux-lvm@redhat.com>; Thu,  2 Jan 2020 19:19:53 +0100 (CET)
Date: Thu, 2 Jan 2020 19:19:52 +0100
From: Ede Wolf <listac@nebelschwaden.de>
Message-ID: <20200102191952.1a2c44a7@kaperfahrt.nebelschwaden.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] thinpool metadata got way too large, how to handle?
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
To: linux-lvm@redhat.com

Hello,

While having tried to extend my thinpool LV, after the underlying md
raid had been enlarged, somehow the metadata LV has gotten all the
free space and now is 2,2 TB in size. Space, that is obviously now
missing for the thinpool data LV, where it should have gone in first
place.

And since reducing the metadata LV of the thinpool is not possible, I
am now wondering, what options I may have to reclaim the space for its
intended purpose?

# lvs -a
LV                    VG       Attr       LSize   Pool          Origin
Data%  Meta%  Move Log Cpy%Sync Convert ThinPoolRaid6         VG_Raid6
twi-aotz--   5,97t                      40,27  0,22

[ThinPoolRaid6_tdata] VG_Raid6 Twi-ao----   5,97t 

[ThinPoolRaid6_tmeta]
VG_Raid6 ewi-ao----  <2,21t 

[lvol0_pmspare]       VG_Raid6 ewi-------
72,00m

This is despite not even being sure on how to calculate the proper size
for the metadata. 0,22% indicated metadata use of currently 6TB
thinpool would equal roughly 12GB, but the RAID is supposed to grow up
to ~25TB and is yet not even filled up half way. So plan it times 10 =
120GB? 24TB/6TB * 2.5 [=100%/40%]? Does that sound reasonable?

The lvthin man page recommends moving the metadata to a dedicated PV,
and eventually I would like to do so, but it does not explain how to
move the existing metadata, just how to create the metadata LV for a new
thinpool. 
But my thinpool is already existing. Anyway, if this migration scenario
is somwhow possible, maybe this could be done here as well, albeit for
now even only on the same PV?
Just migrate the metadata to a smaller LV, that then will become the new
metadata LV?

Or should I rather try to repair and thus get get the metadata moved to
the pmspare? That in turn probably needs to grow significantly before.
But if this should be possible and the spare becomes the new main
metadata LV, how go I get a new spare, since explicit creation is not
possible? 
But more importantly, can I repair a non defect metadata LV
at all in the first place?

Currently I have no extends left - all eaten up by the metadata LV, but
I would be able to add another drive to enlargen the md raid and
therefore the PV/VG

Thanks for any hints on this

Ede
