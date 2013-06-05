Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r557gvXh003303
	for <linux-lvm@redhat.com>; Wed, 5 Jun 2013 03:42:57 -0400
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r557guFE027717
	for <linux-lvm@redhat.com>; Wed, 5 Jun 2013 03:42:57 -0400
Received: by mail-pd0-f170.google.com with SMTP id x10so1434676pdj.29
	for <linux-lvm@redhat.com>; Wed, 05 Jun 2013 00:42:56 -0700 (PDT)
Received: from gmail.com (nat-pool-pnq-t.redhat.com. [209.132.188.26])
	by mx.google.com with ESMTPSA id
	fm2sm71390907pab.13.2013.06.05.00.42.54 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 00:42:55 -0700 (PDT)
Date: Tue, 4 Jun 2013 22:07:28 -0400
From: Kumar amit mehta <gmate.amit@gmail.com>
Message-ID: <20130605020728.GA9658@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Query on PE size
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

I see that a VG will set the default PE size to 4MiB, i.e.
4 * 1024 * 1024 = 4194304 
(Please correct me if I'm wrong)

<snip>
# pvcreate /dev/vdc1
# vgcreate testvg /dev/vdc1
# vgdisplay
# vgdisplay testvg|grep "PE Size"
   PE Size               4.00 MiB <----
<snip>

I see that :
vgcreate() 
 -->vgcreate_params_set_defaults()
   -->vp_def->extent_size = DEFAULT_EXTENT_SIZE * 2;

Where DEFAULT_EXTENT_SIZE is #defined to 4096
<snip from lib/config/defaults.h>
#define DEFAULT_EXTENT_SIZE 4096        /* In KB */
<snip from lib/config/defaults.h>

This means that the default extent size being set is 8192, but as mentioned 
earlier,the default extent size as reported by 'vgdisplay' is 4 MiB. So Can
someone please point me to the place where this conversion of 8192 into 4MiB
is taking place in the code ?

-Amit
