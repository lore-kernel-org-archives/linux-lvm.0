Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFB2819C68
	for <linux-lvm@redhat.com>; Thu, 25 Jul 2019 01:32:59 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 481CB300CA4E
	for <linux-lvm@redhat.com>; Thu, 25 Jul 2019 01:32:58 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id h10so46365299ljg.0
	for <linux-lvm@redhat.com>; Wed, 24 Jul 2019 18:32:58 -0700 (PDT)
MIME-Version: 1.0
From: Max Ehrlich <max.ehr@gmail.com>
Date: Wed, 24 Jul 2019 21:32:20 -0400
Message-ID: <CAPyx93yut280i-EnOmdbYmxqu0tuxBgbyzkDGzbt6jEHPKfVfw@mail.gmail.com>
Subject: [linux-lvm] Recovering Failed LVM Raid-5 Array
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
To: linux-lvm@redhat.com

I originally posted this over at superuser but I thought maybe I would
find more LVM experts here that might know the answer.

I have a failed raid-5 array that I can't seem to recover. Basically
the story is I had this data in raid 5 and I was using LVM which has
built-in raid now. I noticed one of the disks going bad so I got a new
one and issued pvmove to move the extents from the failing disk to the
new disk. Some time during the migration, the old disk failed and
completely stopped responding (not sure why it would cause that). So I
rebooted it and now the array doesn't come up at all. Everything looks
well enough, e.g. 3/4 disks are working, and I'm pretty sure even the
failed one is back up temporarily (don't trust it though). But when I
issue lvchange -a y vg-array/array-data I get a failure with the
following in dmesg

not clean -- starting background reconstruction
device dm-12 operational as raid disk 1
device dm-14 operational as raid disk 2
device dm-16 operational as raid disk 3
cannot start dirty degraded array.

I'm pretty sure there are ways to force the start using mdadm but I
havent seen anything for lvm. But since I have three disks, all my
data is there so it must be recoverable. Does anyone know how to do
it? To summarize, it's a 4 disk raid 5 array, 3/4 disks are working,
but I still am not able to start the logical volume even in degraded
mode to copy the data off of it
