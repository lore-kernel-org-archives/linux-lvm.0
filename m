Message-ID: <20011119155324.86835.qmail@web12302.mail.yahoo.com>
From: Lars Kellogg-Stedman <thelars@yahoo.com>
Subject: Re: [linux-lvm] Recovering a volume after OS upgrade (lost /etc/lvm*)
In-Reply-To: <20011119090606.A23006@colombina.comedia.it>
MIME-Version: 1.0
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
Date: Mon Nov 19 09:52:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> can you please provide the output of lvmdiskscan?

Sure.  lvmdiskscan says:

  # lvmdiskscan
  lvmdiskscan -- reading all disks / partitions (this may take a
while...)
  lvmdiskscan -- /dev/sda  [       4.24 GB] free whole disk
  lvmdiskscan -- /dev/sdb  [       4.24 GB] free whole disk
  lvmdiskscan -- /dev/sdc  [       4.24 GB] free whole disk
  lvmdiskscan -- /dev/sdd  [       4.24 GB] free whole disk
  lvmdiskscan -- /dev/sde1 [      47.03 MB] Primary  LINUX native
partition [0x83]lvmdiskscan -- /dev/sde2 [       4.00 GB] Primary 
LINUX native partition [0x83]lvmdiskscan -- /dev/sde3 [     698.14 MB]
Primary  LINUX swap partition [0x82]
  lvmdiskscan -- /dev/md0  [       8.48 GB] free meta device
  lvmdiskscan -- 6 disks
  lvmdiskscan -- 4 whole disks
  lvmdiskscan -- 0 loop devices
  lvmdiskscan -- 1 multiple device
  lvmdiskscan -- 0 network block devices
  lvmdiskscan -- 3 partitions
  lvmdiskscan -- 0 LVM physical volume partitions

So lvmdiskscan doesn't see the PV, despite the fact that pvscan does:

  pvscan -- reading all physical volumes (this may take a while...)
  pvscan -- WARNING: physical volume "/dev/sda" belongs to a meta
device
  pvscan -- inactive PV "/dev/md0"  is associated to an unknown VG (run
vgscan)
  pvscan -- total: 2 [8.48 GB] / in use: 2 [8.48 GB] / in no VG: 0 [0]

Cheers,

  -- Lars


=====
lars@larsshack.org

__________________________________________________
Do You Yahoo!?
Find the one for you at Yahoo! Personals
http://personals.yahoo.com
