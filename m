Message-ID: <3FE0C0CA.6050400@tupshin.com>
From: Tupshin Harper <tupshin@tupshin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] weird duplicate pv problem
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
Date: Wed Dec 17 14:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I have an lvm2 volume group composed of about 8 different pvs. Recently, 
most lvm commmands started displaying errors like below. Not that it is 
claiming duplicate PVs, but the duplicates are contained in /dev/nbd/*, 
and I'm not actually using any network block devices. I have NBD comiled 
into the kernel, and I'm about to compiling a kernel with nbd not 
compiled in and see if that helps, but it seems extremely odd that lvm 
would detect duplicate pvs on unused nbd devices.

The effects of the problem (in addition to getting these warnings, are 
that any change to a lv(resizing, for example), will render that lv 
inactive or suspended (have seen both), until I do a magic incarnation 
that involves first "vgcfgrestore" and then "lvchange -a y" on the 
affected lv. Note that vgcfgrestore does not make the warnings go away, 
but it does allow the lvchange command to succeed.

Any thoughts? FWIW, I am using devfs, and I'm still curious about a 
reasonable migration strategy to move an lvm2 setup to non-devfs. Kernel 
2.6.0-test11, lvm tools that come with debian sid(lvm version 2.00.05, 
library version 1.00.05-ioctl-cvs, driver version 4.0.0).

-Tupshin

 > vgdisplay lvm_group_1

  Found duplicate PV M20svyTZBtuUWDqrlVcwufe0UTwu7bsP: using /dev/nbd/1 
not /dev/hdg1
  Incorrect metadata area header checksum
  Found duplicate PV vnA2QpnmuXZpj5oAFKymumCCEICD0HA1: using /dev/nbd/65 
not /dev/hdh1
  Incorrect metadata area header checksum
  Found duplicate PV cG67YV7KK1Imi8x0sZGl5gpiKXlyXKGV: using /dev/nbd/66 
not /dev/hdl1
  Incorrect metadata area header checksum
  Found duplicate PV cG67YV7KK1Imi8x0sZGl5gpiKXlyXKGV: using /dev/nbd/67 
not /dev/hdl1
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/68 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/69 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/70 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/71 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/72 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/73 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/74 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/75 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/76 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/77 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/78 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/79 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/80 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/81 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/82 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/83 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/84 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/85 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/86 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/87 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/88 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/89 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/90 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/91 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/92 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/93 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/94 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/95 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/96 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/97 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/98 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using /dev/nbd/99 
not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/100 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/101 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/102 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/103 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/104 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/105 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/106 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/107 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/108 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/109 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/110 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/111 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/112 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/113 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/114 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/115 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/116 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/117 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/118 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/119 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/120 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/121 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/122 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/123 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/124 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/125 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/126 not /dev/hdb4
  Incorrect metadata area header checksum
  Found duplicate PV 4oBUtBXUZ23rcLjA9AHc3XGQLxpjqIxv: using 
/dev/nbd/127 not /dev/hdb4
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  WARNING: Volume group "lvm_group_1" inconsistent
  --- Volume group ---
  VG Name               lvm_group_1
  System ID             PV_IMP(none)1043708474
  Format                lvm2
  Metadata Areas        8
  Metadata Sequence No  49
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                32
  Open LV               31
  Max PV                256
  Cur PV                8
  Act PV                8
  VG Size               672.97 GB
  PE Size               32.00 MB
  Total PE              21535
  Alloc PE / Size       11546 / 360.81 GB
  Free  PE / Size       9989 / 312.16 GB
  VG UUID               yw5iGA-cA7L-OHCF-iWxJ-rOaR-wg9u-ncQcu6
