From: "^YosH^" <yosh@liquidzone.net>
Message-ID: <000001c35e03$450eb350$0296a8c0@malin>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Crashed drive, cant get upgraded/partial lvm back online to rescue it!
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
Date: Fri Aug  8 18:20:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi, Im having some trouble with a crashed disk...
The crashed disk seems to hang the whole system when reading from it so
I couldn't pvmove/pvremove/resize the fs... I had to take it out...

The lvm I was using v1 but I have since upgraded to v2 and upgraded the
lvm...
This seem to have went fine and I tried to activate it with the partial
mode.. without luck... this is the output on all the commands I can
think of that can be to any use...

What I need is to activate the VG with the rest of the disks and try to
restore the data from the disks to new disks... 

When I do a vgscan I get the "device ???? has been left open." What does
that mean? Do I have a chance to rescue my data ? I have no backups of
the data on the lvm so I really would like to bring it back... 

My previous posts can be used as a reference to this problem, yes its
still the same problem... but now with the upgraded lvm2...

If there is any more info needed ill be more than happy to provide it...
thank you


Pvscan:
  Warning: Volume Group lvm is not consistent
  PV /dev/sda    is in exported VG lvm [233.69 GB / 233.69 GB free]
  PV /dev/hde    is in exported VG lvm [93.06 GB / 93.06 GB free]
  PV /dev/hdd    is in exported VG lvm [152.56 GB / 152.56 GB free]
  PV /dev/hdf    is in exported VG lvm [93.06 GB / 93.06 GB free]
  PV /dev/hdh    is in exported VG lvm [152.56 GB / 152.56 GB free]
  Total: 5 [724.94 GB] / in use: 5 [724.94 GB] / in no VG: 0 [0   ]

Vgscan:
  Reading all physical volumes.  This may take a while...
  Inconsistent metadata copies found - updating to use version 3
  Found volume group "lvm" using metadata type lvm2
  Device '/dev/hdh' has been left open.
  Device '/dev/sda' has been left open.
  Device '/dev/hdd' has been left open.
  Device '/dev/hde' has been left open.
  Device '/dev/hdf' has been left open.

lvchange -P -ay lvm:
  Partial mode. Incomplete volume groups will be activated read-only.
  Inconsistent metadata copies found - updating to use version 3
  Device '/dev/hdh' has been left open.
  Device '/dev/sda' has been left open.
  Device '/dev/hdd' has been left open.
  Device '/dev/hde' has been left open.
  Device '/dev/hdf' has been left open.


Lvmdiskscan:

  /dev/sda   [      233.76 GB] LVM physical volume
  /dev/hde   [       93.16 GB] LVM physical volume
  /dev/hdi   [       38.29 GB]
  /dev/hdi1  [       99.88 MB]
  /dev/hdi2  [       37.19 GB]
  /dev/hdi3  [     1023.75 MB]
  /dev/hdb   [      111.76 GB]
  /dev/hdd   [      152.67 GB] LVM physical volume
  /dev/hdf   [       93.16 GB] LVM physical volume
  /dev/hdh   [      152.67 GB] LVM physical volume

lvscan:
  Volume group "lvm" inconsistent
  Inconsistent metadata copies found - updating to use version 3
  Device '/dev/hdh' has been left open.
  Device '/dev/sda' has been left open.
  Device '/dev/hdd' has been left open.
  Device '/dev/hde' has been left open.
  Device '/dev/hdf' has been left open.
