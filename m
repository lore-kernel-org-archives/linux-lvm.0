From: Alexander Lazarevich <alazarev@itg.uiuc.edu>
Message-ID: <Pine.LNX.4.44.0301281418370.5767-100000@zeus.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] resize LV
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
Date: Tue Jan 28 14:44:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

I've got a RedHat linux 7.3 system, running LVM 1.03 (or whatever comes 
with the 7.3 distribution). This system is our fileserver. It is patched 
and uses the 2.4.18-19.7.xsmp kernel. I've got one volume group (homevg), 
with 2 LV's in that group (/dev/homevg/stafflv and /dev/homevg/userslv). 
The filesystem on /dev/homevg/userslv need to be expanded by 50GB. There 
are plenty of free PE's left in homevg, more than 126GB.

I know how to expand the LV while the LV is mounted, piece of cake 
(lvextend -L+50GB /dev/homevg/userslv - expands userslv by 50GB). But how 
do I expand the filesystem while it is mounted? I don't want to 
umount the filesystem down to do this.

The filesystem is an ext3 filesystem. Can I use resize2fs? The man pages 
for resize2fs say nothing about doing it while the filesystem is mounted, 
so I'm assuming I can't. If not, is there some other command that does it 
while the filesystem is online?

If I need a kernel patch/recomplile while will allow me to perform 
filesystem resizes while that filesystem is up thats fine, please let me 
know what the patch is. I need it big time, and I should have figured it 
out before I brought the system online! ack!

Thanks in advance!

Alex
---                                                        ---
   Alex Lazarevich | Systems | Imaging Technology Group
   alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
---                                                        ---
