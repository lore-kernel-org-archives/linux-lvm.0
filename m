From: Terje Kvernes <terjekv@math.uio.no>
Message-Id: <wxxadsj4vo6.fsf@nommo.uio.no>
MIME-Version: 1.0
Subject: [linux-lvm] LVs with the same LV#.
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
Date: Thu Apr  4 04:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

  a 'vgdisplay -v' ends with the following:

--- Logical volume ---
LV Name                /dev/cornucopia/gjester-u1
VG Name                cornucopia
LV Write Access        read/write
LV Status              available
LV #                   7
# open                 0
LV Size                2.00 GB
Current LE             32
Allocated LE           32
Allocation             next free
Read ahead sectors     10000
Block device           58:6

--- Logical volume ---
LV Name                /dev/cornucopia/ansatte-u1
VG Name                cornucopia
LV Write Access        read/write
LV Status              available
LV #                   7
# open                 0
LV Size                2.00 GB
Current LE             256
Allocated LE           256
Allocation             next free
Read ahead sectors     10000
Block device           58:6


  interestingly enough, neither of these block devices exist any
  longer under /dev/cornucopia/.  there wasn't any data on these LVs
  either, but, I can't remove them.  a complete dump of 'lvremove -d
  /dev/cornucopia/ansatte-u1' can be found here:

<url: http://www.math.uio.no/~terjekv/tmp/lvremove-d >

  the interesting tidbits I find are:

<4444> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)

  (twice) and the ending of it all:

<1> lv_release -- CALLED with /dev/cornucopia/ansatte-u1
<22> lv_check_name -- CALLED with lv_name: "/dev/cornucopia/ansatte-u1"
<333> lvm_check_chars -- CALLED with name: "/dev/cornucopia/ansatte-u1"
<333> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- CALLED with VG: cornucopia
<4444> lvm_check_chars -- CALLED with name: "cornucopia"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> lv_check_name -- LEAVING with ret: 0
<1> lv_release -- after search for /dev/cornucopia/ansatte-u1
<1> lv_release -- /dev/cornucopia/ansatte-u1 NOT found
<1> lv_release -- LEAVING with ret: -173
<1> lvm_error -- CALLED with: -173
<1> lvm_error -- LEAVING with: "lv_release(): LV number"
lvremove -- ERROR "lv_release(): LV number" releasing logical volume "/dev/cornucopia/ansatte-u1"

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

  now, how do I go about zapping these two LVs?

  (I _can_ zap the VG and recreate the LVs, but I kinda hope to avoid that)

-- 
Terje
