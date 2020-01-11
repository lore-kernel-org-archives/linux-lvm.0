Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A900E2166B2C
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2020 17:58:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB4EA10197E8
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2020 17:58:03 +0000 (UTC)
Received: from postpony.nebelschwaden.de (v22018114346177759.hotsrv.de
	[194.55.14.20]) (Authenticated sender: postmaster@nebelschwaden.de)
	by mail.worldserver.net (Postfix) with ESMTPA id 7B590300288
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2020 18:57:58 +0100 (CET)
Received: from [172.16.37.5] (kaperfahrt.nebelschwaden.de [172.16.37.5])
	by postpony.nebelschwaden.de (Postfix) with ESMTP id 01B08D2351
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2020 18:57:57 +0100 (CET)
From: Ede Wolf <listac@nebelschwaden.de>
Message-ID: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
Date: Sat, 11 Jan 2020 18:57:57 +0100
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] metadata device too small
Reply-To: listac@nebelschwaden.de,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

After having swapped a 2,2T thinpool metadata device for a 16GB one, 
I've run into a transaction id mismatch. So run lconvert --repair on the 
thinvolume - in fact, I've had to run the repair twice, as the 
transaction id error persisted after the first run.

Now ever since I cannot activate the thinpool any more:

[root]# lvchange -ay VG_Raid6/ThinPoolRaid6
   WARNING: Not using lvmetad because a repair command was run.
   Activation of logical volume VG_Raid6/ThinPoolRaid6 is prohibited 
while logical volume VG_Raid6/ThinPoolRaid6_tmeta is active.

So disable them and try again:

[root]# lvchange -an VG_Raid6/ThinPoolRaid6_tdata
   WARNING: Not using lvmetad because a repair command was run.

[root]# lvchange -an VG_Raid6/ThinPoolRaid6_tmeta
   WARNING: Not using lvmetad because a repair command was run.

[root]# lvchange -ay VG_Raid6/ThinPoolRaid6
   WARNING: Not using lvmetad because a repair command was run.
   device-mapper: resume ioctl on  (253:3) failed: Invalid argument
   Unable to resume VG_Raid6-ThinPoolRaid6-tpool (253:3).

And from the journal:

kernel: device-mapper: thin: 253:3: metadata device (4145152 blocks) too 
small: expected 4161600
kernel: device-mapper: table: 253:3: thin-pool: preresume failed, error 
= -22


Despite not using ubuntu, I may have been bitten by this bug(?), as my 
new metadata partion happens to be 16GB:

"If pool meta is 16GB , lvconvert --repair will destroy logical volumes."

https://bugs.launchpad.net/ubuntu/+source/lvm2/+bug/1625201

Is there any way to make the data accessible again?

lvm2 2.02.186
