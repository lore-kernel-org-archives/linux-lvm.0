Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i183cja25256
	for <linux-lvm@redhat.com>; Sat, 7 Feb 2004 22:38:45 -0500
From: "David Rohrer" <rohredd@hotmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="----=_NextPart_000_0005_01C3EDCB.079C65A0"
Message-ID: <BAY2-DAV58T0apMHi0S00001227@hotmail.com>
Subject: [linux-lvm]LVM Problems
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
Date: Sun Feb  8 17:50:18 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format...

------=_NextPart_000_0005_01C3EDCB.079C65A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I had set up a Red Hat 9.0 Box with no xwindows on it just mainly the basic=
 install.
The /boot, / , and swap are all on HDA....then on HDG and HDH I set up a LV=
M during the install.

After I filled the drives in the LVM with data I tried to add to more drive=
s to it they were HDC and HDD.
 I'm not the best at this, so I was reading how on the interent...I first t=
ried to just do vgextend and it would error, so i done a pvcreate for each =
drive and then done a vgextend then I rebooted, I never did a change. so no=
w when it boots it errors out trying to mount the volume and I would have t=
o go into maintenance and edit the fstab and comment out the volume so it w=
ill boot

This is what I get when I do a pvscan:
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "Volume00" (=
run vgscan)
pvscan -- inactive PV "/dev/hdh1"  is associated to unknown VG "Volume00" (=
run vgscan)
pvscan -- total: 2 [38.03 GB] / in use: 2 [38.03 GB] / in no VG: 0 [0]

And this is what I get from a vgscan:
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "Volume00" (=
run vgscan)
pvscan -- inactive PV "/dev/hdh1"  is associated to unknown VG "Volume00" (=
run vgscan)
pvscan -- total: 2 [38.03 GB] / in use: 2 [38.03 GB] / in no VG: 0 [0]


I can send you a vgscan -d if you like but it is quite long, I have data on=
 the volume and would like to fix it, is there a way to fallback to how it =
was before I tried to add the other 2 hard drives? And if so how do I add t=
he new ones properly?

Thank You
Dio
There are 3 types of people in the world
Those who can count
and thos who can't

------=_NextPart_000_0005_01C3EDCB.079C65A0--
