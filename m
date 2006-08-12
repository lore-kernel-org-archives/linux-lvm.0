Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7C0ABDo026074
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 20:10:11 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.174])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7C0A435026405
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 20:10:05 -0400
Received: by ug-out-1314.google.com with SMTP id c2so789501ugf
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 17:10:04 -0700 (PDT)
Message-ID: <ad7139520608111710y6f990249y1ce2611ddd4b6bc6@mail.gmail.com>
Date: Fri, 11 Aug 2006 20:10:03 -0400
From: "newzen newzen" <newzenca@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_106821_3724105.1155341403619"
Subject: [linux-lvm] very confuse, trying to mount two LVM disk
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

------=_Part_106821_3724105.1155341403619
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all, new at list and confused,

I have two disk with lvm created with diskdruid when installing my os. Both
offcourse have the same name /GroupVol00/. One is boot and another is slave.
I need to take some information from one to another.

[root@dc9f8f45e ~]# pvscan
  PV /dev/hda2   VG VolGroup00   lvm2 [76.56 GB / 96.00 MB free]
  PV /dev/hdb2                   lvm2 [9.96 GB]
  Total: 2 [86.52 GB] / in use: 1 [76.56 GB] / in no VG: 1 [9.96 GB]

[root@dc9f8f45e ~]# vgdisplay
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               76.56 GB
  PE Size               32.00 MB
  Total PE              2450
  Alloc PE / Size       2447 / 76.47 GB
  Free  PE / Size       3 / 96.00 MB
  VG UUID               Wr6aiP-I29z-b2pg-x4JQ-7S2M-GMCR-yKBNAa

Im very confused reading the documentation, some one can tell me howto
mount,
help is really needed
Thanks in advance
and excuse if this is a very basic question, but really can't undestand

------=_Part_106821_3724105.1155341403619
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all, new at list and confused,<br>
<br>
I have two disk with lvm created with diskdruid when installing my os.
Both offcourse have the same name /GroupVol00/. One is boot and another
is slave.<br>
I need to take some information from one to another.<br>
<br>
[root@dc9f8f45e ~]# pvscan<br>
&nbsp; PV /dev/hda2&nbsp;&nbsp; VG VolGroup00&nbsp;&nbsp; lvm2 [76.56 GB / 96.00 MB free]<br>
&nbsp; PV
/dev/hdb2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
lvm2 [9.96 GB]<br>
&nbsp; Total: 2 [86.52 GB] / in use: 1 [76.56 GB] / in no VG: 1 [9.96 GB]<br>
<br>
[root@dc9f8f45e ~]# vgdisplay<br>
&nbsp; --- Volume group ---<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VolGroup00<br>
&nbsp; System ID<br>
&nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2<br>
&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&nbsp; Metadata Sequence No&nbsp; 3<br>
&nbsp; VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>
&nbsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resizable<br>
&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&nbsp; Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 76.56 GB<br>
&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32.00 MB<br>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2450<br>
&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2447 / 76.47 GB<br>
&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3 / 96.00 MB<br>
&nbsp; VG
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Wr6aiP-I29z-b2pg-x4JQ-7S2M-GMCR-yKBNAa<br>
<br>
Im very confused reading the documentation, some one can tell me howto mount,<br>
help is really needed<br>
Thanks in advance <br>
and excuse if this is a very basic question, but really can't undestand<br>
<br>

------=_Part_106821_3724105.1155341403619--
