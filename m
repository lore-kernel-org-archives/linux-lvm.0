Message-ID: <38A28EF0.6D1C8570@bigpond.com>
Date: Thu, 10 Feb 2000 21:12:00 +1100
From: Simon Green <s_green@bigpond.com>
MIME-Version: 1.0
Subject: [linux-lvm] Fixes for vgcreate bugs.
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,

I just joined this list, so forgive me if I say something which has
already been said. The latest 0.8i vgcreate has a bug in it where the
first volume group created will cause a seg. fault if the /etc/lvmtab
file is 1 byte long, as it is after a vgscan has been run. I note
several comments in the changelog about this being fixed, but it still
happened to me every time I tried it. Once at least one volume group has
been created, vgcreate is fine.

The work-around is to create a 0-byte /etc/lvmtab. Vgcreate will then
give an error, but a vgscan will recover the volume group. The fix (as
far as I can see) is as follows.

In the files:

****************** lvm_tab_vg_insert.c

lvm_tab_vg_insert_end:

   if ( vg_name_ptr     != NULL) free ( vg_name_ptr);
   if ( vg_name_ptr_sav != NULL) free ( vg_name_ptr_sav);
   if ( data            != NULL) free ( data);

                        BECOMES

lvm_tab_vg_insert_end:

   if ( vg_name_ptr     != NULL) free ( vg_name_ptr);
   if ( vg_name_ptr_sav != NULL) free ( vg_name_ptr_sav);
   if ( data            != NULL) {
    free ( data);
    data = NULL;
   }



*******************lvm_tab_vg_check_exist.c
   if ( i >= size || size < 2) ret = FALSE;

   free ( data);

                        BECOMES

   if ( i >= size || size < 2) ret = FALSE;

   free ( data);
   data = NULL;



Basically, in lvm_tab_vg_check_exist_all_vg.c, there is a if (data !=
NULL) {free(data); data = NULL;} statement. When "data" is freed in one
of the other two functions above, it is not reset to NULL, leading to an
attempt to free it a second time, which causes the seg. fault. I can
send in the diffs tomorrow if anyone's interested.

Please cc any replies to greencs@logica.com.

Cheers
Simon
