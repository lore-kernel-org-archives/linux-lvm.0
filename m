Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1JMJtbk007415
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2015 17:19:55 -0500
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1JMJsgn020020
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2015 17:19:54 -0500
Received: by mail-ob0-f178.google.com with SMTP id uz6so20125087obc.9
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2015 14:19:53 -0800 (PST)
MIME-Version: 1.0
From: Joel Friedly <joelfriedly@gmail.com>
Date: Thu, 19 Feb 2015 14:19:33 -0800
Message-ID: <CAEhYyLibaMTiXhyVrmt5bF5U9kaBn_gzXRjkQRaPCFVp88gYmw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113d2bded26377050f785534
Subject: [linux-lvm] vgmknodes --refresh blocks forever waiting on a
	semaphore
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

--001a113d2bded26377050f785534
Content-Type: text/plain; charset=UTF-8

I'm trying to some disk failure testing, and we're using LVM on top of raw
disks.  After replacing the disk, the LV on the disk is unreadable until I
run vgmknodes --refresh.  That command hangs forever, but I can kill -9
it.  After running the command, everything works again and I can read the
LV.

I've seen this twice, so I ran strace the second time and you can find the
output here:  https://gist.github.com/jfriedly/50fe9134c4bc616f9f90 and
Ctrl-F for "425989"

On line 4250, LVM sets the semaphore's value to 1, then it immediately
checks the semaphore's value and confirms that it's 1.

On line 4253, LVM increments the semaphore's value to 2, then it
immediately checks the semaphore's value and confirms that it's 2.

On line 4295, LVM gets the semaphore's value and sees that it's 2, then it
immediately decrements the value to 1 and then waits indefinitely for the
value to hit 0.


Is LVM expecting some other process to decrement the semaphore?  Is this a
bug in vgmknodes --refresh?  Running without the refresh flag doesn't block
forever, but it also doesn't make the LV readable.



System Info:

Ubuntu 12.04
Kernel 3.13.0-39-generic
LVM 2.02.95-4ubuntu1
The disk is part of a VG named "vg.nebula.alexandria" and it is dedicated
to an LV called "alexandria.tlog".


Thanks for your help guys, and let me know if you need any more debugging
info,
Joel

--001a113d2bded26377050f785534
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m trying to some disk failure testing, and we&#39;re=
 using LVM on top of raw disks.=C2=A0 After replacing the disk, the LV on t=
he disk is unreadable until I run vgmknodes --refresh.=C2=A0 That command h=
angs forever, but I can kill -9 it.=C2=A0 After running the command, everyt=
hing works again and I can read the LV.<div><br></div><div>I&#39;ve seen th=
is twice, so I ran strace the second time and you can find the output here:=
 =C2=A0<a href=3D"https://gist.github.com/jfriedly/50fe9134c4bc616f9f90">ht=
tps://gist.github.com/jfriedly/50fe9134c4bc616f9f90</a> and Ctrl-F for &quo=
t;425989&quot;<div><br></div><div>On line 4250, LVM sets the semaphore&#39;=
s value to 1, then it immediately checks the semaphore&#39;s value and conf=
irms that it&#39;s 1.</div><div><br></div><div>On line 4253, LVM increments=
 the semaphore&#39;s value to 2, then it immediately checks the semaphore&#=
39;s value and confirms that it&#39;s 2.</div><div><br></div><div>On line 4=
295, LVM gets the semaphore&#39;s value and sees that it&#39;s 2, then it i=
mmediately decrements the value to 1 and then waits indefinitely for the va=
lue to hit 0.</div><div><br></div><div><br></div><div>Is LVM expecting some=
 other process to decrement the semaphore?=C2=A0 Is this a bug in vgmknodes=
 --refresh?=C2=A0 Running without the refresh flag doesn&#39;t block foreve=
r, but it also doesn&#39;t make the LV readable.</div><div><br></div><div><=
br></div><div><br></div><div>System Info:</div><div><br></div><div>Ubuntu 1=
2.04</div><div>Kernel 3.13.0-39-generic</div><div>LVM 2.02.95-4ubuntu1</div=
></div><div>The disk is part of a VG named &quot;vg.nebula.alexandria&quot;=
 and it is dedicated to an LV called &quot;alexandria.tlog&quot;.</div><div=
><br></div><div><br></div><div>Thanks for your help guys, and let me know i=
f you need any more debugging info,</div><div>Joel</div></div>

--001a113d2bded26377050f785534--
