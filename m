Date: Thu, 4 Oct 2001 22:33:43 +0200
From: Markus Dobel <mdobel@kawo2.rwth-aachen.de>
Message-ID: <20011004223343.A868@balu.kawo2.rwth-aachen.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] More Segfaults with LVM 1.0.1rc3
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

vgextend, vgreduce and lvextend segfaulted for me today, too. I'm using 

  gcc version 2.96 20000731 (Red Hat Linux 7.1 2.96-95)

which I guess is the reason for those problems.

For vgextend/vgreduce gdb told me, that in vg_extend_reduce "vg_name"
pointed to 0x1. So i did a little debugging and therefore also
inserting the line:

int vg_extend ( char *vg_name, pv_t *pv, vg_t *vg) {
   printf("VG Name is %s\n",vg_name ); // this one
   return vg_extend_reduce ( vg_name, pv, vg, VG_EXTEND);
}

in vg_extend_reduce.c, the same in vg_reduce(). Without changing
anything else, vgextend and vgreduce work for me now.


Similar in lv_extend_reduce.c:

int lv_extend ( vg_t *vg, lv_t *lv, char *lv_name) {
   printf("Extending %s\n", lv_name); // added this line.
   return lv_extend_reduce ( vg, lv, lv_name, LV_EXTEND);
}

I don't speak C too fluently, and I don't know if printf() does some
implicit casting or something or if it's gcc 2.96, but maybe this
information helps a bit in finding the mistake.

Regards, Markus

-- 
Spiegel-Leser wissen mehr. Fuer ein Semester-Abo!
http://www.kawo2.rwth-aachen.de/~mdobel/semesterabo.html
