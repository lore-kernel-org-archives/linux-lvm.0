Message-Id: <200306250215.h5P2ExF8008008@socrates.catalyst.net.nz>
From: Steve Wray <stevew@catalyst.net.nz>
Subject: [linux-lvm] shuffling drives along the chain?
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
Date: Tue Jun 24 21:16:02 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have an existing LVM setup over 3 hard drives,
hda, hdc, hde, with PV's and VG's set up just so.

I wish to add a new drive as the new hda, shifting
the other drives down the chain such that the old hda
becomes the new hdb and so forth.

The new drive will have new VG's on its PV's with
no overlap; no PV on the new drive will be part
of any VG on the old drives.

Is it just a simple matter of doing the 
vgchange -an <volume group>, vgexport <volume group>, 
shutdown & move the drives, reboot, 
install Linux onto the new drive and then
pvscan, vgimport <volume group> <physical volumes>
dance?

Or are there any gotchas to be aware of?

Thanks!
