Message-ID: <3560BA143F45D5118E670000E82459214C20F8@ssk.schneiderkenzingen.de>
From: "Koch, Steffen" <steffen.koch@sphinx-electronics.de>
Subject: RE: [linux-lvm] HELP! 'can't get data of volume group "vg01" from
	 physical volume(s)'
MIME-Version: 1.0
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
Date: Thu Jun 26 03:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> I had two PVs, hdc (whole disk) and hda4 (partition), in VG vg01. This
> VG contains one LV called 'home'.
> 
> I wanted to add a 120G disk, hdb,  so I did 'pvcreate /dev/hdb'. After
> some discusssion it was decided that we did not want to give the whole
> disk to LVM, so I partitioned the disk (thinking that the PV 
> structures
> would be overwritten that way) and did 'pvcreate /dev/hdb4', the other
> three partitions being normal non-LVM partitions.
> 
> Then we decided to change our file system to ReiserFS so I 
> added hdb4 to
> the vg01 group, created a LV "newhome" inside (spanning the hdb4
> partition), formatted this LV with REiserfs, and copied 
> everything from
> the (still mounted) 'home' LV over.
> 
> Then I rebooted.
did you reboot to update your partition table BEFORE creating your PVs??
