From: Markus Schiltknecht <markus@bluegap.ch>
Message-Id: <1053561043.12809.166.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Doubled PV
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
Date: Wed May 21 18:51:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello everybody

I just read that it's not recommended to run LVM on top of Softraid
devices. Why is that? Looks like a perfect combination to me.

However. Recently two (?!?) disks of a RAID5 device got bad sectors. The
RAID array stopped immediately. Recreating the RAID with 'mkraid -R', I
could save most of its data. I did move it away with 'pvmove'.

Then - only 10 PE remaining on the bad PV - I decided to use 'pvmove -i'
to remove those faulty PE's. That worked. But now my VG is in a silly
state: because 'pvmove' touched the bad sectors, the RAID shut down,
i.e. the whole PV (/dev/md/20) was no longer writeable nor readable. So
pvmove couldn't write to /dev/md/20, not even LVM metadata in an intact
area.

Now /dev/md/20 is still registered as part of myVG. Aktivating it again
with 'mkraid -R /dev/md20' I can pvdisplay on it and all metadata seems
okay, but like before the 'pvmove -i'. Those 10 LE's are still on there.

'vgscan -v' outputs the following, somewhat silly message:

vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "myVG" from physical volume(s)
vgscan -- only found 6561 of 6551 LEs for LV /dev/myVG/data (2)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "myVG" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group


That's exactly 10 LEs too much!

I don't mind too much about the data in those 10 LEs. But I would like
to be able to activate myVG again!

How can I tell it, to forget about /dev/md/20? Do I have to use LVM2
tools? I've read through the mailing list, but didn't find the proper
tool / command.

Thanks for your help

Markus
