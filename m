From: Majer Stefan <stefan@x-cellent.com>
Message-Id: <1068716833.31505.1848.camel@manaslu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] DRBD with LVM2
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
Date: Thu Nov 13 08:09:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: drbd-devel@lists.sourceforge.net, linux-lvm@sistina.com

Hello,

Im currently testing a new setup for a HA samba fileserver. This setup
is planned like this.


+----------+-------------------+------------------+
|          |       FS1         |       FS2        |
+----------+-------------------+------------------+
|          |      Pri          |      Sec         |
| reiserfs |      /home        |                  |
| lv       |  /dev/vg00/lv_01  |                  |
| vg       |     /dev/vg00     |                  |
| drbd     |     /dev/nb0      |    /dev/nb0      |
| phys. vol|     /dev/sda      |    /dev/sda      |
+----------+-------------------+------------------+

i can mount /home and read and write data.
But when i try to make fs2 primary things got strange.

first i tried to switch the drbd state manually:

fs1:~ # cat /proc/drbd 
version: 0.6.6 (api:62/proto:62)
0: cs:Connected st:Primary/Secondary ns:170804 nr:0 dw:65948 dr:170904
pe:0 ua:0

fs1:~ # vgs
VG   #PV #LV #SN Attr VSize   VFree 
vg00   1   2   0 wz-- 100.00M 12.00M

then 
fs1:~ # drbdsetup /dev/nb0 secondary
fs2:~ # drbdsetup /dev/nb0 primary

fs1:~ # cat /proc/drbd 
version: 0.6.6 (api:62/proto:62)

0: cs:Connected st:Secondary/Primary ns:170804 nr:0 dw:65948 dr:170904
pe:0 ua:0

fs2:~ # cat /proc/drbd 
version: 0.6.6 (api:62/proto:62)

0: cs:Connected st:Primary/Secondary ns:0 nr:170804 dw:170804 dr:20 pe:0
ua:0

all seems fine 
but
fs2:~ # vgchange -ay
  No volume groups found
also
fs2:~ # pvscan -v
    Wiping cache of LVM-capable devices
    Wiping internal cache
    Walking through all physical volumes
  No matching physical volumes found


That leeds me in a state, which makes the fs2 unusable.
when i switch back to fs1 all is fine again.


Im using the following software components:

Kernel Suse-Linux-9.0 2.4.21-99
device-mapper-1.00.05
lvm2-2.00.07
drbd-0.6.6
heartbeat-1.0.3

any hints are welcome

greetings

Stefan Majer

-- 
x-cellent technologies GmbH
