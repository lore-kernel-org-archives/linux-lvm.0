From: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Date: Tue, 2 Oct 2001 08:55:41 -0400
Message-ID: <001901c14b41$8ad50be0$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Read_intr errors after reboot
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

A Message was posted about the same thing in '2000.  Here is the link
from the archive: 
http://lists.sistina.com/pipermail/linux-lvm/2000-August/005017.html

The problem I am having is almost identicle to this gentlemens, only the
means are different.  In this particular system I have 10x80G drives.  4
on a Promise FastTrack100, and 6 split between two Promise Ultra100s (4
and 2).  I had 2x80G disks (hdj & hdl) that I removed the partitions on
and added them to a PV, then a VG and created one 160GB LV.  I put ext3
on it and mounted it.  It worked just fine and was nice and fast.  As
soon as I rebooted, I got the errors:

    262 hdj: read_intr: error=0x04 { DriveStatusError }      
    261 hdj: read_intr: status=0x59 { DriveReady SeekComplete
DataRequest Error }   
    176 hdl: read_intr: error=0x04 { DriveStatusError }      
    173 hdl: read_intr: status=0x59 { DriveReady SeekComplete
DataRequest Error }   
      3 hdl: read_intr: status=0x5b { DriveReady SeekComplete
DataRequest Index Error }  

The errors are from both disks in the LVM.

I wasn't sure if it was a hardware problem or a LVM problem so I created
another LVM with 3x80G disks (hde, hdi and hdm) exactly the same way
that I created the first one; removed the partitions; created a PV, then
a VG then a single partition using all the space (240G in this case).

Rebooted, and sure enough the new LVM is spewing out the same errors,
aswell as some that I've never seen before:

     23 hde: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=176750592, sector=0    
     27 hde: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=176750594, sector=2    
     27 hde: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=176750596, sector=4    
     27 hde: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=176750598, sector=6    
    104 hde: read_intr: status=0x59 { DriveReady SeekComplete
DataRequest Error }   
      4 hdi: read_intr: error=0x04 { DriveStatusError }      
     15 hdi: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=206897152, sector=0    
     27 hdi: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=206897154, sector=2    
     27 hdi: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=206897156, sector=4    
     27 hdi: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=206897158, sector=6    
      4 hdi: read_intr: status=0x51 { DriveReady SeekComplete Error }

     96 hdi: read_intr: status=0x59 { DriveReady SeekComplete
DataRequest Error }   
      4 hdm: read_intr: error=0x04 { DriveStatusError }      
     14 hdm: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=206897152, sector=0    
     18 hdm: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=206897154, sector=2    
     18 hdm: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=206897156, sector=4    
     18 hdm: read_intr: error=0x10 { SectorIdNotFound },
LBAsect=206897158, sector=6    
      4 hdm: read_intr: status=0x51 { DriveReady SeekComplete Error }

     68 hdm: read_intr: status=0x59 { DriveReady SeekComplete
DataRequest Error }

(BTW:  I used cat /var/log/messages|grep read_intr| awk '{print $6" "$7"
"$8" "$9" "$10" "$11" "$12" "$13" "$14" "$15" "$16" "$17}'|sort | uniq
-c to get that output, incase anyone is wondering about the weird
formatting).

Here are my system details:

Kernel: 2.4.10 (uname comes up as 2.4.8 for some strange reason tho, but
it's definetly 2.4.10)
LVM: 1.0 (was previously using 0.9.1B2 but the LVMs I made were new on
1.0, not from 0.9.1B2)
Promise Card Info:
PDC20268: IDE controller on PCI bus 00 dev 40
PCI: Found IRQ 11 for device 00:08.0
PCI: Sharing IRQ 11 with 00:0c.0
PDC20268: chipset revision 1
PDC20268: not 100% native mode: will probe irqs later
PDC20268: pci-config space interrupt mirror fixed.
PDC20268: (U)DMA Burst Bit ENABLED Primary MASTER Mode Secondary MASTER
Mode.
	ide2: BM-DMA at 0x6c00-0x6c07, BIOS settings: hde:pio, hdf:pio
	ide3: BM-DMA at 0x6c08-0x6c0f, BIOS settings: hdg:pio, hdh:pio
PDC20267: IDE controller on PCI bus 00 dev 48
PCI: Found IRQ 10 for device 00:09.0
PDC20267: chipset revision 2
PDC20267: not 100% native mode: will probe irqs later
PDC20267: (U)DMA Burst Bit ENABLED Primary PCI Mode Secondary PCI Mode.
	ide4: BM-DMA at 0x7100-0x7107, BIOS settings: hdi:DMA, hdj:pio
	ide5: BM-DMA at 0x7108-0x710f, BIOS settings: hdk:pio, hdl:pio
PDC20267: IDE controller on PCI bus 00 dev 50
PCI: Found IRQ 9 for device 00:0a.0
PDC20267: chipset revision 2
PDC20267: not 100% native mode: will probe irqs later
PDC20267: (U)DMA Burst Bit ENABLED Primary PCI Mode Secondary PCI Mode.
	ide6: BM-DMA at 0x7600-0x7607, BIOS settings: hdm:pio, hdn:pio
	ide7: BM-DMA at 0x7608-0x760f, BIOS settings: hdo:pio, hdp:pio

Lastly, someone posted a follow-up to the original message I referenced
above:

http://lists.sistina.com/pipermail/linux-lvm/2000-August/005018.html

The setting Justin is referencing is already configured in my kernel.

Any help would be appreciated and if any more info is required, please
let me know!

Thanks in advance!

-Jason
