Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5CNhgY5000436
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2010 19:43:42 -0400
Received: from smtp2.pacifier.net (smtp2.pacifier.net [64.255.237.172])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5CNhVp9000583
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2010 19:43:32 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	by smtp2.pacifier.net (Postfix) with ESMTP id 2DBE86A434
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2010 16:43:04 -0700 (PDT)
From: ben scott <benscott@nwlink.com>
Date: Sat, 12 Jun 2010 16:43:03 -0700
MIME-Version: 1.0
Message-Id: <201006121643.03778.benscott@nwlink.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] problem #including <lvm2ap.h> using cvs
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
Content-Type: Text/Plain; charset="utf-8"
To: linux-lvm@redhat.com

I want to start putting the lvm library in my app but have run into a snag. 
When I put the line:

#include <lvm2app.h>

in my program, I get the following error:

  In file included from /usr/include/lvm2app.h:17,                                                

/usr/include/libdevmapper.h:1025: error: expected ‘,’ or ‘...’ before 
‘private’
/usr/include/libdevmapper.h:1047: error: expected ‘,’ or ‘...’ before   
‘private’

The relevant portion of libdevmapper.h look like this:

struct dm_report_field_type {
        uint32_t type;          /* object type id */
        uint32_t flags;         /* DM_REPORT_FIELD_* */
        uint32_t offset;        /* byte offset in the object */
        int32_t width;          /* default width */
        const char id[32];      /* string used to specify the field */
        const char heading[32]; /* string printed in header */
        int (*report_fn)(struct dm_report *rh, struct dm_pool *mem,
                         struct dm_report_field *field, const void *data,
                         void *private);
        const char *desc;       /* description of the field */
};


I am running Debian unstable in 64 bits. Any Idea what I am doing wrong here?

Thank you.
