From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Message-ID: <20031007125916.GA3999@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Migration to lvm on a new HDD
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
Date: Tue Oct  7 08:00:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I've a new HDD it is mounted as slave.
I plan to use it with LVM and use it as the master device.

Today, I boot linux from /dev/hda
The new disk has a linux /boot partition as /dev/hdb1 and a lvm  
partition as /dev/hdb2.

I've created the volume group called vg00 and the logical volumes I  
need (var, home, root...) on  /dev/hda2.

When I will move the disk from slave to master, it will change its  
partition name from hdb to hda but the devices in /dev (/dev/vg00/ 
something) are hosted by the old disk.

Do I've to copy the /dev/vg00 so well?

Do I've to edit something else than the /tc/fstab to have a bootable  
system on the new disk?

---
Regards
		- Jean-Luc
