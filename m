From: Urs Thuermann <urs@isnogud.escape.de>
Message-Id: <m2heoivkr6.fsf@isnogud.escape.de>
Subject: [linux-lvm] LILO+LVM:  Fatal: This version of LVM does not support boot LVs
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
Date: Fri Feb 15 09:20:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I installed lilo-22.2 and moved my /boot from /dev/sda1 to my root FS
which is on LVM /dev/vg0/root.  When running lilo I get the message

    Fatal: This version of LVM does not support boot LVs

I checked the source code and found in geometry.c

    #define DIFF 255
    
    	    lbmA.lv_dev = lbmB.lv_dev = device;
    	    lbmA.lv_block = 0;
    	    lbmB.lv_block = DIFF;
    
    	    lvm_bmap(&lbmA);
    	    lvm_bmap(&lbmB);
    	    if (lbmB.lv_block - lbmA.lv_block != DIFF)
    		die("This version of LVM does not support boot LVs");
    

which is from Andreas' LILO patch.  lilo checks wether the logical
blocks 0 and 255 are also 255 apart from each other on the physical
device (assuming the device is the same).

This clearly works only on non-striped and contigous LVs (which is why
it doesn't work for me since /dev/vg0/root is striped).
I suppose this is intended, but why?  Would it be so difficult to let
the lilo loader load blocks from different devices and blocks which
are not in ascending order?  The 5-byte structure describing the
blocks to load contains the device: (from lilo/README):

     sector    [1..63] plus 2 high bits of Cylinder
     cylinder  [0..1023] low eight bits in this byte
     device    [0..3] for floppies, [0x80..0x8F] for hard disks
     head      [0..254] no, the max is 254, not 255
     count     [1...] number of sectors to transfer

So, why not support booting from striped and non-contiguos LVs?


urs
