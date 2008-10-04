Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9495kqH016131
	for <linux-lvm@redhat.com>; Sat, 4 Oct 2008 05:05:46 -0400
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m9495YSQ019478
	for <linux-lvm@redhat.com>; Sat, 4 Oct 2008 05:05:35 -0400
Content-Type: text/plain; charset="iso-8859-1"
Date: Sat, 04 Oct 2008 11:05:34 +0200
From: "Michael Schmarck" <michael.schmarck@habmalnefrage.de>
Message-ID: <20081004090534.227400@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Create Snapshot volume,
	with sized based on size of original lv
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

Hi.

I'd like to create a snapshot volume of eg. /dev/sys/Bilder and
call it /dev/sys/Bilder_snap. Bilder_snap should be 25% the size
of Bilder.

How would I do that?

In lvcreate --help, I find:

$ lvm lvcreate --help
[...]
lvcreate -s|--snapshot
[...]
	{-l|--extents LogicalExtentsNumber[%{VG|LV|PVS|FREE}] |
	 -L|--size LogicalVolumeSize[kKmMgGtTpPeE]}
[...]

$ lvm version
  WARNING: Running as a non-root user. Functionality may be unavailable.
  LVM version:     2.02.36 (2008-04-29)
  Library version: 1.02.24 (2007-12-20)
  /dev/mapper/control: open failed: Keine Berechtigung
  Failure to communicate with kernel device-mapper driver.

Based on the --help output, I tried:

$ sudo lvm lvcreate -s -l 25%LV -n Bilder_snap /dev/sys/Bilder
  Please express size as %VG, %PVS, or %FREE.

Did I do something wrong, or is the output "--help"
just wrong?

Thanks a lot,
Michael
--=20
Psssst! Schon vom neuen GMX MultiMessenger geh=EF=BF=BDrt? Der kann`s mit a=
llen: http://www.gmx.net/de/go/multimessenger
