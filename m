Message-ID: <388B00FB.A20AEEB0@msede.com>
Date: Sun, 23 Jan 2000 14:24:11 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: francis-souyri@altavista.net
MIME-Version: 1.0
Subject: [linux-lvm] lvm.c-2.3.39 modif. for kernel 2.3.40 (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

-------- Original Message --------
Sender: francis@mailhub5.libertysurf.fr
Date: Sun, 23 Jan 2000 14:00:54 +0100
From: Francis SOUYRI <francis.souyri@libertysurf.fr>
Reply-To: francis-souyri@altavista.net
Subject: lvm.c-2.3.39 modif. for kernel 2.3.40.

Hi,

I recently installed the lvm patch for the 2.3.39 kernel (lvm.c-2.3.39
file) on a 2.3.40 kernel, the system hangs with a null pointer
because the "struct gendisk' changed.
To bypass the problem I comment in the file driver/block/lvm.c the
lines
(line 312...):

//      MAX_LV,                 /* maximum number of real devices */
//      lvm_geninit,            /* initialization called before we
//                                 do other things */

in the initialisation of the 'static struct gendisk  lvm_gendisk'.

Best regards.

Francis
