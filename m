Return-Path: <urs@isnogud.escape.de>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 16 Jun 2001 15:29:16 +0200
Message-ID: <m23d90imdv.fsf@isnogud.escape.de>
Subject: [linux-lvm] What is a good stripe size?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have two SCSI disks in my systems with PVs on /dev/sda2 and /dev/sdb2
(/dev/sd{a,b}1 are very small partitions for /boot and swap).

Using the PVs on sda2 and sdb2 I created a single VG and I want to
create striped LVs on it now.  My questions is, how large should I
choose the stripe size to achive optimal performance.  If I choose it
too large, I will probably loose the win of striping.

What happens if I choose very small stripe size, say 1K?  When I then
need say 100K of contigous blocks of the LV LVM will read 50K
contigously from sda2 and 50K from sdb2.  But will the 50K from each
of thes partitions be read in 50 reads of 1K?  Will that degrade
performance?

Does the optimal value of the stripe size depend on how the LV will be
used and the average file size on it?  My LVs will be /, /var,
/var/spool/news, /usr, /usr/local, /home and /tftpboot/galois.


urs
