From: Alasdair G Kergon <agk@uk.sistina.com>
Message-ID: <20021212222520.B11563@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] New LVM2 reporting tools
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
Date: Thu Dec 12 16:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, lvm-devel@sistina.com

I've added a new set of flexible tools to produce column-based output
as an alternative to the current 'field: value' xxdisplay format.

ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.0-latest.tgz 
  (currently aka beta5 or LVM2.1.95.12; some minor bug fixes
   also rolled in)

Access them either standalone as lvs, pvs or vgs, or by use the new
--columns (-C) switch on pvdisplay, vgdisplay or lvdisplay.

Some tiny examples:

lvm> pvs
PV         VG   Fmt  Attr PSize  PFree 
/dev/sdb1  vg1  lvm2 a-   13.97G 13.87G
/dev/sdb2  vg3  lvm1 a-   16.00M     0 
/dev/sdb3       lvm1 a-   21.00M 21.00M
/dev/sdb5  vg2  lvm2 a-   64.00M 40.00M
/dev/sdb6  vg2  lvm2 a-   64.00M 60.00M
/dev/sdb7       lvm2 --   40.92M 40.92M

lvm> vgs
VG   #PV #LV #SN Attr VSize   VFree  
vg1    1   1   0 wz--  13.97G  13.87G
vg2    2   3   0 wz-- 128.00M 100.00M
vg3    1   2   1 wz--  16.00M      0

Add a column:
lvm> vgs -o +extent_size
VG   #PV #LV #SN Attr VSize   VFree   Ext  
vg1    1   1   0 wz--  13.97G  13.87G 4.00M
vg2    2   3   0 wz-- 128.00M 100.00M 4.00M
vg3    1   2   1 wz--  16.00M      0  4.00M

Sort on number of PV's descending then free space descending:
lvm> vgs -O -pv_count,-free
VG   #PV #LV #SN Attr VSize   VFree  
vg2    2   3   0 wz-- 128.00M 100.00M
vg1    1   1   0 wz--  13.97G  13.87G
vg3    1   2   1 wz--  16.00M      0 

(It's also OK to sort on fields that aren't output.)

lvm> lvs vg2/lvol1 vg3
LV    VG   Attr   LSize   Origin 
lvol1 vg2  -wn---  12.00M        
lvol1 vg3  own---   8.00M        
lvol2 vg3  swn---   8.00M lvol1  

lvm> lvs --segments -v
    Finding all logical volumes
LV    VG   Attr   Start SSize   #Str Type    Stripe Chunk
lvol0 vg1  -wnm--    0  100.00M    1 linear      0     0 
lvol0 vg2  -wn---    0    4.00M    1 linear      0     0 
lvol1 vg2  -wn---    0    4.00M    1 linear      0     0 
lvol1 vg2  -wn--- 4.00M   8.00M    2 striped 16.00K    0 
lvol2 vg2  -wn---    0   12.00M    1 linear      0     0 
lvol1 vg3  own---    0    8.00M    1 linear      0     0 
lvol2 vg3  swn---    0    8.00M    1 linear      0     0 

Colon-separated LV sizes in sectors, suitable for piping to other tools:
lvm> lvs -o vg_name,name,size --units s --nosuffix --noheadings --separator :
vg1:lvol0:204800.00
vg2:lvol0:8192.00
vg2:lvol1:24576.00
vg2:lvol2:24576.00
vg3:lvol1:16384.00
vg3:lvol2:16384.00


-v for more columns.
--units to change the output units
  (h)uman-readable, (s)ectors, (b)ytes, k, m, g, t
  or HKMGT to use 1000's instead of 1024's
  Wierd custom units also possible e.g. --units 374k
--separator to set the string separating each column
--noheadings to turn off headings

See man pages for full field lists and meanings of attribute letters.

[Next bit still undocumented and could change slightly]
Defaults, including column selections & ordering, can be changed
with config file entries in a new "report" section:
  aligned, buffered, headings - set to 0 or 1
  separator - string
  pvs_sort, pvs_cols, pvs_cols_verbose  - strings of column lists 
(like -o or -O)
  Similarly for lvs_*, vgs_*, segs_* 
units (string) & suffix (0 or 1) can be set in the "global" section.

Alasdair
-- 
agk@uk.sistina.com
