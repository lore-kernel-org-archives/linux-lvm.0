From: "MrNatcho" <mrnatcho@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <E18bT4s-00050k-00@hermes.sistina.com>
Subject: [linux-lvm] vgscan fails after more or less successful pvmove
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
Date: Wed Jan 22 16:11:01 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Hi all,

I am having problems to access my LV after trying to move data off two PV's. Here's what I did before the 
error occured:

1. I freed up enough space and resize'd the ReiserFS partition
2. I reduced the LV using lvreduce, leaving approx. 100GB free space in the VG
3. I tried to free up a 80GB Disk in the VG using "pvmove /dev/hdc1" - this one failed after a dozen or so 
PE's giving an error message I unfortunately didn't put down
4. I tried to free up a 60GB Disk using the same command...to no avail - error after 20 or 30 PE's
5. I tried different parameters for pvmove: -i didn't help, addressing the PE's to be moved directly fails 
every few PE's. Putting in a destination device with enough free space didn't do any good, too. Finally, I 
managed to free up a whole device by addressing the LE's to be moved away from the device.
6. The PV then showed 0 allocated PE's, so I tried to remove the PV using vgreduce. That one failed 
saying that the device wasn't empty. At that point, I was totally confused and tried to find the cause using 
the display commands to see if I missed any vital information. At one point, I started vgscan to see that 
brings any more information. the output is as follows:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "ftpdata_vg"
vgscan -- only found 30458 of 29947 LEs for LV /dev/evil_vg/lvol1 (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group 
"evil_vg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

From searching the list archives I have seen that other people have had this problem before, but I have 
been unable to find a solution in the list archives.

Can anyone give me a hint what to try? Restoring the configuration didn't help, probably because the 
several pvmove's did fill the 9 .old config's with messed up data...

The box is a SuSE 8.0 with a vanilla 2.4.18 kernel and the LVM tools are version 1.0.3.

Any help is greatly appreciated.

Regards
Stefan
