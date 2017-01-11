Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E6BD2D5FA
	for <linux-lvm@redhat.com>; Wed, 11 Jan 2017 17:24:04 +0000 (UTC)
Received: from mail.knebb.de (mail.knebb.de [85.25.100.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9061037E64
	for <linux-lvm@redhat.com>; Wed, 11 Jan 2017 17:24:02 +0000 (UTC)
References: <07fb8e78-2050-a2ba-3e71-c21e989d57f3@knebb.de>
	<20170110094258.GB4322@soda.linbit>
From: knebb@knebb.de
Message-ID: <f8301ede-61ac-2dda-8710-4273eaf20796@knebb.de>
Date: Wed, 11 Jan 2017 18:23:08 +0100
MIME-Version: 1.0
In-Reply-To: <20170110094258.GB4322@soda.linbit>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [DRBD-user] LVM on top of DRBD [actually: mkfs.ext4
 then mount results in detach on RHEL 7 on VMWare]
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
To: linux-lvm@redhat.com, drbd-user@lists.linbit.com

Hi Lars and all,


>> I have to cross-post to LVM as well to DRBD mailing list as I have no
>> clue where the issue is- if it's not a bug...
>>
>> I can not get working LVM  on top of drbd- I am getting I/O erros
>> followed by "diskless" state.
> For some reason, (some? not only?) VMWare virtual disks tend to pretend
> to support "write same", even if they fail such requests later.
>
> DRBD treats such failed WRITE-SAME the same way as any other backend
> error, and by default detaches.
Ok, it is beyond my knowledge, but I understand what the "write-same"
command does. But if the underlying physical disk offers the command and
reports an error when used this should apply to mkfs.ext4 on the device/
partition as well, shouldn't it? drbd detacheds when an error is
reported- but why does Linux not report an error without drbd? And why
does this only happen when using LVM in-between? Should be the same when
LVM is not used....

> Older kernels (RHEL 6) and also older drbd (8.3) are not affected, because they
> don't know about write-same.
My primary host is running CentOS7 while the secondary ist older
(CentOS6). I will try to create the ext4 on the secondary and then
switch to primary.

> Or tell the system that the backend does not support write-same:
> Check setting:
> 	grep ^ /sys/block/*/device/scsi_disk/*/max_write_same_blocks
> disable:
> 	echo 0 | tee /sys/block/*/device/scsi_disk/*/max_write_same_blocks
>
A "find /sys -name "*same*"" does not report any files named
"max_write_same_blocks". On none of the both nodes. So I dcan not
disable nor verify if it's enabled. I assume no as it does not exist. So
this might not be the reason.

Greetings

Christian
