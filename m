Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBE3bT114035
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 22:37:29 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.207])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBE3bM2B006889
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 22:37:22 -0500
Received: by zproxy.gmail.com with SMTP id 12so14895nzp
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 19:37:22 -0800 (PST)
Message-ID: <539807300512131937s72661636h@mail.gmail.com>
Date: Wed, 14 Dec 2005 11:37:22 +0800
From: Lee Rocky <rocky366@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_17766_30612735.1134531442518"
Subject: [linux-lvm] Invalid new snapshot
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_17766_30612735.1134531442518
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dear All

when I try to create multi snapshot volumes, sometimes the new snapshot
volume will be marked Invalid after created, somtimes remove then recreate
without problem.

is it hard disk problem?

dmesg error
attempt to access beyond end of device
dm-9: rw=3D17, want=3D2271285024, limit=3D8257536
device-mapper: Error reading/writing snapshot
device-mapper: snapshot is marked invalid
printk: 1 messages suppressed.
Buffer I/O error on device dm-10, logical block 0
Buffer I/O error on device dm-10, logical block 1
Buffer I/O error on device dm-10, logical block 2
Buffer I/O error on device dm-10, logical block 3
Buffer I/O error on device dm-10, logical block 4
Buffer I/O error on device dm-10, logical block 5
Buffer I/O error on device dm-10, logical block 6
Buffer I/O error on device dm-10, logical block 7
Buffer I/O error on device dm-10, logical block 0
Buffer I/O error on device dm-10, logical block 8
FAT: Unrecognized mount option "nouuid" or missing value

lvscan
  /dev/VG01/test1: read failed after 0 of 4096 at 0: Input/output error

best regards
Rocky

------=_Part_17766_30612735.1134531442518
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dear All<br>
<br>
when I try to create multi snapshot volumes, sometimes the new snapshot
volume will be marked Invalid after created, somtimes remove then
recreate without problem.<br>
<br>
is it hard disk problem?<br>
<br>
dmesg error<br>
attempt to access beyond end of device<br>
dm-9: rw=3D17, want=3D2271285024, limit=3D8257536<br>
device-mapper: Error reading/writing snapshot<br>
device-mapper: snapshot is marked invalid<br>
printk: 1 messages suppressed.<br>
Buffer I/O error on device dm-10, logical block 0<br>
Buffer I/O error on device dm-10, logical block 1<br>
Buffer I/O error on device dm-10, logical block 2<br>
Buffer I/O error on device dm-10, logical block 3<br>
Buffer I/O error on device dm-10, logical block 4<br>
Buffer I/O error on device dm-10, logical block 5<br>
Buffer I/O error on device dm-10, logical block 6<br>
Buffer I/O error on device dm-10, logical block 7<br>
Buffer I/O error on device dm-10, logical block 0<br>
Buffer I/O error on device dm-10, logical block 8<br>
FAT: Unrecognized mount option &quot;nouuid&quot; or missing value<br>
<br>
lvscan <br>
&nbsp; /dev/VG01/test1: read failed after 0 of 4096 at 0: Input/output erro=
r<br>
<br>
best regards<br>
Rocky<br>
<br>

------=_Part_17766_30612735.1134531442518--
