From: Sven Falk <lvm@bailong.de>
Message-ID: <20030127182006.GA6523@zeus.bailong.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] recover LVM system
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
Date: Mon Jan 27 12:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

seems I can't mount my LVM anymore, here are the details:

I created a logical volume called data containing the partitions hda5
and hdb5 on Suse 8.0. Here is the output from:

zeus:/home/bailong # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda5" of VG "system" [50.98 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb5" of VG "system" [57.26 GB / 40 MB
free]
pvscan -- total: 2 [108.26 GB] / in use: 2 [108.26 GB] / in no VG: 0
[0]

zeus:/home/bailong # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "system"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your
volume group

zeus:/home/bailong # lvscan
lvscan -- ACTIVE            "/dev/system/data" [108.20 GB]
lvscan -- 1 logical volumes with 108.20 GB total in 1 volume group
lvscan -- 1 active logical volumes

Actually I can't mount the /dev/system/data anymore :-(

Cheers
Sven
