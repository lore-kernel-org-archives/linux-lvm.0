From: Benoit <benoit.peccatte@enst-bretagne.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200312181208.49303.benoit.peccatte@enst-bretagne.fr>
Subject: [linux-lvm] Changing PV position
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
Date: Thu Dec 18 05:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I'm currently using lvm on my box and one disk just died.
Then the second disk (hdb) became the first one (hda). The problem is that now 
I can't get back the physical volume which is on it. Is it possible to tell 
lvm to force the reading of a PV even if it isn't on the same disk as 
before ?

Thank you for your help.
Benoit


Informations :

peck:/# fdisk -l /dev/hda

Disk /dev/hda: 122.9 GB, 122942324736 bytes
255 heads, 63 sectors/track, 14946 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1         898     7213153+   b  W95 FAT32
/dev/hda2             899        1384     3903795   83  Linux
/dev/hda3            1385       14946   108936765    5  Extended
/dev/hda5            1385        1992     4883728+  fd  Linux raid autodetect
/dev/hda6            1993       14946   104052973+  8e  Linux LVM

peck:/# pvs /dev/hda6
  Failed to read physical volume "/dev/hda6"


I'm currently using linux 2.6-test9, with lvm2 tools. 
The missing volume was created with lvm1 tools.
