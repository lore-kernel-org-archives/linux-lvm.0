Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Date: Thu, 22 Mar 2001 16:56:47 -0500
MIME-Version: 1.0
Message-Id: <01032216564700.06908@oscar>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgscan ERROR
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I had a vg called lv setup with two full disk in it (hde1 40G, hdeg 4G)
In this there are four logical volumes:

swap - striped on hde and hdg
home_a - main disk
home_b - mirroed with raid 1
root - my reiserfs root file system.

Once I finish moving root to lvm and was able to get reiserfs snapshots work
I decided to add my old root partn to lvm.  So I did the following:

cfdisk /dev/hda and changed the type of hda3 to 8e and wrote the block.
pvcreate /dev/hda3
vgextend /dev/hda3 lv

now running vgscan gives me:

oscar# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "lv"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "lv" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"

I am using ac21 with the 090 debs off the sistima ftp site...

How do I fix this????

TIA
Ed Tomlinson

PS. all is not completly lost, my backup is still running... and I finially realized that
just because ide-tape refuses to read my tapes using st and ide-scsi works...
