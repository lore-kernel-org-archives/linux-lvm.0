Date: Sat, 19 Aug 2000 17:27:39 +0200
From: Jan Niehusmann <list039@gondor.com>
Subject: [linux-lvm] lv_on_disk_size
Message-ID: <20000819172739.A3218@gondor.com>
Reply-To: jan@gondor.com
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com
Cc: linux-lvm-bug@ez-darmstadt.telekom.de, adilger@turbolinux.com

In the BUGS file, one mentioned bug fix is the following:

> Please change the macro LVM_LV_DISK_OFFSET as below:
> 
> #define LVM_LV_DISK_OFFSET(a, b) ( (a)->lv_on_disk.base + \
>                                    sizeof ( lv_disk_t) * b)
> 

Without really understanding what's going on (all these lv_, pe_, ...
prefixes are really confusing me ;-)) I wonder if the following line
in vg_setup_for_create.c is correct:

(Line 94)
      vg->pv[p]->lv_on_disk.size = ( max_lv + 1) * sizeof ( lv_t);

Or should it be sizeof( lv_disk_t), too?


Jan
