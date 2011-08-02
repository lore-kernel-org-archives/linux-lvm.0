Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p72BJ7Zu029152
	for <linux-lvm@redhat.com>; Tue, 2 Aug 2011 07:19:07 -0400
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p72BJ6ru024096
	for <linux-lvm@redhat.com>; Tue, 2 Aug 2011 07:19:06 -0400
Received: by gwaa12 with SMTP id a12so2555940gwa.33
	for <linux-lvm@redhat.com>; Tue, 02 Aug 2011 04:19:06 -0700 (PDT)
MIME-Version: 1.0
From: harshad shirwadkar <harshadshirwadkar@gmail.com>
Date: Tue, 2 Aug 2011 16:48:46 +0530
Message-ID: <CAD+ocbwx0g8ESJxiX3eAz3bymsOAX_DHi_bN3uaMr9YdK=eoKA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=20cf303dd4fa73331504a983ea2c
Subject: [linux-lvm] Association between snapshot and origin volume
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

--20cf303dd4fa73331504a983ea2c
Content-Type: text/plain; charset=ISO-8859-1

Hello everybody,

I'm working on a project of 'reverting to a snapshot' feature in ext4
filesystem. (ext4dev_restore tool)
https://github.com/harshadshirwadkar/ext4-snapshot-revert

For that purpose, I'm making use of LVM. I have exported ext4 snapshot to
lvm persistent snapshot store format. Now somehow, I need to associate it
with the origin volume. So that lvm can merge it into the origin volume
(lvconvert --merge).

So the ext4dev_restore tool can be used like this:

1) Take snapshot using snapshot take command in ext4 file system.
2) Export the created ext4 snapshot to lvm persistant snapshot format.
# ext4dev_restore <snapshot_file> lvmexport
3) Associate the exported snapshot as the snapshot of origin volume.
4) #lvconvert --merge <exported_snapshot>

Can you help me to find out a way to make above mentioned association (in
step 3) ?

Thanks,
Harshad,

--20cf303dd4fa73331504a983ea2c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello everybody,<br><br>I&#39;m working on a project of &#39;reverting to a=
 snapshot&#39; feature in ext4 filesystem. (ext4dev_restore tool)<br><a hre=
f=3D"https://github.com/harshadshirwadkar/ext4-snapshot-revert">https://git=
hub.com/harshadshirwadkar/ext4-snapshot-revert</a><br>

<br>For that purpose, I&#39;m making use of LVM. I have exported ext4 snaps=
hot to lvm persistent snapshot store format. Now somehow, I need to associa=
te it with the origin volume. So that lvm can merge it into the origin volu=
me (lvconvert --merge).<br>

<br>So the ext4dev_restore tool can be used like this:<br><br>1) Take snaps=
hot using snapshot take command in ext4 file system.<br>2) Export the creat=
ed ext4 snapshot to lvm persistant snapshot format.<br># ext4dev_restore &l=
t;snapshot_file&gt; lvmexport<br>

3) Associate the exported snapshot as the snapshot of origin volume.<br>4) =
#lvconvert --merge &lt;exported_snapshot&gt;<br><br>Can you help me to find=
 out a way to make above mentioned association (in step 3) ?<br><br>Thanks,=
<br>

Harshad,<br>

--20cf303dd4fa73331504a983ea2c--
