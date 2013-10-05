Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9546WoH025379
	for <linux-lvm@redhat.com>; Sat, 5 Oct 2013 00:06:32 -0400
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9546U0C003199
	for <linux-lvm@redhat.com>; Sat, 5 Oct 2013 00:06:31 -0400
Received: by mail-pd0-f171.google.com with SMTP id g10so4863832pdj.16
	for <linux-lvm@redhat.com>; Fri, 04 Oct 2013 21:06:30 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 4 Oct 2013 21:06:30 -0700
Message-ID: <CAH5g025Z+f2C_t1vvqbsCU43VzTY-NvCRg9A+GYF8cLh2+46gw@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b15ab7f35b4a704e7f68bd4
Subject: [linux-lvm] Destroyed partition on one PV (followup)
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--047d7b15ab7f35b4a704e7f68bd4
Content-Type: text/plain; charset=ISO-8859-1

I did a little more investigating that might somewhat change the solution.

What caused the corruption was a fedora installation that was supposed to
be on a different drive, but the dynamic labelling of devs screwed me.

What I had to begin with was an lv of 3 devs: sdb1, sdc1, and sdd1. The
installer re-partitioned sdb into 5 separate partitions (a boot, swap, and
3 ext4), and then began to format them. I stopped the format before it got
to far along. The other devs are untouched.

I can run the pvcreate command (I tried with the -t flag) to restore the pv
on 2 of the ext4 partitions, as well as on the swap partition (pvcreate
asks to wipe the swap signature). So, if I did, how would I recombine those
separate partitions back to one?

I know that a lot of the data is still there and somewhat intact - I did a
hexdump of each.

Any ideas?

As always, TIA.

ken

--047d7b15ab7f35b4a704e7f68bd4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div>I did a little more inv=
estigating that might somewhat change the solution.<br><br></div>What cause=
d the corruption was a fedora installation that was supposed to be on a dif=
ferent drive, but the dynamic labelling of devs screwed me. <br>
<br></div>What I had to begin with was an lv of 3 devs: sdb1, sdc1, and sdd=
1. The installer re-partitioned sdb into 5 separate partitions (a boot, swa=
p, and 3 ext4), and then began to format them. I stopped the format before =
it got to far along. The other devs are untouched.<br>
<br></div>I can run the pvcreate command (I tried with the -t flag) to rest=
ore the pv on 2 of the ext4 partitions, as well as on the swap partition (p=
vcreate asks to wipe the swap signature). So, if I did, how would I recombi=
ne those separate partitions back to one?<br>
<br></div>I know that a lot of the data is still there and somewhat intact =
- I did a hexdump of each.<br><br></div>Any ideas?<br><br></div>As always, =
TIA.<br><br></div>ken<br><br></div>

--047d7b15ab7f35b4a704e7f68bd4--
