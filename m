Message-Id: <200201171229.g0HCTVe10111@localhost.localdomain>
From: Miguel Angel de Vega <mvega@sgo.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Paralell IO performance with LVM and XFS
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
Date: Thu Jan 17 06:30:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi!

I've a Dual P2 450 with a Disk Array with 4 scsi disks with XFS.
With one single disc I've 10 Mb/s reading and writing, so I think that if I 
stripe all disc of the array, it can give me 4x10Mb = 40Mb/s more or less, 
but I only gets 10 Mg/s!!  
These disks usually gives up to 30 Mg/s in SGI machines and other single scsi 
disks in the Dual P2 (with the same controller and XFS) gives 20Mg/s, so i 
think that the problem must be LVM (the options maybe??? bad stripped 
options??). 

I show how mount all the Logical Volumen:

partionated all discs like 8e
#pvcreate /dev/sda1 ...
#vgcreate test /dev/sda1 /dev/sdb1 /dev/sdc1 /dev/sdd1
#lvcreate -n stripped -i 4 -I 64 test -L 30000M
(I tryed with -I 128, 256 and 512 but not big differences)

#mkfs -t xfs /dev/test/stripped  (only supports 4kb of block size)

what can be the problem??
thanks

Miguel Angel de Vega fernandez
SGO
Madrid - Spain
