Message-Id: <20020925091351kaoru@rifu.bsd.tnes.nec.co.jp>
Mime-Version: 1.0
From: kaoru@bsd.tnes.nec.co.jp
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvmsar & pvchange minor problems
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
Date: Tue Sep 24 19:19:18 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-2022-jp"
To: linux-lvm@sistina.com

Hi,

I found minor problems in lvm's commands with kernel 2.4.18 + LVM 1.0.5.

=======
Lvmsar command does not handle -h option.

# lvmsar -h
lvmsar -- invalid command line option "h"

# lvmsar --help
lvmsar -- invalid command line option "h"

# lvmsar -?

Logical Volume Manager 1.0.5
Heinz Mauelshagen, Sistina Software  15/07/2002 (IOP 10)

lvmsar -- Logical Volume Manager System Activity Data Reporter

Synopsis:
---------

lvmsar
        [-d/--debug]
        [-f/--full]
        [-h/--help]
        [-s/--stdin]
        [-v/--verbose]
        LogFilePath


=======
Vg_check_active function printed the following illgal debug messages 
when I executed "pvchange -d".

....
	<22> vg_check_active_all_vg -- CALLED
	<333> vg_status_get_count -- CALLED
	<333> vg_status_get_count -- LEAVING with ret: 2
	<333> vg_status_get_namelist -- CALLED
	<333> vg_status_get_namelist -- LEAVING with ret: 0
	<22> vg_check_active_all_vg -- LEAVING with ret: 0  ptr: ~H剤D^H^H枝D^H
	<22> pv_check_active -- CALLED
....

I made the following patch for this problem, and it seems 
to work. Any comments? 

---8<-----------8<----------8<----------8<----------8<----------
--- 1.0.5/tools/lib/vg_check_active.c.orig      Tue Sep 24 11:12:51 2002
+++ 1.0.5/tools/lib/vg_check_active.c   Tue Sep 24 11:13:21 2002
@@ -88,6 +88,6 @@
    else           ptr = NULL;

    debug_leave ( "vg_check_active_all_vg -- LEAVING with ret: %d  ptr: %s\n",
-                 ret, ptr);
+                 ret, (( ptr == NULL ) ? "null" : *ptr));
    return ptr;
 }
---8<-----------8<----------8<----------8<----------8<----------

Thanks,
Kaoru
