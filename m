Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3Q9Jg6k011769
	for <linux-lvm@redhat.com>; Fri, 26 Apr 2013 05:19:42 -0400
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3Q9Jfnq004151
	for <linux-lvm@redhat.com>; Fri, 26 Apr 2013 05:19:41 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so1951213pdi.5
	for <linux-lvm@redhat.com>; Fri, 26 Apr 2013 02:19:41 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 26 Apr 2013 14:49:41 +0530
Message-ID: <CAJbV6UOaAHcrP8272Jtbb2Yo8edk7P4=Evr4iHxVY3hM2J-Psg@mail.gmail.com>
From: siva krishna <hisivakrishna@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec51f93d7f4f12604db4008a0
Subject: [linux-lvm] determining boot disk name(/dev/sd...) on RHEL LVM
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

--bcaec51f93d7f4f12604db4008a0
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

is there a way to determine the device name (eg: /dev/sda, /dev/sdb)
on lvm partitioned disks,  when the os is booted from the lvm partitioned
disk
and there are also multiple disks connected which are having lvm partions
with same volume group names as the primary disk.

i tried doing vgdisplay
 and then correlating it's output with cat /etc/fstab, cat /etc/cmdline

but there are multiple volume groups having the same name so can't find
from which volume the RHEL is booting

Thanks
siva

--bcaec51f93d7f4f12604db4008a0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>=A0</div>
<div>is there a way to determine the device name (eg: /dev/sda, /dev/sdb)</=
div>
<div>on lvm partitioned disks, =A0when the os is booted from the lvm partit=
ioned disk</div>
<div>and there are also multiple disks connected which are having lvm parti=
ons with same volume group names as the primary disk.</div>
<div>=A0</div>
<div>i tried doing vgdisplay</div>
<div>=A0and then correlating it&#39;s output with cat /etc/fstab, cat /etc/=
cmdline</div>
<div>=A0</div>
<div>but there are multiple volume groups having the same name so can&#39;t=
 find from which volume the RHEL is booting</div>
<div>=A0</div>
<div>Thanks</div>
<div>siva</div>

--bcaec51f93d7f4f12604db4008a0--
