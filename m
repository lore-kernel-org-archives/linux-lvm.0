From: Erik Rask <erik@strakt.com>
Message-ID: <Pine.LNX.4.21.0309090835570.2466-100000@rife.strakt.com>
MIME-Version: 1.0
Subject: [linux-lvm] Moving disks
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
Date: Tue Sep  9 01:43:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello all! I am running LVM (1.0.7-5 according to the Debian package
list) on two Debian/Sid machines, that act as servers. I have now set up
an intermediate backup system, with external SCSI disks in separate
cabinets mirrored each night, to have a quick access backup in case of
disk failure. These external disks, as well as the internal ones (apart
from the root partition) are LVM. My question now is this: 
Would it be possible to take one of those drives and connect it to another
LVM capable host, and have it recognize the LV's on the disk? I am not
sure of how much of the VG/LV information is stored on the disk, so I have
not tried this. 
RTFM's are fine, if you could include pointers to the FM's, since I have
had problems digging this up. 
TIA
/Erik.
-- 
Erik Rask, systems administrator @ AB Strakt
"There is no normal life. There's just life. So get on with it."
