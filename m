From: "B. J. Zolp" <bjzolp@wisc.edu>
Message-id: <200305141041.37355.bjzolp@wisc.edu>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-disposition: inline
Subject: [linux-lvm] Drive failure
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
Date: Wed May 14 10:41:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

One of the drives in my volume group is developing bad sectors on it.  When I 
mount the logical volume spanning that drive my entire machine locks up.  
Should I be able to dd (without reading the bad sectors) the failing drive 
(assuming it spins up and reads all the good sectors) to the replacement 
drive, then run fsck on the unmounted volume and then mount the volume with 
minimal data loss?

The other option I can think of is remove that drive from the volume and then 
remount it, but that would mean a loss of everything that is one the failing 
drive, plus I am not sure how reiserfs works with large chunks of its file 
system removed like that.


thanks

bjz
