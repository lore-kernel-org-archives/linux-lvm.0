Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3F0els6032569
	for <linux-lvm@redhat.com>; Sun, 14 Apr 2013 20:40:47 -0400
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3F0ejn7002707
	for <linux-lvm@redhat.com>; Sun, 14 Apr 2013 20:40:46 -0400
Received: by mail-vb0-f49.google.com with SMTP id 11so3389646vbf.36
	for <linux-lvm@redhat.com>; Sun, 14 Apr 2013 17:40:45 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 15 Apr 2013 00:40:45 +0000
Message-ID: <CAMQmwe3bbAGwsoCwfJMrEQ1sQ8hsYDqeBMAbebJ-T6usdGpEgw@mail.gmail.com>
From: Jay Denebeim <denebeim@gmail.com>
Content-Type: multipart/alternative; boundary=089e01184a60d83a3c04da5b8085
Subject: [linux-lvm] lvm snapshot corruption
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
To: linux-lvm@redhat.com

--089e01184a60d83a3c04da5b8085
Content-Type: text/plain; charset=ISO-8859-1

I've gotten myself into a mess I think.  What happened is:

my internet hung.  I ended up rebooting the machine I use for gateways etc.

The init failed.  It looks like it failed where it tries to mount the
root.  I booted a recovery disk at this point.

Quite awhile back I was upgrading from Ubuntu 10.04 to 12.04, I was doing
it by taking a snapshot, doing the upgrade, testing it, merging, doing the
next upgrade, etc.  It appears that I forgot to do the final merge, so I
was running off of a snapshot.

I believe that the snapshot filled.  And now it's no longer mounting.

Here's where I made my mistake, I probably should have removed the snapshot
at this point.  Instead I tried to merge it.  Now I seem to be stuck, the
merge is not happening, I can't rename the snapshot, I can't delete it, I
can't take another snapshot of the original disk.

Where I want to be, ideally I would like to see the the original snapshot
merged into the origin.  Barring that I'd like to get rid of the snapshot
and go back to the original disk.  I do take daily backups, so I should be
able to recover if I can get the system sane.

So, what do I do at this point?

Thanks muchly
Jay

--089e01184a60d83a3c04da5b8085
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div>I&#39;ve gott=
en myself into a mess I think.=A0 What happened is:<br><br></div>my interne=
t hung.=A0 I ended up rebooting the machine I use for gateways etc.<br><br>=
</div>
The init failed.=A0 It looks like it failed where it tries to mount the roo=
t.=A0 I booted a recovery disk at this point.<br><br></div>Quite awhile bac=
k I was upgrading from Ubuntu 10.04 to 12.04, I was doing it by taking a sn=
apshot, doing the upgrade, testing it, merging, doing the next upgrade, etc=
.=A0 It appears that I forgot to do the final merge, so I was running off o=
f a snapshot.<br>
<br></div>I believe that the snapshot filled.=A0 And now it&#39;s no longer=
 mounting.<br><br></div>Here&#39;s where I made my mistake, I probably shou=
ld have removed the snapshot at this point.=A0 Instead I tried to merge it.=
=A0 Now I seem to be stuck, the merge is not happening, I can&#39;t rename =
the snapshot, I can&#39;t delete it, I can&#39;t take another snapshot of t=
he original disk.<br>
<br></div>Where I want to be, ideally I would like to see the the original =
snapshot merged into the origin.=A0 Barring that I&#39;d like to get rid of=
 the snapshot and go back to the original disk.=A0 I do take daily backups,=
 so I should be able to recover if I can get the system sane.<br>
<br></div>So, what do I do at this point?<br><br></div>Thanks muchly<br></d=
iv>Jay<br><br></div>

--089e01184a60d83a3c04da5b8085--
