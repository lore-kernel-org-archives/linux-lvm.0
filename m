Date: Tue, 4 Sep 2001 15:42:55 +0200 (MSZ)
From: Thorsten Sauter <sar@viastore.de>
Message-ID: <Pine.A32.4.33.0109041529400.49352-100000@as1.viastore.de>
MIME-Version: 1.0
Subject: [linux-lvm] SoftRaid and LVM
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello LVM-Gurus,

I would like to create a volume group based on an sofraid device
(/dev/md0). I know, there are many emails about this topic, but I think no
one has the solution for this. I have found some code-patches for older
versions of the lvm for fix this problem. But, what is the current state
in the new lvm-1.0.1-rc2 version.

The following things I have made before:
$ mkraid --realy-force /dev/md0
$ mkreiserfs /dev/md0
$ mount /dev/md0 /mnt
-> so I think, the raid device is ok

$ pvcreate /dev/md0
> pvcreate -- device "/dev/md0" has a partition table

$ fdisk -l /dev/md0
> Disk /dev/md0: 2 heads, 4 sectors, 2441880 cylinders
> Units = cylinders of 8 * 512 bytes
>
>     Device Boot    Start       End    Blocks   Id  System
$ uname -a
> Linux lxclust1 2.4.9 #6 Mon Jan 3 19:52:54 CET 2000 i686 unknown
$ dmesg | grep -i lvm
> LVM version 0.9.1_beta2  by Heinz Mauelshagen  (18/01/2001)
> lvm -- Driver successfully initialized

LVM-Version: 1.0.1-rc2      -> why is this an other version as reported
by kernel?

Does anyone know, how can I initialize the /dev/md0 device for te the lvm?

Thanks for your help,

Thorsten Sauter
viastore systems GmbH


--
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
