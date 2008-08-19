Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7JK9Zun019050
	for <linux-lvm@redhat.com>; Tue, 19 Aug 2008 16:09:35 -0400
Received: from mail-gx0-f15.google.com (mail-gx0-f15.google.com
	[209.85.217.15])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7JK9DmE011116
	for <linux-lvm@redhat.com>; Tue, 19 Aug 2008 16:09:14 -0400
Received: by gxk8 with SMTP id 8so8377501gxk.3
	for <linux-lvm@redhat.com>; Tue, 19 Aug 2008 13:09:08 -0700 (PDT)
Message-ID: <779919740808191309r63a54bd6q7335aba2e56e3715@mail.gmail.com>
Date: Tue, 19 Aug 2008 14:09:07 -0600
From: "Jeremy Lyon" <jerlyon@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_30820_19228306.1219176547899"
Subject: [linux-lvm] devices clarification
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

------=_Part_30820_19228306.1219176547899
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

In the following output, are the numbers in the parentheses the starting PE
of that LV?

  VG        LV        KMin Devices
  vg00      lvol1     0    /dev/sda2(0)
  vg00      lvol4     1    /dev/sda2(32)
  vg00      lvol7     2    /dev/sda2(64)
  vg00      lvol5     3    /dev/sda2(192)
  vg00      lvol3     4    /dev/sda2(208)
  vg00      lvol6     5    /dev/sda2(272)
  vg00      lvol6     5    /dev/sda2(1136)
  vg00      lvol2     6    /dev/sda2(304)
  vg00      lvol8     7    /dev/sda2(496)

Thanks
Jeremy

------=_Part_30820_19228306.1219176547899
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Hi,<br><br>In the following output, are the numbers in the parentheses the starting PE of that LV?<br><br>&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; KMin Devices<br>&nbsp; vg00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvol1&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; /dev/sda2(0)<br>&nbsp; vg00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvol4&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp; /dev/sda2(32)<br>
&nbsp; vg00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvol7&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp; /dev/sda2(64)<br>&nbsp; vg00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvol5&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp; /dev/sda2(192)<br>&nbsp; vg00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvol3&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp;&nbsp;&nbsp; /dev/sda2(208)<br>&nbsp; vg00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvol6&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp; /dev/sda2(272)<br>&nbsp; vg00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvol6&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp; /dev/sda2(1136)<br>
&nbsp; vg00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvol2&nbsp;&nbsp;&nbsp;&nbsp; 6&nbsp;&nbsp;&nbsp; /dev/sda2(304)<br>&nbsp; vg00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvol8&nbsp;&nbsp;&nbsp;&nbsp; 7&nbsp;&nbsp;&nbsp; /dev/sda2(496)<br><br>Thanks<br>Jeremy<br></div>

------=_Part_30820_19228306.1219176547899--
