Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6AMS3NQ018164
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 18:28:03 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6AMS3TL026583
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 18:28:03 -0400
Received: by iyb12 with SMTP id 12so4487956iyb.33
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 15:28:02 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 10 Jul 2011 18:28:02 -0400
Message-ID: <CAOS=siEd-PbK7wFg3JtMH6wZTy790=DeNdfHU-NJnmJ0j9evmg@mail.gmail.com>
From: =?ISO-8859-1?Q?Eric_B=E9langer?= <snowmaniscool@gmail.com>
Subject: [linux-lvm] [PATCH] Remove leading PATH to tr in lvmdump.sh
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

The  lvmdump.sh script invokes tr by using the full path: /usr/bin/tr.
 This cause problems on distributions like Arch Linux where tr is in
another location, e.g. /bin/tr. As the script already use tr at
another place without using the full path (see line 139), I propose
the appended patch to remove the leading path to tr.

Thanks,
Eric


--- scripts/lvmdump.sh.old      2011-07-10 18:13:53.000000000 -0400
+++ scripts/lvmdump.sh  2011-07-10 18:14:13.000000000 -0400
@@ -76,7 +76,7 @@
        esac
 done

-NOW=`$DATE -u +%G%m%d%k%M%S | /usr/bin/tr -d ' '`
+NOW=`$DATE -u +%G%m%d%k%M%S | tr -d ' '`
 if test -n "$userdir"; then
        dir="$userdir"
 else
