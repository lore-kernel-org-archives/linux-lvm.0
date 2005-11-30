Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAU71RV20154
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 02:01:27 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.193])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAU71L5a016012
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 02:01:21 -0500
Received: by wproxy.gmail.com with SMTP id 36so46631wra
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 23:01:21 -0800 (PST)
Message-ID: <efef33d20511292301s1fe5cf0dp90180833f51e2360@mail.gmail.com>
Date: Wed, 30 Nov 2005 08:01:20 +0100
From: Wallace Wadge <wwadge@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2717_8640034.1133334080900"
Subject: [linux-lvm] lvm + raid (confused)
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

------=_Part_2717_8640034.1133334080900
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I've got a hardware raid in place. I'd like to add snapshots via lvm to it
but unfortunately the underlying filesystem is ext3 which cannot be resized
downwards; therefore I would like to add another disk.

Now for the problem:

I would like to add a secondary (physical) disk to the mix and use it for
snapshots only. However I do not want the lvm to stay writing to that disk
for normal data since this seconday disk would not be part of my hardware
raid. In other words, I wouldn't care if the snapshot drive failed because =
I
would just replace it.

Is this at all possible?

Thanks.
Wallace

------=_Part_2717_8640034.1133334080900
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,<br><br>I've got a hardware raid in place. I'd like to add snapshots
via lvm to it but unfortunately the underlying filesystem is ext3 which
cannot be resized downwards; therefore I would like to add another
disk. <br><br>Now for the problem:<br><br>I would like to add a
secondary (physical) disk to the mix and use it for snapshots only.
However I do not want the lvm to stay writing to that disk for normal
data since this seconday disk would not be part of my hardware raid. In oth=
er words, I wouldn't care if the snapshot drive failed because I would just=
 replace it.<br><br>Is this at all possible?<br><br>Thanks.<br>Wallace
<br>

------=_Part_2717_8640034.1133334080900--
