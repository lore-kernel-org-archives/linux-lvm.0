From: Bodo Bock <B.Bock@bk-cad.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14461.51269.323212.877604@pcn.bk-cad.de>
Date: Thu, 13 Jan 2000 13:42:45 +0100 (CET)
Subject: [linux-lvm] SuSE Linux 6.3 and LVM
In-Reply-To: <6411.000111@fgan.de>
References: <6411.000111@fgan.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Peter Knott <knott@fgan.de>
Cc: linux-lvm@msede.com

Peter Knott writes:
 > I tried installing LVM using the installation program YAST
 > provided by SuSE which offers facilities to create physical
 > volume groups and logical volumes.
 > I succesfully created a PV consisting of 2 partitions:
 >   sda1 ( 500MB)
 >   sdc1 (4300MB)
 > 
 > When I tried to create a LV of any size (I tried 1MB up to the
 > max. amount) YAST returned an error message:
 > error code: 95
 > "malloc ..."
 > 
 > Has anyone tried to use the LVM support in SuSE Linux 6.3? If
 > yes, have you encountered similar problems or is this a problem
 > with my hardware?

No I had no such problems but my yast (not yast2) created a filesystem
on the pv and the lv. Sounds funny for me.

Regards

   Bodo

-- 
######################################################################
# b+k CAD/CAM Unternehmensberatung GmbH         Anschrift:           #
# Bodo Bock                                     Varrentrappstr. 3    #
# Fax.: 05 31 / 5 80 04 - 56                    D-38114 Braunschweig #
# e-mail: B.Bock@bk-cad.de                                           #
######################################################################
