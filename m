Message-ID: <3D878E26.6050205@jumpline.com>
From: Ben Snyder <ben@jumpline.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cannot mount logical volume on boot
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
Date: Tue Sep 17 15:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

OK, this has me stumped.  My server isnt mounting the logical volume on 
boot time, in fact booting fails.  I've had to hardlink /dev/vg/lv to 
/dev/sdz1 because some of the software I use does some assinine tests of 
the /etc/fstab and checks mount points etc and /dev/vg/lv is 'too long' 
according to the vendor.  The software in question works fine with the 
hardlink, but LVM is ticked at me for some reason.

In my /etc/rc.d/rc.sysinit, right before the script calls for a mount of 
local file systems, there's segment like so:
if [ -x /sbin/vgscan ]; then
        action "Installing LVM module" /sbin/modprobe lvm-mod #this line 
added by me
        action "Initializing LVM" /sbin/vgscan
        action "Activating volumn groups" /sbin/vgchange
fi


I added the modprobe, because I was seeing messages when vgscan ran like 
'module not loaded?'.

OK, now on to the meat of my problem.  If I comment out the filesystem 
in /etc/fstab, everything is fine (except my software).  I log in, the 
lvm module is loaded, the volume group is active and ready for use and I 
can mount it up no problem.  If I uncomment that line and reboot, 
everything fails and I get to the single-user mode root password prompt. 
  Enter root's passwd, comment the line in /etc/fstab, logout/reboot and 
everything is fine (except the FS isnt mounted).

I cant really put the mount in rc.local or anything like that, as the 
above mentioned 3rd party software requires the filesystem to be mounted 
when it tries to start (which is managed through standard start scripts).

System details:
RedHat 6.2 running kernel 2.2.19-6.2.16
The LVM spans 2 7200RPM Seagate Cheetah SCSI drives(identical)

Thanks in advance for answer/feedback.
