Message-ID: <3FE2892B.8000506@alteeve.com>
From: Madison Kelly <linux@alteeve.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Ext3 -> ReiserFS on '/' convertion prob
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
Date: Thu Dec 18 23:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi all,

   This is my first post to the list so forgive me please if I am making 
any mistakes of protocol! :)

   I am relatively new to LVM but I have read most of the docs that I 
could find on the topic and I am pretty strong on RAID and general 
storage tech. With that said, here is my problem/scenario:

   I have a small test server that I am trying to use to learn how to 
configure the '/' filesystem of a Fedora Core 1 install of linux to 
reside on a software RAID5 array with an LVM VG on top of it and the 
bulk of that partition on a single LV mounted as '/'. This so far is 
just fine. Oh, fwiw, the four drives are SCSI on an Adaptec 2940x PCI 
controller (three in use now, a forth to be used as a temp drive during 
FS convertion and later added to the array) with another IDE drive used 
for '/boot' and <swap>.

   Now what I am trying to do immidiately is to convert the '/' 
filesystem from 'ext3' to 'resierfs'. ReiserFS is not an install-time 
option and the LVM FAQ says simple to boot from a rescue CD, back the 
'/' LV data up, re-format the LV with a ReiserFS and then restore the 
data. Sounds easy enough, eh? Anyway, I have been able to do all of this 
and I am even pretty sure that the data is intact because when I boot 
the Fedora Core 1 Disk 1 using 'linux rescue' it scans for the install 
and finds it on both '/dev/sdd1' (the drive I am using temporarily to 
backup the '/' LV data to) and on '/dev/vg0/root' (the LV that started 
life as an ext3 filesystem during the OS install).

   The problem is that when I boot into the OS proper something 
somewhere is still telling something to do with LVM that the file system 
is still ext3 and thus it throws a kernel panic. I have edited 
'/etc/fstab', '/etc/mtab' and '/etc/blkid.tab' to read 'reiserfs' 
instead of the original 'ext3'. Am I missing a file somewhere? Is there 
a command I need to run to tell '/etc/lvmtab' or '/etc/lvmtab.d/root' 
that the filesystem has changed? Am I missing something all together 
different?

   Anywho, as a little heads up and maybe a little request for comment; 
once I manage to get the '/' LV on ReiserFS the next thing I want to do 
is add a forth drive (the '/dev/sdd' drive) to the RAID5 array, extend 
it via 'raidreconf', add the new space to the PV, pass that space up to 
the VG and finally extend the 'root' LV and update the filesystem while 
online (hence the desire for ReiserFS). Am I on the right track? Does 
anyone who has done this before have any pointers?

   Thanks all for listening to a n00by!!

Madison
