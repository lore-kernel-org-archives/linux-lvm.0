From: Luca Da Col <luca.dacol@tiscali.it>
Message-Id: <1062272914.11039.103.camel@candido>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to migrate data from one Hard Drive to a new one
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
Date: Sat Aug 30 14:49:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello Linux LVM list, 

I apologize if my question has been already answered.The search engines 
didn't answer to an issue I'm dealing with...

My actual Hard Drives configuration is the following 
(FS is ext3 for both ones - I'm running Red Hat 9):


Disk /dev/hda: 6448 MB, 6448619520 bytes
255 heads, 63 sectors/track, 784 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1        13    104391   83  Linux
/dev/hda2            14        77    514080   8e  Linux LVM
/dev/hda3            78       784   5678977+  8e  Linux LVM

for my first disk, where I've also installed LILO, and 


Disk /dev/hdb: 40.0 GB, 40020664320 bytes
255 heads, 63 sectors/track, 4865 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdb1             1      2550  20482843+  8e  Linux LVM
/dev/hdb2          2551      3700   9237375   8e  Linux LVM
/dev/hdb3   *      3701      4865   9357862+  39  Plan 9

for the second one. 


I finally decided to upgrade my old 6.5G HD to a new 120G HD; is the procedure described in
http://www.tldp.org/HOWTO/LVM-HOWTO/removeadisk.html  a safe way to migrate all my data 
from the former to the 120G? I mean, my case is slightly different from the one described 
because of /boot partition and LILO in the MBR...

I've found that some programs would easily upgrade HDs. Does anyone know how 
they work with LVM and how safe would be the upgrade with those kind of tools?


Thanks in advance for your help and apologize if this question does not fit into this mailing list. 

Rgds,
Luca

-- 
Luca Da Col <luca.dacol@tiscali.it>
