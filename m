Message-ID: <401A8C6C.3040108@grayskies.net>
From: David Powers <david@grayskies.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] duplicate PV error with 2.6.1 and lvm2
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
Date: Fri Jan 30 11:56:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I am attempting to create a simple volume on a soft raid 1 device 
(/dev/md1) on a gentoo linux box running 2.6.1.  The pvcreate seems to 
go fine but when I then attempt to create the volume group I get an odd 
error about duplicate PV's.  It seems as if the code is sometimes 
treating the device as a single device and sometimes seeing the 
underlying disks.  Any help would be appreciated.

disk1 root # cat /proc/mdstat
Personalities : [raid1]
md1 : active raid1 sdb1[1] sda1[0]
      244179840 blocks [2/2] [UU]

md0 : active raid1 hdg3[1] hde3[0]
      76035520 blocks [2/2] [UU]

unused devices: <none>
disk1 root # pvcreate /dev/md1
  Physical volume "/dev/md1" successfully created
disk1 root # vgcreate filestore /dev/md1
  Found duplicate PV 5c5olnVSu9cpsAmJ6trmPopx1Hv4ZGv4: using /dev/sdb1 
not /dev/sda1
  Found duplicate PV 5c5olnVSu9cpsAmJ6trmPopx1Hv4ZGv4: using /dev/sdb1 
not /dev/sda1
  Found duplicate PV 5c5olnVSu9cpsAmJ6trmPopx1Hv4ZGv4: using /dev/sdb1 
not /dev/sda1
  Volume group "filestore" successfully created

-David Powers
