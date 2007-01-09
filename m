Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l096nlJ2006906
	for <linux-lvm@redhat.com>; Tue, 9 Jan 2007 01:49:47 -0500
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.237])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l096nkgc015478
	for <linux-lvm@redhat.com>; Tue, 9 Jan 2007 01:49:47 -0500
Received: by nz-out-0506.google.com with SMTP id s18so5803445nze
	for <linux-lvm@redhat.com>; Mon, 08 Jan 2007 22:49:46 -0800 (PST)
Message-ID: <5adb39f00701082249g3a13757csf27383fa9a27e53d@mail.gmail.com>
Date: Mon, 8 Jan 2007 22:49:46 -0800
From: "David Tran" <davidtt3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_71637_6092184.1168325386536"
Subject: [linux-lvm] lvextend Insufficient free space
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

------=_Part_71637_6092184.1168325386536
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
What wrong with my command line? Please help.
OR
This is a bug?

linux-server:/ # vgdisplay
  --- Volume group ---
  VG Name               gdata
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  5
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               3
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               544.62 GB
  PE Size               4.00 MB
  Total PE              139424
  Alloc PE / Size       100148 / 391.20 GB
  Free  PE / Size       39276 / 153.42 GB
  VG UUID               gROPCK-xUmS-Tk99-nTmp-S63F-otHE-9QJukD
-------------------------------------------------------------
/////// So I have 153.42 GB free space NOW
-------------------------------------------------------------
linux-server:/ # lvextend -L +100G /dev/gdata/priv
  Extending logical volume priv to 177.80 GB
  Insufficient free space: 45517 extents needed, but only 39276 available

Thank you.

------=_Part_71637_6092184.1168325386536
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, <br>What wrong with my command line? Please help.<br>OR<br>This is a bug?<br><br>linux-server:/ # vgdisplay<br>&nbsp; --- Volume group ---<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gdata<br>&nbsp; System ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2
<br>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br>&nbsp; Metadata Sequence No&nbsp; 5<br>&nbsp; VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>&nbsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resizable<br>&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br>&nbsp; Open
 LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br>&nbsp; Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br>&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br>&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 544.62 GB<br>&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.00 MB<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 139424<br>&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100148 / 
391.20 GB<br>&nbsp; <span style="color: rgb(255, 0, 0); font-weight: bold;">Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 39276 / 153.42 GB</span><br>&nbsp; VG
 UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gROPCK-xUmS-Tk99-nTmp-S63F-otHE-9QJukD<br>-------------------------------------------------------------<br>/////// <span style="font-weight: bold; color: rgb(255, 0, 0);">So I have 153.42 GB free space NOW
</span><br>-------------------------------------------------------------<br>linux-server:/ # lvextend -L +<span style="color: rgb(51, 51, 255); font-weight: bold;">100G</span> /dev/gdata/priv<br>&nbsp; Extending logical volume priv to 
177.80 GB<br>&nbsp; Insufficient free space: <span style="color: rgb(51, 51, 255); font-weight: bold;">45517 extents needed, but only 39276 available</span><br><br>Thank you.

------=_Part_71637_6092184.1168325386536--
