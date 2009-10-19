Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9JGLaf6017272
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 12:21:36 -0400
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.211.195])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9JGLQUZ009973
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 12:21:26 -0400
Received: by ywh33 with SMTP id 33so3849058ywh.23
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 09:21:26 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 19 Oct 2009 09:21:26 -0700
Message-ID: <a5a956f70910190921i65a10986qd6e560c22cfa5878@mail.gmail.com>
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=0016368e315a2baa2004764c23db
Subject: [linux-lvm] Same file system after drive restore. Why?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM Linux Mailing List <linux-lvm@redhat.com>

--0016368e315a2baa2004764c23db
Content-Type: text/plain; charset=ISO-8859-1

I am confused as to where LVM data is stored. Restoring  a disk image
doesn't seem to restore the original LVM set-up.

I have a small desktop with CentOS V5.3 on it. After installing a basic
system, I recorded an image of the *entire* hard drive. I then added a
second hard drive with a single partition via LVM (GUI). After a failure, I
restored the image, but I still see the same two-drive LVM configuration.
How is this possible?

Even during the kernel start-up, I saw notices of VolGroup00 problems -
something about reverting to "version 5", although the notices went by too
fast to record. I should just have seen the original configuration. I'm
stumped.

Lou.

--0016368e315a2baa2004764c23db
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>I am confused as to where LVM data is stored.=A0Restoring =A0a disk im=
age doesn&#39;t seem to=A0restore the original LVM set-up.</div>
<div>=A0</div>
<div>I have a small desktop=A0with CentOS V5.3 on it. After installing a ba=
sic system, I recorded an image of the <strong><u>entire</u></strong> hard =
drive. I then added a second hard drive with a single partition via LVM (GU=
I). After a failure, I restored the image, but I still see the same two-dri=
ve LVM configuration. How is this possible?</div>

<div>=A0</div>
<div>Even during the kernel start-up,=A0I saw notices of VolGroup00 problem=
s - something about reverting to &quot;version 5&quot;, although the notice=
s went by too fast to record.=A0I should just have seen the original config=
uration. I&#39;m stumped.</div>

<div>=A0</div>
<div>Lou.</div>

--0016368e315a2baa2004764c23db--
