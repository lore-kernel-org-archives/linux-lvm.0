Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C8F730B84
	for <linux-lvm@redhat.com>; Mon,  7 Sep 2020 16:34:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6179101AA40
	for <linux-lvm@redhat.com>; Mon,  7 Sep 2020 16:34:25 +0000 (UTC)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 7 Sep 2020 18:34:15 +0200
Message-Id: <F484D1CA-73F2-49EE-9EE1-1902F322A591@gmail.com>
References: <a446fda9-d3c5-a184-8466-d63ae39f541c@redhat.com>
In-Reply-To: <a446fda9-d3c5-a184-8466-d63ae39f541c@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

thanks for feedback 

so if I understand this correctly
# fallocate -l 100M /tmp/pv1
# fallocate -l 100M /tmp/pv2
# fallocate -l 100M /tmp/pv3

# losetup —find —show /tmp/pv1
# losetup —find —show /tmp/pv2
# losetup —find —show /tmp/pv3

# vgcreate vg0 /dev/loop0
# lvcreate -n lv0 -l 1 vg0
# vgextend vg0 /dev/loop1
# lvcreate -s -l 1 -n lvsnap /dev/loop1
# vgchange -a n vg0

# lvconvert —splitsnapshot vg0/lvsnap

# vgreduce vg0 /dev/loop1

# vgcreate vg1 /dev/loop2
# lvcreate -n lv0 -l 1 vg1
# vgextend vg1 /dev/loop1 
# lvconvert -s vg1/lvsnap vg1/lv0

not sure if the steps are correct?

regards Tomas

Sent from my iPhone

> On 7 Sep 2020, at 16:17, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> 
> ﻿Dne 07. 09. 20 v 16:14 Dalebjörk, Tomas napsal(a):
>> Hi Mikulas,
>> Thanks for the replies
>> I am confused now with the last message?
>> LVM doesn't support taking existing cow device and attaching it to an existing volume?
>> Isn't that what "lvconvert --splitsnapshot" & "lvconvert -s" is ment to be doing?
>> lets say that I create the snapshot on a different device using these steps:
>> root@src# lvcreate -s -L 10GB -n lvsnap vg/lv /dev/sdh
>> root@src# lvconvert ---splitsnapshot vg/lvsnap
>> root@src# echo "I now move /dev/sdb to another server"
>> root@tgt# lvconvert -s newvg/newlv vg/lvsnap
> 
> Hi
> 
> This is only supported as long as you stay within VG.
> So newlv & lvsnap must be in a single VG.
> 
> Note - you can 'vgreduce' PV from VG1 and vgextend to VG2.
> But it always work on whole PV base - you can't mix
> LV between VGs.
> 
> Zdenek
> 
