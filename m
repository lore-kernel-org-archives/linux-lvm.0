Message-ID: <1006347197.3bfba3bd23d95@imp.free.fr>
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Chicken and egg problem..
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
Date: Wed Nov 21 06:51:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello !
As I've previously said, I plan to make my RedHat 7.1 (kernel 2.4.5) a pure LVM 
machine.
To do so, I've build the 1.0.4 version of LVM into the kernel (with the NCR SCSI 
driver). As to avoid an initrd. Simple is beautifull...

In the sysinit rc script, Redhat has put a vg activation command, but....
My kernel panics, as it is unable to mount root, as the LVM activation commands 
are after the root fsck (and mount..)

If I put the LVM activation lines early, in the sysinit script, these commands 
complains beeing not able to access /etc/lvmtab....

So I'm face with a chicken and egg problem. Which one was first ?
Any idea ? It will be fun for me to have this configuration set up and running !
Regards
