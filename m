From: "Chad C. Walstrom" <chewie@wookimus.net>
Message-Id: <20011102022256.536AC182DE@skuld.wookimus.net>
Subject: [linux-lvm] OK...interesting dilemma...
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
Date: Thu Nov  1 20:25:02 2001
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I don't like IDE any longer... but that's besides the point.  Some time
ago, I quit running my "file server", an old 166MHz Pentium w/a 60GB+
IBM Deskstar drive.  I ran into that IDE problem that's been detailed on
this list a number of times already, where the seek was failing.  I
started to loose files, so I backed up the important stuff to my
workstation and shut the machine off.

Now we come to the present.  I've upgraded the hardware of my
workstation, including a new case with plenty of room for harddrives.
I've decided that running a separate file server wasn't necessary for my
home network, and actually increased my maintenance in my "off hours"...
Since I work as a sysadmin all day, I find it discouraging to have to do
the same at home.  I'd rather program. ;-)

Anyway, so I'm moving this "old" IDE drive into my current SCSI
workstation system.  The active volume group is correctly using the SCSI
drive with a name of vg01.  The inactive IDE harddrive also has a volume
group named vg01.  Herein lies my question.  Can I use vgrename to
rename the inactive volume?

    e.g. vgrename vg01 /dev/vg02

Will it correctly choose the inactive volume?

Current Kernel: linux-2.4.13
Current LVM Kernel Patch: lvm-1.0.1rc4
Current LVM Tools: manually installed lvm-1.0.1rc4

There are two harddrives in the system:

/dev/ide/host0/bus0/target0/lun0/disc:

 Model=IBM-DTLA-307060, FwRev=TX8OA50C, SerialNo=YQDYQFN0401
 Config={ HardSect NotMFM HdSw>15uSec Fixed DTR>10Mbs }
 RawCHS=16383/16/63, TrkSize=0, SectSize=0, ECCbytes=40
 BuffType=DualPortCache, BuffSize=1916kB, MaxMultSect=16, MultSect=off
 CurCHS=16383/16/63, CurSects=16514064, LBA=yes, LBAsects=120103200
 IORDY=on/off, tPIO={min:240,w/IORDY:120}, tDMA={min:120,rec:120}
 PIO modes: pio0 pio1 pio2 pio3 pio4 
 DMA modes: mdma0 mdma1 mdma2 udma0 udma1 udma2 udma3 udma4 *udma5 

Host: scsi0 Channel: 00 Id: 08 Lun: 00
  Vendor: IBM      Model: DNES-309170W     Rev: SA30
  Type:   Direct-Access                    ANSI SCSI revision: 03

Anyway, any insight would be helpful.  If you have the time, please
reply to me directly.

--
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Key fingerprint = B4AB D627 9CBD 687E 7A31  1950 0CC7 0B18 206C 5AFD
