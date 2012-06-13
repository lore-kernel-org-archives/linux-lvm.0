Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q5DEkkfn031470
	for <linux-lvm@redhat.com>; Wed, 13 Jun 2012 10:46:46 -0400
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q5DEkipH030413
	for <linux-lvm@redhat.com>; Wed, 13 Jun 2012 10:46:45 -0400
Received: by lbbgm6 with SMTP id gm6so1607880lbb.33
	for <linux-lvm@redhat.com>; Wed, 13 Jun 2012 07:46:44 -0700 (PDT)
MIME-Version: 1.0
Sender: sikieresmescribes@gmail.com
Date: Wed, 13 Jun 2012 16:46:39 +0200
Message-ID: <CAL-GF3yxEchtim-aHe_irC3M=znRzF2r-VpvSx21=oZZCjM76g@mail.gmail.com>
From: Da <dcodix@gmail.com>
Content-Type: multipart/alternative; boundary=e89a8f2344fd928a5804c25ba65f
Subject: Re: [linux-lvm] lvremove snapshot hangs LVM system
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

--e89a8f2344fd928a5804c25ba65f
Content-Type: text/plain; charset=ISO-8859-1

It's been a long time, but finally I had time to test it a bit.

As Ray Morris suggested I tried disabling selinux, with no luck. It happens
all the same.

Any way, I did some more testing and I think I detected the problem, but
not yet the solution.
The problem is that "lvremove" will fail removing the "dm" device. Nothing
changes on "dmsetup ls" after an "lvremove" yet if "lvremove" says the
removal was successful.

If I try to remove the "dm" before the "lvremove" then it seems to work:
[root@node2 ~]# dmsetup remove vgtest01-snap02 && dmsetup remove
vgtest01-snap02-cow && lvremove /dev/vgtest01/snap02
  Logical volume "snap02" successfully removed


But yet if I try any other "lvm" command:
[root@node2 ~]# lvcreate -s -L 20M -n snap10 /dev/vgtest01/lvtest-snap01
  /dev/vgtest01/snap10: not found: device not cleared
  Aborting. Failed to wipe snapshot exception store.

So I have to restart "clvm (which is better than rebooting).

I tried changing the snapshot to  "--monitor n" and "--noudevsync" with the
same luck.

So, I guess something is failing in the process to remove the "dm",... I
will keep looking...

Do someone have any ideas?

Thanks!

--e89a8f2344fd928a5804c25ba65f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

It&#39;s been a long time, but finally I had time to test it a bit.<br><br>=
As Ray Morris suggested I tried disabling selinux, with no luck. It happens=
 all the same.<br><br>Any way, I did some more testing and I think I detect=
ed the problem, but not yet the solution.<br>
The problem is that &quot;lvremove&quot; will fail removing the &quot;dm&qu=
ot; device. Nothing changes on &quot;dmsetup ls&quot; after an &quot;lvremo=
ve&quot; yet if &quot;lvremove&quot; says the removal was successful.<br>
<br>If I try to remove the &quot;dm&quot; before the &quot;lvremove&quot; t=
hen it seems to work:<br>[root@node2 ~]# dmsetup remove vgtest01-snap02 &am=
p;&amp; dmsetup remove vgtest01-snap02-cow &amp;&amp; lvremove /dev/vgtest0=
1/snap02<br>
=A0 Logical volume &quot;snap02&quot; successfully removed<br><br><br>But y=
et if I try any other &quot;lvm&quot; command:<br>[root@node2 ~]# lvcreate =
-s -L 20M -n snap10 /dev/vgtest01/lvtest-snap01<br>=A0 /dev/vgtest01/snap10=
: not found: device not cleared<br>
=A0 Aborting. Failed to wipe snapshot exception store.<br><br>So I have to =
restart &quot;clvm (which is better than rebooting).<br><br>I tried changin=
g the snapshot to=A0 &quot;--monitor n&quot; and &quot;--noudevsync&quot; w=
ith the same luck.<br>
<br>So, I guess something is failing in the process to remove the &quot;dm&=
quot;,... I will keep looking...<br><br>Do someone have any ideas?<br><br>T=
hanks!<br>

--e89a8f2344fd928a5804c25ba65f--
