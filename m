Message-ID: <20040106165719.A26553@cs.mcgill.ca>
From: Navindra Umanee <navindra@cs.mcgill.ca>
Mime-Version: 1.0
Subject: [linux-lvm] vgscan goes into an infinite loop (migration issues)
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
Date: Tue Jan  6 15:59:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I have an LVM1 system working under 2.4.  I've installed 2.6.0 with
devmapper and the LVM2 tools.  Now I'm trying to get 2.6.0 to mount my
LVM1 system or at least to convert LVM1 to LVM2.

I have a single IDE harddrive with one VG named /dev/bytepool
containing four LVM partitions.  I have a few LVs under
/dev/bytepool/.

vgconvert runs for a long long time, uses more than 3G of memory
(including swap) and then fails with an out of memory error.  I can
increase swap if it will help, but I don't think it will. 

vgscan does the same thing with global/format set to LVM1.  So I put
vgscan in verbose and debug mode:

locking/file_locking.c:158   Locking /var/lock/lvm/V_bytepool RB
toollib.c:305   Finding volume group "bytepool"
device/dev-io.c:325   Opened /dev/hda6
format1/disk-rep.c:353   Found /dev/hda6 in VG bytepool
device/dev-io.c:325   Opened /dev/hda7
format1/disk-rep.c:353   Found /dev/hda7 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda7
device/dev-io.c:325   Opened /dev/hda8
format1/disk-rep.c:353   Found /dev/hda8 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda8
device/dev-io.c:325   Opened /dev/hda9
format1/disk-rep.c:353   Found /dev/hda9 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda9
format1/disk-rep.c:353   Found /dev/hda6 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda6
format1/disk-rep.c:353   Found /dev/hda7 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda7
format1/disk-rep.c:353   Found /dev/hda8 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda8
format1/disk-rep.c:353   Found /dev/hda9 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda9
format1/disk-rep.c:353   Found /dev/hda6 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda6
format1/disk-rep.c:353   Found /dev/hda7 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda7
format1/disk-rep.c:353   Found /dev/hda8 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda8
format1/disk-rep.c:353   Found /dev/hda9 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda9
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda6
format1/disk-rep.c:353   Found /dev/hda7 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda7
format1/disk-rep.c:353   Found /dev/hda8 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda8
format1/disk-rep.c:353   Found /dev/hda9 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda9
format1/disk-rep.c:353   Found /dev/hda6 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda6
format1/disk-rep.c:353   Found /dev/hda7 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda7
format1/disk-rep.c:353   Found /dev/hda8 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda8
format1/disk-rep.c:353   Found /dev/hda9 in VG bytepool
format1/disk-rep.c:392   Ignoring duplicate PV  on /dev/hda9
[...]

Basically it's an infinite loop.  Any idea what is going on?  I would
greatly appreciate any suggestions.

Btw, it was quite an unpleasant shock to find that Linux 2.6.0 no
longer supported my LVM filesystems -- the kernel documentation
completely fails to mention anything at all about LVM changes.  Can
someone take care of this oversight?  

I *am* really glad my partitions and data have not been toasted so
far...  :-)

Thanks,
Navin.
