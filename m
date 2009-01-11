Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0B4lQrc025852
	for <linux-lvm@redhat.com>; Sat, 10 Jan 2009 23:47:26 -0500
Received: from blu0-omc3-s20.blu0.hotmail.com (blu0-omc3-s20.blu0.hotmail.com
	[65.55.116.95])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0B4l7A3016642
	for <linux-lvm@redhat.com>; Sat, 10 Jan 2009 23:47:07 -0500
Message-ID: <BLU129-W51AB60F7B4AC377D19C556CADB0@phx.gbl>
From: Jack Tanner <ihok@hotmail.com>
Date: Sat, 10 Jan 2009 23:47:06 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] recovery help needed
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


(This is all on Fedora 10.) I recently added a new pair of DM-mirrored driv=
es to lvm. I wanted to retire the old drives, and so I moved the extents co=
ntaining /home from the old /dev/md0 to the new /dev/md1. All went fine. Th=
en, I blew away /home on the new /dev/md1. Oops.

I ran /usr/bin/testdisk, and it can see my data on the old /dev/md0. Of cou=
rse, /dev/md0 is no longer recognized by LVM as having an lv since I moved =
those extents. Is there some way that I can tell LVM to magically recognize=
 the lv on /dev/md0 again?

Thanks in advance.

_________________________________________________________________
Windows Live=EF=BF=BD: Keep your life in sync.=20
http://windowslive.com/howitworks?ocid=3DTXT_TAGLM_WL_t1_allup_howitworks_0=
12009
