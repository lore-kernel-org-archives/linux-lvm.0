Message-ID: <3FF6CADE.5020601@foulplay.org>
From: Avijit Pathania <foulplay@foulplay.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Growing raid5 md pv
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
Date: Sat Jan  3 08:01:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi.

Using LVM 1.0.8, kernel 2.4.23 and mdadm 1.4 on i386. There is a raid5 
device under LVM's control that needs to have another disk added to it.

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md0" of VG "dg" [111.75 GB / 4.31 GB free]
pvscan -- total: 1 [111.80 GB] / in use: 1 [111.80 GB] / in no VG: 0 [0]

A new disk will be added to the above /dev/md0 using mdadm --add.

What needs to be done on the LVM side for it to recognize the new size 
of the pv?

Any input will be appreciated.

Thanks
Avijit
