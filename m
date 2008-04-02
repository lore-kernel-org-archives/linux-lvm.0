Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m32K27Fs017257
	for <linux-lvm@redhat.com>; Wed, 2 Apr 2008 16:02:07 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.191])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m32K1aov031784
	for <linux-lvm@redhat.com>; Wed, 2 Apr 2008 16:01:36 -0400
Received: by nf-out-0910.google.com with SMTP id g13so1242523nfb.21
	for <linux-lvm@redhat.com>; Wed, 02 Apr 2008 13:01:35 -0700 (PDT)
Message-ID: <676847c60804021301p35332980l2f80f52864f139ba@mail.gmail.com>
Date: Wed, 2 Apr 2008 15:01:35 -0500
From: "Koree A. Smith" <koreesmith@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1147_32901439.1207166495300"
Subject: [linux-lvm] UUID Issue
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

------=_Part_1147_32901439.1207166495300
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am having the same issue as this previous post to the lvm list, but cannot
find if anyone ever had a solution for it:

*Author: *Tommaso Cecchi
*Date: *2006-07-19 11:352006-07-19 16:35 -500UTC
*To: *LVM general discussion and development
*Old-Topics: *RE: [linux-lvm] "pvchange --uuid" failed when PV is in
use<http://archives.free.net.ph/message/20050524.063104.84b50c45.en.html>
*Subject: *[linux-lvm] duplicate PV
Hello everyone,
I have the following problem: I want to use a snapshot mechanism external to

LVM2 (i.e. snapshot from the storage server) so it happens that I access
from a
linux box two identical LUNs with the same PVID. It is not a matter of
multipathing, they just are completely different devices with the same
content
(and with the same PVID of course).

What I would like to do is to use and mount the second device on a different

mount point. So:

/dev/sdd1 is the primary PV
/dev/sdf1 is the snapshot of the primary PV

The result of pvscan before the discovery is:

drdb2:~ # pvscan
PV /dev/sde1 VG drrg2_vg lvm2 [200.00 GB / 0 free]
PV /dev/sdd1 VG test_vg lvm2 [200.00 GB / 0 free]
PV /dev/sdb1 VG oracledb_vg lvm2 [220.00 GB / 0 free]
PV /dev/sdc1 VG oracledb_vg lvm2 [20.00 GB / 0 free]
PV /dev/sda3 VG root_vg lvm2 [59.75 GB / 47.26 GB free]
Total: 5 [699.73 GB] / in use: 5 [699.73 GB] / in no VG: 0 [0 ]

after the discovery of the new device is:

drdb2:~ # pvscan
Found duplicate PV PnvnzL7YFft76Ky0EaPbOh519SQD5Uxc: using /dev/sdf1 not
/dev/sdd1
PV /dev/sde1 VG drrg2_vg lvm2 [200.00 GB / 0 free]
PV /dev/sdd1 VG test_vg lvm2 [200.00 GB / 0 free]
PV /dev/sdb1 VG oracledb_vg lvm2 [220.00 GB / 0 free]
PV /dev/sdc1 VG oracledb_vg lvm2 [20.00 GB / 0 free]
PV /dev/sda3 VG root_vg lvm2 [59.75 GB / 47.26 GB free]
Total: 5 [699.73 GB] / in use: 5 [699.73 GB] / in no VG: 0 [0 ]

I guess this problem is the same I'd have if I copy any single byte from a
device to another the last one resulting in having the same LVM label.

What I tried is to:

1) vgreduce:

drdb2:~ # vgreduce test_vg /dev/sdf1
Found duplicate PV PnvnzL7YFft76Ky0EaPbOh519SQD5Uxc: using /dev/sdf1 not
/dev/sdd1
Physical Volume "/dev/sdf1" not found in Volume Group "test_vg"

sdf1 does not belong to test_vg

2) pvchange --uuid:

drdb2:~ # pvchange --uuid /dev/sdf1
Found duplicate PV PnvnzL7YFft76Ky0EaPbOh519SQD5Uxc: using /dev/sdd1 not
/dev/sdf1
Volume group containing /dev/sdf1 has active logical volumes
0 physical volumes changed / 1 physical volume not changed

My idea was to modify the PVID so to let LVM understand they are completely
different devices.
How can I manage this?

Thanks for any help you may give me.
Tommaso

-- 
================================================================
|     Tommaso Cecchi                          CINECA
| System Management Group              Via Magnanelli 6/3 40033
| e-mail: t.cecchi@???             Casalecchio di Reno
| Tel: 051/6171411                         Bologna - ITALY
| Fax 051/6132198                       http://www.cineca.it
================================================================



_______________________________________________
linux-lvm mailing list

Any help is greatly appreciated.

Thanks!

Koree
linux-lvm@???
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
Koree A. Smith, RHCE
--
koreesmith@gmail.com
koree@ameth.org

------=_Part_1147_32901439.1207166495300
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am having the same issue as this previous post to the lvm list, but cannot find if anyone ever had a solution for it:<br><br><div><b>Author:&nbsp;</b>Tommaso Cecchi<br><b>Date:&nbsp;</b>2006-07-19&nbsp;11:35<noscript>2006-07-19 16:35</noscript>&nbsp;-500<noscript>UTC</noscript><br>
<b>To:&nbsp;</b>LVM general discussion and development<br><b>Old-Topics:&nbsp;</b><a href="http://archives.free.net.ph/message/20050524.063104.84b50c45.en.html">RE: [linux-lvm] &quot;pvchange --uuid&quot; failed when PV is in use</a><br>
<b>Subject:&nbsp;</b>[linux-lvm] duplicate PV<br></div>Hello everyone,
<br>I have the following problem: I want to use a snapshot mechanism external to
<br>LVM2 (i.e. snapshot from the storage server) so it happens that I access from a
<br>linux box two identical LUNs with the same PVID. It is not a matter of
<br>multipathing, they just are completely different devices with the same content
<br>(and with the same PVID of course).
<br>
<br>What I would like to do is to use and mount the second device on a different
<br>mount point. So:
<br>
<br>/dev/sdd1 is the primary PV
<br>/dev/sdf1 is the snapshot of the primary PV
<br>
<br>The result of pvscan before the discovery is:
<br>
<br>drdb2:~ # pvscan
<br>   PV /dev/sde1   VG drrg2_vg      lvm2 [200.00 GB / 0    free]
<br>   PV /dev/sdd1   VG test_vg       lvm2 [200.00 GB / 0    free]
<br>   PV /dev/sdb1   VG oracledb_vg   lvm2 [220.00 GB / 0    free]
<br>   PV /dev/sdc1   VG oracledb_vg   lvm2 [20.00 GB / 0    free]
<br>   PV /dev/sda3   VG root_vg       lvm2 [59.75 GB / 47.26 GB free]
<br>   Total: 5 [699.73 GB] / in use: 5 [699.73 GB] / in no VG: 0 [0   ]
<br>
<br>after the discovery of the new device is:
<br>
<br>drdb2:~ # pvscan
<br>   Found duplicate PV PnvnzL7YFft76Ky0EaPbOh519SQD5Uxc: using /dev/sdf1 not
<br>/dev/sdd1
<br>   PV /dev/sde1   VG drrg2_vg      lvm2 [200.00 GB / 0    free]
<br>   PV /dev/sdd1   VG test_vg       lvm2 [200.00 GB / 0    free]
<br>   PV /dev/sdb1   VG oracledb_vg   lvm2 [220.00 GB / 0    free]
<br>   PV /dev/sdc1   VG oracledb_vg   lvm2 [20.00 GB / 0    free]
<br>   PV /dev/sda3   VG root_vg       lvm2 [59.75 GB / 47.26 GB free]
<br>   Total: 5 [699.73 GB] / in use: 5 [699.73 GB] / in no VG: 0 [0   ]
<br>
<br>I guess this problem is the same I&#39;d have if I copy any single byte from a 
<br>device to another the last one resulting in having the same LVM label.
<br>
<br>What I tried is to:
<br>
<br>1) vgreduce:
<br>
<br>drdb2:~ # vgreduce test_vg /dev/sdf1
<br>   Found duplicate PV PnvnzL7YFft76Ky0EaPbOh519SQD5Uxc: using /dev/sdf1 not
<br>/dev/sdd1
<br>   Physical Volume &quot;/dev/sdf1&quot; not found in Volume Group &quot;test_vg&quot;
<br>
<br>sdf1 does not belong to test_vg
<br>
<br>2) pvchange --uuid:
<br>
<br>drdb2:~ # pvchange --uuid /dev/sdf1
<br>   Found duplicate PV PnvnzL7YFft76Ky0EaPbOh519SQD5Uxc: using /dev/sdd1 not
<br>/dev/sdf1
<br>   Volume group containing /dev/sdf1 has active logical volumes
<br>   0 physical volumes changed / 1 physical volume not changed
<br>
<br>My idea was to modify the PVID so to let LVM understand they are completely 
<br>different devices.
<br>How can I manage this?
<br>
<br>Thanks for any help you may give me.
<br>Tommaso
<br><br><pre class="art">-- <br>================================================================<br>|     Tommaso Cecchi                          CINECA<br>| System Management Group              Via Magnanelli 6/3 40033<br>
| e-mail: t.cecchi@???             Casalecchio di Reno<br>| Tel: 051/6171411                         Bologna - ITALY<br>| Fax 051/6132198                       <a class="url" href="http://www.cineca.it/">http://www.cineca.it</a><br>
================================================================</pre>
<br><br><pre class="art">_______________________________________________<br>linux-lvm mailing list<br><br>Any help is greatly appreciated.<br><br>Thanks!<br><br>Koree<br>linux-lvm@???<br><a class="url" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a class="url" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre><br clear="all"><br>-- <br>Koree A. Smith, RHCE<br>--<br><a href="mailto:koreesmith@gmail.com">koreesmith@gmail.com</a><br>
<a href="mailto:koree@ameth.org">koree@ameth.org</a>

------=_Part_1147_32901439.1207166495300--
