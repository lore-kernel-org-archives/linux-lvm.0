Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBB2h6Ki016877
	for <linux-lvm@redhat.com>; Mon, 10 Dec 2007 21:43:06 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.238])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBB2gjuR016624
	for <linux-lvm@redhat.com>; Mon, 10 Dec 2007 21:42:45 -0500
Received: by wr-out-0506.google.com with SMTP id c57so1576970wra
	for <linux-lvm@redhat.com>; Mon, 10 Dec 2007 18:42:45 -0800 (PST)
Message-ID: <1f31f75c0712101842q4d71c03bu75926f1deb026a26@mail.gmail.com>
Date: Mon, 10 Dec 2007 21:42:45 -0500
From: "Null EXE" <nullexe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1740_31803181.1197340965176"
Subject: [linux-lvm] lvm raid failure
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

------=_Part_1740_31803181.1197340965176
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi everyone,


I have been running an Edgy fileserver for about 6 months now. When I came
home from work last week I found my files all inaccessible. After
investigation I found issues with my PV. I would like to recover my data and
replace the drives if possible any help is greatly appreciated!

I have one system drive and 6 storage drive, all raid1. The storage layout
is
2x160GB /dev/md0
2x250GB /dev/md1
2x250GB /dev/md2
After investigation I found problems with my lvm. pvdisplay showed:
Couldn't find device with uuid 'xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3'.

I ran the command:
sudo pvcreate --uuid "xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3" --restorefile
/etc/lvm/archive/fileserver_00006.vg /dev/md2

This seemed to recover /dev/md2. I re-ran pvdisplay and got
Couldn't find device with uuid '1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo'.

I figured I could run the same command on md1,
sudo pvcreate --uuid "1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo" --restorefile
/etc/lvm/archive/fileserver_00006.vg /dev/md1

and got the message:
Couldn't find device with uuid '1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo'.
Device /dev/md1 not found (or ignored by filtering).

After re-executing the above command with -vvv at the bottom of the output I
get the following message:
#device/dev-io.c:439         Opened /dev/md1 RO
#device/dev-io.c:264       /dev/md1: size is 0 sectors
#filters/filter.c:106         /dev/md1: Skipping: Too small to hold a PV
#device/dev-io.c:485         Closed /dev/md1
#pvcreate.c:81   Device /dev/md1 not found (or ignored by filtering).

Here is my pvdisplay. Again, any help is Greatly appreciated
***START***

Couldn't find device with uuid '1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo'.
Couldn't find device with uuid '1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo'.
--- Physical volume ---
PV Name /dev/md0
VG Name fileserver
PV Size 149.05 GB / not usable 0
Allocatable yes
PE Size (KByte) 4096
Total PE 38156
Free PE 9996
Allocated PE 28160
PV UUID pZV1Ff-Y7fu-S8m1-tVFn-fOMJ-VRls-fLFEov

--- Physical volume ---
PV Name unknown device
VG Name fileserver
PV Size 232.88 GB / not usable 0
Allocatable yes (but full)
PE Size (KByte) 4096
Total PE 59618
Free PE 0
Allocated PE 59618
PV UUID 1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo

--- Physical volume ---
PV Name /dev/md2
VG Name fileserver
PV Size 232.88 GB / not usable 0
Allocatable yes
PE Size (KByte) 4096
Total PE 59618
Free PE 9156
Allocated PE 50462
PV UUID xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3

------=_Part_1740_31803181.1197340965176
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi everyone,<br>
<br>
<br>
I have been running an Edgy fileserver for about 6 months now. When I
came home from work last week I found my files all inaccessible. After
investigation I found issues with my PV. I would like to recover my
data and replace the drives if possible any help is greatly appreciated!<br>
<br>
I have one system drive and 6 storage drive, all raid1.  The storage layout is<br>
2x160GB /dev/md0<br>
2x250GB /dev/md1<br>
2x250GB /dev/md2<br>
After investigation I found problems with my lvm.  pvdisplay showed: <br>
Couldn&#39;t find device with uuid &#39;xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3&#39;.<br>
<br>I ran the command:<br>
sudo pvcreate --uuid &quot;xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3&quot; --restorefile /etc/lvm/archive/fileserver_00006.vg /dev/md2<br>
<br>
This seemed to recover /dev/md2.  I re-ran pvdisplay and got<br>
Couldn&#39;t find device with uuid &#39;1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo&#39;.<br>
<br>
I figured I could run the same command on md1,<br>
sudo pvcreate --uuid &quot;1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo&quot; --restorefile /etc/lvm/archive/fileserver_00006.vg /dev/md1<br>
<br>
and got the message:<br>
Couldn&#39;t find device with uuid &#39;1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo&#39;.<br>
  Device /dev/md1 not found (or ignored by filtering).<br>
<br>After re-executing the above command with -vvv at the bottom of the output I get the following message: <br>#device/dev-io.c:439&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/md1 RO<br>#device/dev-io.c:264&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md1: size is 0 sectors<br>
#filters/filter.c:106&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md1: Skipping: Too small to hold a PV<br>#device/dev-io.c:485&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed /dev/md1<br>#pvcreate.c:81&nbsp;&nbsp; Device /dev/md1 not found (or ignored by filtering).<br><br>
Here is my pvdisplay.  Again, any help is Greatly appreciated<br>
***START***<br>
<br>
  Couldn&#39;t find device with uuid &#39;1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo&#39;.<br>
  Couldn&#39;t find device with uuid &#39;1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo&#39;.<br>
  --- Physical volume ---<br>
  PV Name               /dev/md0<br>
  VG Name               fileserver<br>
  PV Size               149.05 GB / not usable 0   <br>
  Allocatable           yes <br>
  PE Size (KByte)       4096<br>
  Total PE              38156<br>
  Free PE               9996<br>
  Allocated PE          28160<br>
  PV UUID               pZV1Ff-Y7fu-S8m1-tVFn-fOMJ-VRls-fLFEov<br>
   <br>
  --- Physical volume ---<br>
  PV Name               unknown device<br>
  VG Name               fileserver<br>
  PV Size               232.88 GB / not usable 0   <br>
  Allocatable           yes (but full)<br>
  PE Size (KByte)       4096<br>
  Total PE              59618<br>
  Free PE               0<br>
  Allocated PE          59618<br>
  PV UUID               1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo<br>
   <br>
  --- Physical volume ---<br>
  PV Name               /dev/md2<br>
  VG Name               fileserver<br>
  PV Size               232.88 GB / not usable 0   <br>
  Allocatable           yes <br>
  PE Size (KByte)       4096<br>
  Total PE              59618<br>
  Free PE               9156<br>
  Allocated PE          50462<br>
  PV UUID               xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3

------=_Part_1740_31803181.1197340965176--
