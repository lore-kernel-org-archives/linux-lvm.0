Message-ID: <6D51028899FFD111A95500805FA7465708B5395B@sbkmxsmb04>
From: "Caballero, Diana" <Diana.Caballero@dowjones.com>
MIME-Version: 1.0
Subject: [linux-lvm] Problems restoring the vg metadata
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
Date: Wed May 22 17:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'Linux-LVM@Sistina.com'" <Linux-LVM@Sistina.com>

Hi,

I'm running SuSe Linux 7 (Server Edition for an S/390) kernel 2.4.7 as an
image on an IBM Mainframe. I was provided additional disks (dasd) to
configure into LVM. I added these new disks into LVM but I did not create a
file system on them. While trying to add other disks from the mainframe into
Linux, I accidentally fragged one of the new disks (with no file system) in
one of my volume groups which caused all of the volume group to become
corrupted and go down. I was able to restore the volume group metadata once
and then when I rebooted, I got an error stating that group no longer
existed. Is there a step I am missing?

This is what I did the first time when it worked:

vgcfgrestore -f /etc/lvmconf/oradg.conf -n oradg /dev/dasdg1
vgck oradg
vgscan (I can't remember the error it gave back)
fsck -t ext2 /dev/oradg/ora01 (Repeated this for the other mounted file
systems)
mount /dev/oradg/ora01 (Repeated this for the other mounted file systems and
I verified the data in there and that I could create/delete data)

I rebooted and it stated it could not find oradg in the /etc/lvmtab

I checked the lvmtab and it no longer had the entry for this oradg group. 

I was able to boot up the system without the oradg group and then I
proceeded to do the following:

vgcfgrestore -f /etc/lvmconf/oradg.conf -n oradg /dev/dasdg1
vgck oradg
vgscan (An error reported lvmtab and the kernel do not match)
vgchange -a oradg
vgscan (An error reported lvmtab and the kernel do not match)

I rebooted the image without this group to start fresh and then I did:

vgcfgrestore -f /etc/lvmconf/oradg.conf -n oradg /dev/dasdg1
vgck oradg

Am I missing a step or doing something incorrectly?

Please advise.

Diana G. Caballero
Systems Administration Consultant
DJ Interactive/Factiva.com
http://djinteractive.com
http://global.factiva.com
email:  diana.caballero@dowjones.com
Phone:  609-520-7882
