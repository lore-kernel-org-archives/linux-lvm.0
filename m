From: Alexander Lazarevich <alazarev@hera.itg.uiuc.edu>
Message-ID: <Pine.A41.4.43.0211111602380.53894-100000@hera.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Max LV size
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
Date: Mon Nov 11 16:10:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

I've got a RAID 5 array which is 500GB. It's on a red hat 7.3 system
(2.4.18-3 kernel) using sistina LVM 1.0.3. I've already got my VG set up,
and I'm now crreating the LV's, but I've got a problem.

vgdisplay -v tells me the max LV size is 255GB. So I figured I'd decrease
the number of Max LV's (currently at 256) to 128, and then that would
increase the size that each LV could be. But when I do a "vgchange -l 128
blah", it just stops and says "segmentation fault".

What gives? I really hope 255GB isn't a limit. Any ideas?

Thanks in advance,

Alex
---                                                        ---
   Alex Lazarevich | Systems | Imaging Technology Group
   alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
---                                                        ---
