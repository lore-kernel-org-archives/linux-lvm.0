Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n03GtxHq025380
	for <linux-lvm@redhat.com>; Sat, 3 Jan 2009 11:55:59 -0500
Received: from mail-bw0-f20.google.com (mail-bw0-f20.google.com
	[209.85.218.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n03GtdOr020686
	for <linux-lvm@redhat.com>; Sat, 3 Jan 2009 11:55:39 -0500
Received: by bwz13 with SMTP id 13so18495018bwz.3
	for <linux-lvm@redhat.com>; Sat, 03 Jan 2009 08:55:38 -0800 (PST)
Message-ID: <b08d3e870901030855i7d8f7d25x4dee43a6fc93a397@mail.gmail.com>
Date: Sat, 3 Jan 2009 17:55:37 +0100
From: "Markus Baertschi" <markus@markus.org>
Sender: markus.baertschi@gmail.com
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM mapper and device names
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

I'm confused on how to navigate forth and back between
the /dev entries of lv's and what dm makes of it.

If I craeate a lv 'work' in my vg 'datavg' I'll get a /dev
entry /dev/datavg/work to work with (mount/mkfs, etc).
But after mounting a 'mount' shows the same lv as
/dev/mapper/datavg-work.

Example:
root@altair:~# lvdisplay /dev/datavg/work
  --- Logical volume ---
  LV Name                /dev/datavg/work
...
root@altair:~# mount /dev/datavg/work /work
root@altair:~# mount | grep work
/dev/mapper/datavg-work on /work type jfs (rw)

When I now have a mounted filesystem, how can I
determine reliably which is the original lv I've used ?
Do I have to dissect what 'mount' shows or is there
an official way to do it ?

Markus
--=20
  Markus Baertschi             Phone: ++41 (21) 807 1677
  Bas du Ross=C3=A9 16             Fax  : ++41 (21) 807 1678
  CH-1163, Etoy                Email: markus@markus.org
  Switzerland                  Homepage: www.markus.org
