Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5DMx9gu021007
	for <linux-lvm@redhat.com>; Sun, 13 Jun 2010 18:59:09 -0400
Received: from smtp2.pacifier.net (smtp2.pacifier.net [64.255.237.172])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5DMwwRj021375
	for <linux-lvm@redhat.com>; Sun, 13 Jun 2010 18:58:58 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	by smtp2.pacifier.net (Postfix) with ESMTP id 17BBF6A440
	for <linux-lvm@redhat.com>; Sun, 13 Jun 2010 15:58:58 -0700 (PDT)
From: ben scott <benscott@nwlink.com>
Date: Sun, 13 Jun 2010 15:58:56 -0700
References: <201006121643.03778.benscott@nwlink.com>
	<20100613215446.GA15698@agk-dp.fab.redhat.com>
In-Reply-To: <20100613215446.GA15698@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201006131558.57093.benscott@nwlink.com>
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
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Sunday, June 13, 2010 02:54:46 pm Alasdair G Kergon wrote:
> On Sat, Jun 12, 2010 at 04:43:03PM -0700, ben scott wrote:
> > Any Idea what I am doing wrong here?
> 
> Not without seeing the code up to the point of the error.
> Sometimes the output of 'gcc -E' or language-specific syntax
> highlighting modes of editors help you to see what's going wrong.
> 
> Alasdair

The code was simply the include statement itself, it was at the top
of the file. 

#include <lvm2app.h>

I haven't tried to actually use the library yet.
