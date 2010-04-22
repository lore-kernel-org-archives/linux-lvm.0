Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3M5ANd5021555
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2010 01:10:23 -0400
Received: from web7907.mail.in.yahoo.com (web7907.mail.in.yahoo.com
	[202.86.4.83])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o3M5AAGh001694
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2010 01:10:12 -0400
Message-ID: <53452.77932.qm@web7907.mail.in.yahoo.com>
Date: Thu, 22 Apr 2010 10:40:09 +0530 (IST)
From: andiket a <truly_linux@yahoo.co.in>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-623300658-1271913009=:77932"
Subject: [linux-lvm] read-only snapshots and data corruption
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

--0-623300658-1271913009=:77932
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to a read-only snapshot using lvcreate. After I mount the snaps=
hot volume I see a data corruption.
The test case is described below:
1. Create a volume using lvcreate of size 1G and format this volume with ex=
t3 filesystem.

lvcreate --size 1G -n my_lv my_vg

2. Mount the volume to a folder /mnt/temp and create a file try.txt on the =
volume. Dump random data inside this file (try.txt) of size around 50K (siz=
e of data is immaterial still preferably keep it well over a few tens of kb=
s).

mount /dev/my_vg/my_lg /mnt/temp

3. Take a snapshot.

lvcreate --snapshot --size 100M -c 16 -n my_snap -p r /dev/my_vg/my_lv

4. Now modify the file /mnt/temp/try.txt (on original volume).

5. Take second snapshot.

lvcreate --snapshot --size 100M -c 16 -n my_snap2 -p r /dev/my_vg/my_lv
=0A
6. Again modify the file /mnt/temp/try.txt (on original volume).
=0A
75. Take third snapshot.
=0A
=0Alvcreate --snapshot --size 100M -c 16 -n my_snap3 -p r /dev/my_vg/my_lv
=0A=0A
8. Mount all of the snapshots and check contents of the file try.txt in eac=
h of the snpashots.

The data in snapshots is most of the time of incosistent or doesn't match a=
t all with the data expected in the snapshot volume. Conent of the entire f=
ile is different though size of the file remains exactly what it should be.

After a couple of debugging sessiosn I figured out that when I am trying to=
 the snapshot device, it is reading data always from the cowstore. This is =
true even when reading data from sectors/blocks which were not modified aft=
er taking snapshots.

NOTE: This works perfectly fine with read-write snapshots.

Is this a know issue with lvm2 readonly snapshots?

Thanks in advance.

Andiket.
=0A=0A
--0-623300658-1271913009=:77932
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">Hi,<br><br>I am trying to a read-only snapsho=
t using lvcreate. After I mount the snapshot volume I see a data corruption=
.<br>The test case is described below:<br>1. Create a volume using lvcreate=
 of size 1G and format this volume with ext3 filesystem.<br><br>lvcreate --=
size 1G -n my_lv my_vg<br><br>2. Mount the volume to a folder /mnt/temp and=
 create a file try.txt on the volume. Dump random data inside this file (tr=
y.txt) of size around 50K (size of data is immaterial still preferably keep=
 it well over a few tens of kbs).<br><br>mount /dev/my_vg/my_lg /mnt/temp<b=
r><br>3. Take a snapshot.<br><br>lvcreate --snapshot --size 100M -c 16 -n m=
y_snap -p r /dev/my_vg/my_lv<br><br>4. Now modify the file /mnt/temp/try.tx=
t (on original volume).<br><br>5. Take second snapshot.<br><br>lvcreate --s=
napshot --size 100M -c 16 -n my_snap2 -p r /dev/my_vg/my_lv<br>=0A<br>6. Ag=
ain modify the file /mnt/temp/try.txt (on original volume).<br>=0A<br>75. T=
ake third snapshot.<br>=0A<br>=0Alvcreate --snapshot --size 100M -c 16 -n m=
y_snap3 -p r /dev/my_vg/my_lv<br>=0A=0A<br>8. Mount all of the snapshots an=
d check contents of the file try.txt in each of the snpashots.<br><br>The d=
ata in snapshots is most of the time of incosistent or doesn't match at all=
 with the data expected in the snapshot volume. Conent of the entire file i=
s different though size of the file remains exactly what it should be.<br><=
br>After a couple of debugging sessiosn I figured out that when I am trying=
 to the snapshot device, it is reading data always from the cowstore. This =
is true even when reading data from sectors/blocks which were not modified =
after taking snapshots.<br><br>NOTE: This works perfectly fine with read-wr=
ite snapshots.<br><br>Is this a know issue with lvm2 readonly snapshots?<br=
><br>Thanks in advance.<br><br>Andiket.<br></td></tr></table><br>
--0-623300658-1271913009=:77932--
