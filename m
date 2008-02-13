Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1D8DYio012906
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 03:13:34 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.228])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m1D8DDTp002390
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 03:13:14 -0500
Received: by wx-out-0506.google.com with SMTP id t16so4766010wxc.6
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 00:13:13 -0800 (PST)
Message-ID: <b646832c0802130013x2081fe55y10f6e2c079134acf@mail.gmail.com>
Date: Wed, 13 Feb 2008 13:43:12 +0530
From: "=?UTF-8?Q?Yajith_Ajantha_Dayarath?=
	=?UTF-8?Q?na_|_=E0=B6=BA=E0=B6=A2=E0=B7=92=E0=B6=AD=E0=B7=8A_=E0=B6=85?=
	=?UTF-8?Q?=E0=B6=A2=E0=B6=B1=E0=B7=8A=E0=B6=AD_=E0=B6=AF?=
	=?UTF-8?Q?=E0=B6=BA=E0=B7=8F=E0=B6=BB=E0=B6=AD=E0=B7=8A=E0=B6=B1?="
	<yajith@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_21371_17744412.1202890392916"
Subject: [linux-lvm] pvcreate problem
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

------=_Part_21371_17744412.1202890392916
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,
Forgive me if this is the wrong list to ask this question.
I'm quite new to LVM(-and to this list) and one of my friends brought this
question up to me..

There is an error coming up when they try to "pvcreate"

Below is the "fdisk -l" output.

[root@lwlsvr bin]# fdisk -l


Disk /dev/cciss/c0d0: 145.6 GB, 145667358720 bytes
255 heads, 32 sectors/track, 34866 cylinders
Units = cylinders of 8160 * 512 = 4177920 bytes

          Device Boot    Start       End    Blocks   Id  System
/dev/cciss/c0d0p1   *         1        25    101984   83  Linux
/dev/cciss/c0d0p2            26      7554  30718320   83  Linux
/dev/cciss/c0d0p3          7555      8068   2097120   82  Linux swap
/dev/cciss/c0d0p4          8069     34866 109335840    5  Extended
/dev/cciss/c0d0p5          8069     10578  10240784   83  Linux
/dev/cciss/c0d0p6         10579     10587     36704   83  Linux
/dev/cciss/c0d0p7         10588     10596     36704   83  Linux
/dev/cciss/c0d0p8         10597     10725    526304   83  Linux
/dev/cciss/c0d0p9         10726     10988   1073024   83  Linux
/dev/cciss/c0d0p10        10989     11251   1073024   83  Linux
/dev/cciss/c0d0p11        11252     11776   2141984   83  Linux
/dev/cciss/c0d0p12        11777     12301   2141984   83  Linux
/dev/cciss/c0d0p13        12302     12826   2141984   83  Linux
/dev/cciss/c0d0p14        12827     13351   2141984   83  Linux
/dev/cciss/c0d0p15        13352     13876   2141984   83  Linux
/dev/cciss/c0d0p16        13877     34866  85639184   8e  Linux LVM

When a pvcreate is attempted on "/dev/cciss/c0d0p16" it produces the below
output.

[root@lwlsvr informix]# pvcreate /dev/cciss/c0d0p16
pvcreate -- can't open physical volume "/dev/cciss/c0d0p16" to get its size


pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help]
       [-s|--size PhysicalVolumeSize[kKmMgGtT]] [-y|--yes] [-v|--verbose]
       [--version] PhysicalVolume [PhysicalVolume...]

Highly appreciate any help...

Thanks.
-- 
Yajith Ajantha

------=_Part_21371_17744412.1202890392916
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,<br>Forgive me if this is the wrong list to ask this question.<br>I&#39;m quite new to LVM(-and to this list) and one of my friends brought this question up to me..<br><br>There is an error coming up when they try to &quot;pvcreate&quot;<br>
<br>Below is the &quot;fdisk -l&quot; output.<br><br>[root@lwlsvr bin]# fdisk -l<br><div class="Ih2E3d"><br><br>Disk /dev/cciss/c0d0: 145.6 GB, 145667358720 bytes<br>255 heads, 32 sectors/track, 34866 cylinders<br>Units = cylinders of 8160 * 512 = 4177920 bytes<br>
<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Device Boot &nbsp; &nbsp;Start &nbsp; &nbsp; &nbsp; End &nbsp; &nbsp;Blocks &nbsp; Id &nbsp;System<br>/dev/cciss/c0d0p1 &nbsp; * &nbsp; &nbsp; &nbsp; &nbsp; 1 &nbsp; &nbsp; &nbsp; &nbsp;25 &nbsp; &nbsp;101984 &nbsp; 83 &nbsp;Linux<br>/dev/cciss/c0d0p2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;26 &nbsp; &nbsp; &nbsp;7554 &nbsp;30718320 &nbsp; 83 &nbsp;Linux<br>/dev/cciss/c0d0p3 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;7555 &nbsp; &nbsp; &nbsp;8068 &nbsp; 2097120 &nbsp; 82 &nbsp;Linux swap<br>
/dev/cciss/c0d0p4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8069 &nbsp; &nbsp; 34866 109335840 &nbsp; &nbsp;5 &nbsp;Extended<br>/dev/cciss/c0d0p5 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;8069 &nbsp; &nbsp; 10578 &nbsp;10240784 &nbsp; 83 &nbsp;Linux<br>/dev/cciss/c0d0p6 &nbsp; &nbsp; &nbsp; &nbsp; 10579 &nbsp; &nbsp; 10587 &nbsp; &nbsp; 36704 &nbsp; 83 &nbsp;Linux<br>/dev/cciss/c0d0p7 &nbsp; &nbsp; &nbsp; &nbsp; 10588 &nbsp; &nbsp; 10596 &nbsp; &nbsp; 36704 &nbsp; 83 &nbsp;Linux<br>
/dev/cciss/c0d0p8 &nbsp; &nbsp; &nbsp; &nbsp; 10597 &nbsp; &nbsp; 10725 &nbsp; &nbsp;526304 &nbsp; 83 &nbsp;Linux<br>/dev/cciss/c0d0p9 &nbsp; &nbsp; &nbsp; &nbsp; 10726 &nbsp; &nbsp; 10988 &nbsp; 1073024 &nbsp; 83 &nbsp;Linux<br>/dev/cciss/c0d0p10 &nbsp; &nbsp; &nbsp; &nbsp;10989 &nbsp; &nbsp; 11251 &nbsp; 1073024 &nbsp; 83 &nbsp;Linux<br>/dev/cciss/c0d0p11 &nbsp; &nbsp; &nbsp; &nbsp;11252 &nbsp; &nbsp; 11776 &nbsp; 2141984 &nbsp; 83 &nbsp;Linux<br>
/dev/cciss/c0d0p12 &nbsp; &nbsp; &nbsp; &nbsp;11777 &nbsp; &nbsp; 12301 &nbsp; 2141984 &nbsp; 83 &nbsp;Linux<br>/dev/cciss/c0d0p13 &nbsp; &nbsp; &nbsp; &nbsp;12302 &nbsp; &nbsp; 12826 &nbsp; 2141984 &nbsp; 83 &nbsp;Linux<br>/dev/cciss/c0d0p14 &nbsp; &nbsp; &nbsp; &nbsp;12827 &nbsp; &nbsp; 13351 &nbsp; 2141984 &nbsp; 83 &nbsp;Linux<br>/dev/cciss/c0d0p15 &nbsp; &nbsp; &nbsp; &nbsp;13352 &nbsp; &nbsp; 13876 &nbsp; 2141984 &nbsp; 83 &nbsp;Linux<br>
</div>/dev/cciss/c0d0p16 &nbsp; &nbsp; &nbsp; &nbsp;13877 &nbsp; &nbsp; 34866 &nbsp;85639184 &nbsp; 8e &nbsp;Linux LVM<br><br>When a pvcreate is attempted on &quot;/dev/cciss/c0d0p16&quot; it produces the below output.<br><br>[root@lwlsvr informix]# pvcreate /dev/cciss/c0d0p16<br>
pvcreate -- can&#39;t open physical volume &quot;/dev/cciss/c0d0p16&quot; to get its size<br><br><br>pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help]<br> &nbsp; &nbsp; &nbsp; &nbsp;[-s|--size PhysicalVolumeSize[kKmMgGtT]] [-y|--yes] [-v|--verbose]<br>
 &nbsp; &nbsp; &nbsp; &nbsp;[--version] PhysicalVolume [PhysicalVolume...]<br><br>Highly appreciate any help...<br><br>Thanks.<br>-- <br>Yajith Ajantha

------=_Part_21371_17744412.1202890392916--
