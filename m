From: Alexander Lazarevich <alazarev@itg.uiuc.edu>
Message-ID: <Pine.LNX.4.44.0301290900350.22463-100000@zeus.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] resize an ext3 on an LV
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
Date: Wed Jan 29 09:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

A rehash of some questions I asked earlier, but I want to clarify:

Redhat 7.3, 2.4.18-19.7.xsmp kernel, using LVM 1.03.

I've got a 180GB LV (/dev/homevg/userslv) which contains an ext3 
filesystem (mount point /home/users).

Once I umount the /dev/homevg/userslv, can I use resize2fs to extend the 
ext3 filesystem? Or must I first remove the journal from ext3, then 
resize, then add the journal back to it, then remount?

Anyone know the exact commands to remove the journal? Would these work:
tune2fs -0 ^has_journal /dev/homevg/userslv
e2fsck -f /dev/homevg/userslv

Is this safe? Data is backed up on tape, but I'd rather not destroy the 
filesystem in the first place.

Thanks in advance!

Alex
---                                                        ---
   Alex Lazarevich | Systems | Imaging Technology Group
   alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
---                                                        ---
