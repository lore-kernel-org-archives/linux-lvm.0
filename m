From: Bradley M Alexander <storm@tux.org>
Message-ID: <20011115020138.J1585@sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Restricted partitions?
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
Date: Thu Nov 15 01:00:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello all,

Are there any partitions/filesystems that should not be used without an
initrd besides /? Here is my partition list:

/dev/hda3              1542188   1056676    485512  69% /
/dev/hda1                 7746      3499      3847  48% /boot
/dev/hda5              1517920    724696    762384  49% /var
/dev/hda6               155545        41    147474   1% /tmp
/dev/hda7              1028092    876116    151976  86% /home
/dev/hda8              1542156    967744    574412  63% /usr/local
/dev/hda9               514028    286816    227212  56% /opt
/dev/hda10             8192832   7117692   1075140  87% /mirror
/dev/hda11            15213032  13261916   1951116  88% /archive

As you can see, /home, /mirror and /archive are starting to get close to
having a problem, which I why I wanted to implement lvm. I have two 30GB
drives, the secomd of which is empty, so I was going to put /var, /tmp,
/home, /usr/local, /opt, /mirror and /archive on a volgroup on the second
drive, then once it stabilized, create a second volgroup on /dev/hda from
the partitions that are now on the volgroup on hdb.

I went in, using 1.0.1rc4 and kernel 2.4.13 and created the partitions on
the volume group on hdb. Ran lilo and changed fstab. Rebooted and it could
not mount the volumes, and gave me a "Can't locate module /dev/vg01" and
for each partition, it tries to load them as modules. The LVM code is
compiled into the kernel.

At this point, I have two prime suspects. Either one of the partitions I am
trying to mount on the volume group should not be without an initrd (/tmp
or /var?) or its a problematic interaction with devfs. Can anyone point me
to a solution?

Regards,
-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm@debian.org
                                         |   storm@tux.org
============================================================================
No, just _a_ Zaphod Beeblebrox. Didn't you hear? I come in six-packs."
