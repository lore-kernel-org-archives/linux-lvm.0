Return-Path: <498fbd26599115c750cccb626b7d5622@interlinx.bc.ca>
Date: Mon, 4 Jun 2001 01:07:50 -0700
Message-ID: <20010604010750.A2560@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
Subject: [linux-lvm] LILO configuration for LVM "boot" filesystem
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I know this is starting to become a LILO issue but I think that the
problem I have is really got to do with LILO and it's interacting with
LVM.  I have applied Andreas' patch, thanks Andreas.

When I try to boot with the LVM disk I get "LI" and that is it.  The
LILO docs say this about "LI":

This means the first-stage loader gained control; it thought it success-
fully loaded the second-stage loader; but it never got there.  This most
often occurs when the second-stage loader, '/boot/boot.b', is not load-
able using the BIOS.

Which would suggest to me that the mapping is not making it through
LVM correct me.  But I don't really know that much about how LILO
really works with the underlying device.

My current lilo.conf is:

boot=/dev/hdg
map=/boot/map
install=/boot/boot.b
vga=780
default=linux
keytable=/boot/us.klt
lba32
prompt
timeout=50
message=/boot/message

image=/boot/vmlinuz
    label=linux
    root=/dev/system/root
    initrd=/boot/initrd-lvm-2.4.5-1.1mdk.gz
    append=" hda=ide-scsi devfs=mount video=matrox:vesa:263"
    read-only

Anyone got any ideas or run into this before?

b.

-- 
Brian J. Murrell
