From: Steve_J_Brueggeman@notes.seagate.com
Message-ID: <8825672B.0073427A.00@sv-gw1.stsv.seagate.com>
Date: Fri, 5 Mar 1999 14:59:55 -0600
Subject: Re: [linux-lvm] Problems with LVM 0.6
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marka@a-wicked.demon.co.uk
Cc: stevebr@primenet.com, linux-lvm@msede.com


I've found the problem. It lies in tools/lib/lvm_tab_get_free_blk_dev.c
I've changed from
--------------------------top------------------------
#define   GET_LV_DEV \
   { \
      int i, l; \
      for ( i = 0; i < lv_dev_count - 1; i++) { \
         for ( l = 0; l < lv_dev_count; l++) { \
            if ( lv_dev == lv_dev_this[l]) lv_dev++; \
         } \
      } \
   }

--------------------------bot------------------------

to
--------------------------top------------------------
#define GET_LV_DEV \
   { \
      int i, l, foundfree=0; \
      for ( i = 0; (i < lv_dev_count) && !foundfree; i++) { \
         foundfree = 1; \
         for ( l = 0; l < lv_dev_count; l++) { \
            if ( lv_dev == lv_dev_this[l]) { \
              lv_dev++; \
              foundfree = 0; \
            } \
         } \
      } \
   }
--------------------------bot------------------------
This changes the outer loop to test the whole list again.  The problem was
when the number of existing Logical Devices was 1, the outer loops test
would fail, and no matches would be found, so minor #0 would get reused
again.

I also added a test to drop out early, if the inner loop has made a whole
round without finding any matches.  I'm sure there's a better way, but I
was in a hurry.


#define VG_BLK(a)       ( vg_lv_map[minor].vg_number)
#define LV_BLK(a)       ( vg_lv_map[minor].lv_number)

Also, while I was perusing the source, I noticed the following oddity, in
include/linux/lvm.h, the following are defined...
--------------------------top------------------------
/* block minor indexes into a volume group/logical volume indirection table
 */
#define VG_BLK(a)       ( vg_lv_map[minor].vg_number)
#define LV_BLK(a)       ( vg_lv_map[minor].lv_number)
--------------------------bot------------------------

Note that the macro parameter (a) is not used in the macro defination.  I
believe in the above that [minor] should be changed to [(a)], as follows
#define VG_BLK(a)       ( vg_lv_map[(a)].vg_number)
#define LV_BLK(a)       ( vg_lv_map[(a)].lv_number)


The above changes have resolved the problem I was having, but I have not
tested them out thoroughly, and I may have made some bad assumptions.  Let
me know.

Steve Brueggeman






marka@a-wicked.demon.co.uk on 03/05/99 11:59:46 AM

To:   Steve J Brueggeman, stevebr@primenet.com
cc:
Subject:  [linux-lvm] Problems with LVM 0.6




Hello Steve,

My mistake, thinking about it the minor number should increment
what I did also was roll back to 0.5 version of lvm
then created two logical volumes

here is the output

crw-r-----   1 root     root     109,   0 Mar  4 19:11 group
brw-r-----   1 root     root      58,   1 Mar  4 19:12 lvol1
brw-r-----   1 root     root      58,   2 Mar  4 19:12 lvol2

as you can see from yours the minor number for the lvols is the same as
the minor number for the group file

Regards

Mark
