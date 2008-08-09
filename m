Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m79HAC2g018147
	for <linux-lvm@redhat.com>; Sat, 9 Aug 2008 13:10:12 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.182])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m79HA28R022432
	for <linux-lvm@redhat.com.>; Sat, 9 Aug 2008 13:10:02 -0400
Received: by py-out-1112.google.com with SMTP id a29so752006pyi.0
	for <linux-lvm@redhat.com.>; Sat, 09 Aug 2008 10:10:02 -0700 (PDT)
Message-ID: <4e9ec2930808091010y2bfbd341p6e04411c01138a40@mail.gmail.com>
Date: Sat, 9 Aug 2008 12:10:01 -0500
From: Puttitintheovenn <puttitintheovenn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1088_24071958.1218301801987"
Subject: [linux-lvm] Ran pvemove Before vgreduce, need help recovering
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

------=_Part_1088_24071958.1218301801987
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey All, I am trying to remove /dev/sdb1 from my LVM but I booted to a live
CD and ran pvremove /dev/sdb1, it said it was busy so i added -ff and forced
it. Then I realized after when trying to boot it was still trying to find
that disk. I ran vgredce --removemissing and that seemed to fix the issue
but now It seems that my logical volume is gone and when i try to run
vgchange -a y it says 0 volume groups found. I am not at a loss, I am sure
there is a Volume Group, and a Psyhical Volume for /dev/sda1 and /dev/sda2
but no Logical Volume. I dont care about the data on /dev/sdb1 I just want
to get back everything on /dev/sda1 and 2.

Thanks and sorry if I did not give enough detail.

------=_Part_1088_24071958.1218301801987
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Hey All, I am trying to remove /dev/sdb1 from my LVM but I booted to a live CD and ran pvremove /dev/sdb1, it said it was busy so i added -ff and forced it. Then I realized after when trying to boot it was still trying to find that disk. I ran vgredce --removemissing and that seemed to fix the issue but now It seems that my logical volume is gone and when i try to run vgchange -a y it says 0 volume groups found. I am not at a loss, I am sure there is a Volume Group, and a Psyhical Volume for /dev/sda1 and /dev/sda2 but no Logical Volume. I dont care about the data on /dev/sdb1 I just want to get back everything on /dev/sda1 and 2.<br>
<br>Thanks and sorry if I did not give enough detail.<br></div>

------=_Part_1088_24071958.1218301801987--
