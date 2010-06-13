Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5DMPUT8017265
	for <linux-lvm@redhat.com>; Sun, 13 Jun 2010 18:25:30 -0400
Received: from mail-vw0-f46.google.com (mail-vw0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5DMPLhG017350
	for <linux-lvm@redhat.com>; Sun, 13 Jun 2010 18:25:21 -0400
Received: by vws18 with SMTP id 18so1269883vws.33
	for <linux-lvm@redhat.com>; Sun, 13 Jun 2010 15:25:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201006121643.03778.benscott@nwlink.com>
References: <201006121643.03778.benscott@nwlink.com>
Date: Sun, 13 Jun 2010 15:25:20 -0700
Message-ID: <AANLkTimOFnUC_-GxoEjc_jA-qWbjtTma6pGNCxGywcG0@mail.gmail.com>
From: Bryan Whitehead <driver@megahappy.net>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] problem #including <lvm2ap.h> using cvs
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Are you using g++ instead of gcc to compile? The code block I'm
looking at looks like C code, but that error is C++.

On Sat, Jun 12, 2010 at 4:43 PM, ben scott <benscott@nwlink.com> wrote:
> I want to start putting the lvm library in my app but have run into a snag.
> When I put the line:
>
> #include <lvm2app.h>
>
> in my program, I get the following error:
>
> �In file included from /usr/include/lvm2app.h:17,
>
> /usr/include/libdevmapper.h:1025: error: expected �,� or �...� before
> �private�
> /usr/include/libdevmapper.h:1047: error: expected �,� or �...� before
> �private�
>
> The relevant portion of libdevmapper.h look like this:
>
> struct dm_report_field_type {
> � � � �uint32_t type; � � � � �/* object type id */
> � � � �uint32_t flags; � � � � /* DM_REPORT_FIELD_* */
> � � � �uint32_t offset; � � � �/* byte offset in the object */
> � � � �int32_t width; � � � � �/* default width */
> � � � �const char id[32]; � � �/* string used to specify the field */
> � � � �const char heading[32]; /* string printed in header */
> � � � �int (*report_fn)(struct dm_report *rh, struct dm_pool *mem,
> � � � � � � � � � � � � struct dm_report_field *field, const void *data,
> � � � � � � � � � � � � void *private);
> � � � �const char *desc; � � � /* description of the field */
> };
>
>
> I am running Debian unstable in 64 bits. Any Idea what I am doing wrong here?
>
> Thank you.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
