Return-Path: <jan@moria.gondor.com>
Date: Fri, 22 Dec 2000 18:17:30 +0100
From: Jan Niehusmann <list039@gondor.com>
Message-ID: <20001222181730.A1371@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] vgscan -- ERROR with 2.4.0-test13-pre4
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

I installed 2.4.0-test13-pre4 which includes LVM 0.9, and the lvm tools 
from http://distro.conectiva.com.br/experimental/. 

Now, when I try to boot the new kernel, I get the following message from
vgscan:

vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of
 volume group "vg1" from physical volume(s)

vgscan -d says (complete output available, but a little bit to long for
the list I think)

[...]
<1> vg_read_with_pv_and_lv -- BEFORE for LV
<1> vg_read_with_pv_and_lv -- vg_this->lv[0]->lv_allocated_le: 169
<1> vg_read_with_pv_and_lv -- LEAVING with ret: -365
<1> lvm_error -- CALLED with: -365
[...]

I added another debug output which tells me the counted number of
pe's (the variable npe). It is 75.
This is strange because lv no. 0 is on one disk. But it's not continous,
and after le no. 75, there is a jump backwards to a lower pe number:

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/hda5                 00190  11         2
[...]
   00073 /dev/hda5                 00263  0          0
   00074 /dev/hda5                 00264  0          0
   00075 /dev/hda5                 00265  0          0
   00076 /dev/hda5                 00139  0          0
   00077 /dev/hda5                 00140  0          0

But I don't see how this could cause a problem.

A difference between the output of 0.8's vgscan -d and 0.9's vgscan -d
is that the order of pv is different:

<333> vg_read -- pv[0]->pv_name: "/dev/hda5"
<333> vg_read -- pv[1]->pv_name: "/dev/sda2"
<333> vg_read -- pv[2]->pv_name: "/dev/hdc4"

vs.

<333> vg_read -- pv[0]->pv_name: "/dev/sda2"
<333> vg_read -- pv[1]->pv_name: "/dev/hda5"
<333> vg_read -- pv[2]->pv_name: "/dev/hdc4"


Jan
