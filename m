Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1DBLti08552
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 06:21:55 -0500
Received: from mail.behrgroup.com (mail.behrgroup.com [194.99.122.162])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1DBLsb08786
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 06:21:55 -0500
Received: from mh1.st.behr.de ([172.27.16.1])
 by mail.behrgroup.com (SAVSMTP 3.1.0.29) with SMTP id M2004021312223501788
 for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 12:22:35 +0100
Received: from stdoad02.st.behr.de (stdoad02.st.behr.de [172.27.15.12])
	by mh1.st.behr.de (8.11.6/8.11.6) with ESMTP id i1DBIXW05201
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 12:18:33 +0100
MIME-Version: 1.0
Message-ID: <OFD4D5146F.E5D627CD-ONC1256E39.0037D4CE-C1256E39.003E351F@st.behr.de>
From: "Andreas Reschke" <Andreas.Reschke@behrgroup.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Probs with lvm on large filesystem
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 09:12:10 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hello,
we want to use our Red Hat Enterprise ES 3.0 with lvm as a file server. 
The server is connected to a IBM Fast T 900 via qlogic2200 Fiber Channel. 
On the FastT I have created a partition with 295 GB.
Fdisk shows this partition as /dev/sda1 with 292,5 GB:

Output of fdisk:
fdisk -l

Platte /dev/sda: 292.5 GByte, 292555849728 Byte
255 K�pfe, 63 Sektoren/Spuren, 35567 Zylinder
Einheiten = Zylinder von 16065 * 512 = 8225280 Bytes

    Ger�t boot.  Anfang      Ende    Bl�cke   Id  Dateisystemtyp
/dev/sda1             1     35567 285691896   8e  Linux LVM

[root@fastlinux lvmgui-0.4]# pvcreate  /dev/sda1
pvcreate -- physical volume "/dev/sda1" successfully created

[root@fastlinux lvmgui-0.4]# vgcreate -s 8M vg_daten /dev/sda1
vgcreate -- INFO: maximum logical volume size is 511.98 Gigabyte
vgcreate -- doing automatic backup of volume group "vg_daten"
vgcreate -- volume group "vg_daten" successfully created and activated

[root@fastlinux lvmgui-0.4]#lvcreate -c 8k -L 292G -n lvo1 vg_daten
lvcreate -- only 34873 free physical extents in volume group "vg_daten"
[root@fastlinux lvmgui-0.4]# lvcreate -c 1024k -L 292G -n lvo1 vg_daten
lvcreate -- only 34873 free physical extents in volume group "vg_daten"

vgdisplay
--- Volume group ---
VG Name               vg_daten
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           511.98 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               272.45 GB
PE Size               8 MB
Total PE              34873
Alloc PE / Size       0 / 0
Free  PE / Size       34873 / 272.45 GB
VG UUID               OOjBLA-sHjN-LtHG-YRlE-JIRZ-miEk-m6S5vv

I have a volume group with maximum 511.98 Gigabyte and want to create a 
logical volume with 292 GB (greater than 266 GB), but lvcreate allow only 
34873 extents (= 266 BG).

Where is the resulotion?



Thanks
Andreas

-- 
BEHR GmbH & Co                          Tel. 0711-896-4598
Andreas Reschke                         Fax: 0711-8902-4598
Abteilung BG-IM23 IT-Services           Mobil: 0172-6307978
Unix/Linux-Administration               andreas.reschke@behrgroup.com
Siemensstrasse 164
D-70469 Stuttgart
