From: "James B. Byrne " <ByrneJB@Harte-Lyne.ca>
MIME-Version: 1.0
Message-ID: <3CF4C4D4.13851.A9276BF@localhost>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] LVM 1.03 root file system on Redhat 7.3
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
Date: Wed May 29 11:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

We are using the grub bootloader.  We have followed the 
instructions contained in the the lvm howto document provided by 
sistina, to the best of my ability to understand them.

The problem is that system gives a kernel panic when started using 
the lvm boot option.  Is there a way to redirect the boot dialogue 
output to a file?  It appears that the most informative messages may 
be scrolling of the top of the screen.  What I am seeing is this:

kmod: failed to exec /sbin/modeprobe -s -k block-major-7 errno = 2 

repeated 16 times, followed by

vgvchange -- volume group "vg00" successfully activated

VFS: Cannot open root device "vg00"/lv01: or 00:00
Please append correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 00:00

Help?

Regards,
Jim
---     e-mail is NOT a secure channel 
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3
