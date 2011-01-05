Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p05Fkf7U013326
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 10:46:41 -0500
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p05FkS7P026584
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 10:46:29 -0500
Received: by gwj20 with SMTP id 20so6479597gwj.33
	for <linux-lvm@redhat.com>; Wed, 05 Jan 2011 07:46:28 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 5 Jan 2011 16:46:28 +0100
Message-ID: <AANLkTikWD6Yozmh_wkquSu3cD-wVS4pfnF=HfxC6Lrq9@mail.gmail.com>
From: Miro Moman <miromoman@gmail.com>
Content-Type: multipart/alternative; boundary=0016e650966cce51cd04991b49e2
Subject: [linux-lvm] Recovering pre-existing data after vgcreate
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

--0016e650966cce51cd04991b49e2
Content-Type: text/plain; charset=ISO-8859-1

Hello,

By mistake I have run pvcreate, vgcreate and lvcreate on an entire drive
with pre-existing data. Before it was a ext4-formatted drive with just one
partition spamming the entire drive and no lvm. I have not formatted it
after running lvcreate.

Would it be possible to recover the data or is it lost forever?

Best regards,

Miro

--0016e650966cce51cd04991b49e2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>By mistake I have run pvcreate, vgcreate and lvcreate on an e=
ntire drive with pre-existing data. Before it was a ext4-formatted drive wi=
th just one partition spamming the entire drive and no lvm. I have not form=
atted it after running lvcreate.<br>
<br>Would it be possible to recover the data or is it lost forever?<br><br>=
Best regards,<br><br>Miro<br><br>

--0016e650966cce51cd04991b49e2--
