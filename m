From: Alexander Elbs <alex@m406a.hadiko.de>
Message-ID: <Pine.LNX.4.44.0206280905050.780-100000@m406a.hadiko.de>
MIME-Version: 1.0
Subject: [linux-lvm] old metadata
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
Date: Fri Jun 28 02:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@sistina.com

hi,

is it somehow possible to update the metadata without doing the according
changes to the rest of the disk?

Because:

I currently have a VG containing 3 PV's. This worked fine, since
yesterday. Now for some odd reason vgscan doesn't work:

vgscan -- reading data of volume group "data" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume
group "data" from physical volume(s)

looking at the metadata (with pvdata, vgcfgrestore -l ) it looks like that
every version of the metadata I have describes a configuration with 4
PV's. I had this config, but several months ago!
A few months ago I added a new disk, did a pvmove and removed a old disk.
So temporarly there were 4 disks in my VG.

One way to fix my problem could be, that i somehow fake a pvmove. so only
the metadata is updated. Then I would have a newer version of my metadata
that hopefully reflect my real vg. But I also would have to fake the 4th
disk to get vgscan working.

So is there a metadata editor or something like that? Or do I have to
hexedit my disk?

Ciao
Alex

-- 
Alexander Elbs  ***  eMail Alexander.Elbs@hadiko.de
