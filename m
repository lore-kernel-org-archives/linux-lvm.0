Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2QHUpj13425
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 12:30:51 -0500
Received: from web13002.mail.yahoo.com (web13002.mail.yahoo.com
	[216.136.174.12])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2QHUn1X002838
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 12:30:50 -0500
Message-ID: <20040326173048.29942.qmail@web13002.mail.yahoo.com>
Date: Fri, 26 Mar 2004 09:30:48 -0800 (PST)
From: peter abplanalp <alderion1@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] lvm broken after os change
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

hi.  i just changed from redhat to debian and was
hoping that i would be able to use the lv's i had;
however, i am having a problem.  for some reason lvm
is having problems with one of my vg's.  i am hoping
that someone can help me get the data off of the
problematic lv.  i read a couple posts about a similar
issue but nothing about recovering the data was
mentioned.  thanks in advance for any and all help.

the following is the output of some commands:

pvscan:

#pvscan
pvscan -- reading all physical volumes (this may take
a while...)
pvscan -- inactive PV "/dev/hda3" of VG "vg00" [10.12
GB / 0 free]
pvscan -- inactive PV "/dev/hdb"   is associated to
unknown VG "vg01" (run vgscan)
pvscan -- inactive PV "/dev/hdd"   is associated to
unknown VG "vg01" (run vgscan)
pvscan -- inactive PV "/dev/hdd1"  is associated to
unknown VG "vg01" (run vgscan)
pvscan -- total: 4 [71.44 GB] / in use: 4 [71.44 GB] /
in no VG: 0 [0]

vgscan:

# vgscan
vgscan -- reading all physical volumes (this may take
a while...)
vgscan -- found inactive volume group "vg00"
vgscan -- ERROR "pv_read_all_pv_of_vg(): no PV" can't
get data of volume group "vg01" from physical
volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d"
successfully created
vgscan -- WARNING: This program does not do a VGDA
backup of your volume groups

lvscan:

# lvscan
lvscan -- volume group "vg00" is NOT active; try -D
lvscan -- no logical volumes found

other particulars:
lvm 1.0.8


__________________________________
Do you Yahoo!?
Yahoo! Finance Tax Center - File online. File on time.
http://taxes.yahoo.com/filing.html
