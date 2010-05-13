Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4DGMb6T008916
	for <linux-lvm@redhat.com>; Thu, 13 May 2010 12:22:37 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4DGMNIP002145
	for <linux-lvm@redhat.com>; Thu, 13 May 2010 12:22:24 -0400
Received: by wyb32 with SMTP id 32so1037211wyb.33
	for <linux-lvm@redhat.com>; Thu, 13 May 2010 09:22:22 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 13 May 2010 10:52:50 -0500
Message-ID: <AANLkTik4sH2MlJ21brfAT5ZmNTcl6FUd7VzO4cnxwAxZ@mail.gmail.com>
From: Richard Shaw <hobbes1069@gmail.com>
Subject: [linux-lvm] Status of LVM snapshot merging
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

There does not seem to be much information available on the status of
LVM snapshot merging available. I looked at the patches available from
the original author and both my kernel and LVM versions are newer than
what he provides patches for.

In lieu of the feature being available, does anyone know if it would
be possible to use rsync to effectivly merge a snapshot volume with
its origin volume?

If so, my plan was to try an extensive upgrade of my system on the
snapshot volume. If all goes well, I would then rsync the snapshot
back to the origin, update my fstab, and remove the snapshot. If it
does not go well, that's the easy part, just drop the snapshot and go
back to the origin.

Thanks,
Richard
