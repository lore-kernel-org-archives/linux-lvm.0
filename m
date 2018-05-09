Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8593E6442E
	for <linux-lvm@redhat.com>; Wed,  9 May 2018 06:53:02 +0000 (UTC)
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDE6B3002F9C
	for <linux-lvm@redhat.com>; Wed,  9 May 2018 06:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id D366E453
	for <linux-lvm@redhat.com>; Wed,  9 May 2018 08:52:57 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id ZjUqfLrA6uI7 for <linux-lvm@redhat.com>;
	Wed,  9 May 2018 08:52:57 +0200 (CEST)
Received: from [IPv6:2003:f6:ebc5:2d00:c51a:d09c:633e:d61a]
	(p200300F6EBC52D00C51AD09C633ED61A.dip0.t-ipconnect.de
	[IPv6:2003:f6:ebc5:2d00:c51a:d09c:633e:d61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id 8422B450
	for <linux-lvm@redhat.com>; Wed,  9 May 2018 08:52:57 +0200 (CEST)
From: Oliver Rath <rath@mglug.de>
Message-ID: <f45ed20a-6773-54c2-d1f6-774522f1d7f8@mglug.de>
Date: Wed, 9 May 2018 08:52:57 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------AFB3C35AC81DA6550897AA35"
Content-Language: en-US
Subject: [linux-lvm] api recommandation (example_cmdlib.c doesnt work
	properly)?
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------AFB3C35AC81DA6550897AA35
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi list,

i tried to get some lvm-commands working using example_cmdlib.c
(modified, attached). Unfortunatly the example hangs trying a "lvcreate
--name test --size 12M levg" command:

---------------------- snip ---------------------------------

root@w541:/home/oliver/gits/lvm2/doc# lvremove -f levg/test
  Logical volume "test" successfully removed
root@w541:/home/oliver/gits/lvm2/doc# ./example_cmdlib
WARNING: Sum of all thin volume sizes (870,00 GiB) exceeds the size of
thin pools and the amount of free space in volume group (<6,17 GiB).
WARNING: You have not turned on protection against thin pools running
out of space.
WARNING: Set activation/thin_pool_autoextend_threshold below 100 to
trigger automatic extension of thin pools before they get full.

---------------------- snap ---------------------------------

Here the only way to continue is to killall -9 example_cmdlib. If you
like, i can send a strace from the run (300kb). The program was built with

gcc example_cmdlib.c -o example_cmdlib  -llvm2cmd

Whats wrong here? Ist there a better api for communicating from other
programs?

Imho the python support is deprecated, lvm2app is deprecated, dbus-api
is limited@the moment (right? Didnt find documentation for it), so
the only way seems liblvm or call explicit the lvm-tools.

Tfh!

Oliver


--------------AFB3C35AC81DA6550897AA35
Content-Type: text/x-csrc;
 name="example_cmdlib.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="example_cmdlib.c"

/*
 * Copyright (C) 2004 Red Hat, Inc. All rights reserved.
 *
 * This file is part of LVM2.
 *
 * This copyrighted material is made available to anyone wishing to use,
 * modify, copy, or redistribute it subject to the terms and conditions
 * of the GNU General Public License v.2.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#include "lvm2cmd.h"
#include <stdio.h>

/* All output gets passed to this function line-by-line */
void test_log_fn(int level, const char *file, int line,
		 int dm_errno, const char *format)
{
	/* Extract and process output here rather than printing it */

	if (level != 4)
		return;

	printf("%s\n", format);
	return;
}

int main(int argc, char **argv)
{
	void *handle;
	int r;

	lvm2_log_fn(test_log_fn);

	handle = lvm2_init();

	lvm2_log_level(handle, 4);
	// r = lvm2_run(handle, "vgs --reportformat=json levg");
	r = lvm2_run(handle, "lvcreate --name test --size 12M levg");

	/* More commands here */

	lvm2_exit(handle);
	return r;
}


--------------AFB3C35AC81DA6550897AA35--
