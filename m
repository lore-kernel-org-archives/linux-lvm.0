From: Stefan Majer <stefan@x-cellent.com>
In-Reply-To: <1068726937.11996.17.camel@manaslu>
References: <1068726937.11996.17.camel@manaslu>
Message-Id: <1068738173.11988.27.camel@manaslu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [DRBD-dev] DRBD with LVM2
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
Date: Thu Nov 13 09:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "drbd-devel@lists.sourceforge.net" <drbd-devel@lists.sourceforge.net>, linux-lvm@sistina.com

On Thu, 2003-11-13 at 13:35, Stefan Majer wrote:
> > +----------+-------------------+------------------+
> > |          |       FS1         |       FS2        |
> > +----------+-------------------+------------------+
> > |          |      Pri          |      Sec         |
> > | reiserfs |      /home        |                  |
> > | lv       |  /dev/vg00/lv_01  |                  |
> > | vg       |     /dev/vg00     |                  |
> > | drbd     |     /dev/nb0      |    /dev/nb0      |
> > | phys. vol|     /dev/sda      |    /dev/sda      |
> > +----------+-------------------+------------------+
> 
> > Im using the following software components:
> > 
> > Kernel Suse-Linux-9.0 2.4.21-99
> > device-mapper-1.00.05
> > lvm2-2.00.07
> > drbd-0.6.6
> > heartbeat-1.0.3
> 
> > 
> > 
> > i can mount /home and read and write data.
> > But when i try to make fs2 primary things got strange.
> > 
> > first i tried to switch the drbd state manually:
> > 
> > fs1:~ # cat /proc/drbd 
> > version: 0.6.6 (api:62/proto:62)
> > 0: cs:Connected st:Primary/Secondary ns:170804 nr:0 dw:65948 dr:170904
> > pe:0 ua:0
> > 
> > fs1:~ # vgs
> > VG   #PV #LV #SN Attr VSize   VFree 
> > vg00   1   2   0 wz-- 100.00M 12.00M
> > 
> > then 
> > fs1:~ # drbdsetup /dev/nb0 secondary
> > fs2:~ # drbdsetup /dev/nb0 primary
> []
> > all seems fine 
> > but
> > fs2:~ # vgchange -ay
> >   No volume groups found
> > also
> > fs2:~ # pvscan -v
> >     Wiping cache of LVM-capable devices
> >     Wiping internal cache
> >     Walking through all physical volumes
> >   No matching physical volumes found
> > 
> > 
> > That leeds me in a state, which makes the fs2 unusable.
> > when i switch back to fs1 all is fine again.
> 
> >and your /etc/lvm/lvm.conf looks like ... ?
> 
> i added the following arguments to the default configuration:
> 
> 
>     filter = [ "a/nb.*/" , "r/.*/" ]
> 
> 
>     types = [ "drbd", 16 ]
> 
> 
> 
> >just in case: lower level devices are the same, and same size?  
> 
> same same
> 
> 
> >did you copy over your lvm metadata (which is NOT stored on the
> >device itself, but somewhere in /etc/lvm/* ) ?
> 
> first i didnt keep /etc/lvm/* in sync on both machines
> and it behaves as described above
> then i rsynced /etc/lvm to the fs2 node and notheing changed !
> 
> >it is a bit tricky to handle operations with a shared lvm config
> >on a cluster. you need to make sure that lvm metadata is valid and
> >up-to-date on both nodes, each time you add, delete, resize or
> >otherwise alter the device mapping!
> >and you need to do this on your own.
> >neither drbd nor lvm will do it for you.
> 
> is rsync of all /etc/lvm/* content the right method ?
> 
> >       Lars Ellenberg
> 
> i have to mention, that before i created the Logical Volumes i could see
> the Volume Groups on the other node.


i generated a lvm2.log with loglevel 7 on the secondary node
when doing pvscan

and the relevant parts are 


cat /var/log/lvm2.log
lvm.c:726   Processing: pvscan
config/config.c:778   Setting global/locking_type to 1
config/config.c:762   Setting global/locking_dir to /var/lock/lvm
locking/locking.c:99   File-based locking enabled.
pvscan.c:133   Wiping cache of LVM-capable devices
.
.
.
filters/filter-composite.c:22   Using /dev/nb0
device/dev-io.c:315   Opened /dev/nb0
label/label.c:174   /dev/nb0: No label detected
device/dev-io.c:339   Closed /dev/nb0
label/label.c:266   <backtrace>
.
.
.

probably drbd does not sync parts of the labels on the block device
correctly ???

maybe this helps

greetings

Stefan Majer
