Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4NFL58F006063
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 11:21:05 -0400
Received: from mail-pz0-f46.google.com (mail-pz0-f46.google.com
	[209.85.210.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4NFL4gu006393
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 11:21:04 -0400
Received: by dady13 with SMTP id y13so13210337dad.33
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 08:21:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FBCA5D6.60507@redhat.com>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<4FBCA5D6.60507@redhat.com>
Date: Wed, 23 May 2012 10:21:04 -0500
Message-ID: <CAOAgVpwKBXJBbzbcVFhxjN_SdvncN0Vae55MC+sLJ7H2hBHabw@mail.gmail.com>
From: Les Mikesell <lesmikesell@gmail.com>
Subject: Re: [linux-lvm] Fun and games with mirroring
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: lvm@beer.org.uk

On Wed, May 23, 2012 at 3:54 AM, Bryn M. Reeves <bmr@redhat.com> wrote:
>
>> I'm not looking to have a LVM snapshot. I'm looking to have a
>> duplicate disk. This allows me to experiment on one, whilst keeping
>> the other safe.
>
> That's exactly what snapshots do.

If your experiment involves reinstalling an OS that reformats one of
the drives, what will that do to your snapshot?

With MD raid1 you can just pull one of the mirrors and you are pretty
safe.   Although I'm beginning to like ReaR
(http://rear.sourceforge.net/) as a backup mechanism that doesn't
require shutting down to do the backup and can restore to bare metal
including reconstructing the underlying raid/lvm/filesystems.
Clonezilla can work too, but you have to shut down for the save and it
doesn't do raid (but on the plus side it can handle windows
partitions).

> Patches are welcome. LVM is designed not to activate a partial VG
> unless the user specifies --partial. This is because for non-mirrored
> LVs activating without all PVs present would leave holes in devices.

Wait, so LVM doesn't know if the volume it is starting is complete or
not in the case of mirrors and --partial just blindly starts anyway?
 That's one of those things where you have to ask what they were
thinking.

-- 
   Les Mikesell
      lesmikesell@gmail.com
