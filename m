Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n273BI6Z019747
	for <linux-lvm@redhat.com>; Fri, 6 Mar 2009 22:11:18 -0500
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.24])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n273B215027361
	for <linux-lvm@redhat.com>; Fri, 6 Mar 2009 22:11:02 -0500
Received: by qw-out-2122.google.com with SMTP id 3so463782qwe.39
	for <linux-lvm@redhat.com>; Fri, 06 Mar 2009 19:11:02 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 7 Mar 2009 00:11:02 -0300
Message-ID: <f9d0f9760903061911s6db14df3t1ac602afa411e7e1@mail.gmail.com>
From: Ricardo Funke Ormieres <funke.listas@gmail.com>
Content-Type: multipart/alternative; boundary=0015175cb15452ae2804647ec05f
Subject: [linux-lvm] how to enlarge a logical volume that is a virtual disk
	of a virtual machine that uses lvm too?
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
To: linux-lvm@redhat.com

--0015175cb15452ae2804647ec05f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I have a phisical machine with a xen vm installed and I'm using LVM in both.
The Virtual Machine is using a LogVol (that belongs to the Dom0) as it's
virtual hard disk.

It's possible to enlarge this LogVol in order to enlarge the vm's hard disk?

I know that I can just create another LogVol in the Dom0 and add it to the
vm's PV, but I'm curious for that possible alternative.

Thanks in advance

--0015175cb15452ae2804647ec05f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>I have a phisical machine with a xen vm installed and I&#39;m=
 using LVM in both. The Virtual Machine is using a LogVol (that belongs to =
the Dom0) as it&#39;s virtual hard disk.<br><br>It&#39;s possible to enlarg=
e this LogVol in order to enlarge the vm&#39;s hard disk?<br>
<br>I know that I can just create another LogVol in the Dom0 and add it to =
the vm&#39;s PV, but I&#39;m curious for that possible alternative.<br><br>=
Thanks in advance<br>

--0015175cb15452ae2804647ec05f--
