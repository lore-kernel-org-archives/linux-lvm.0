Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r52DFD85002160
	for <linux-lvm@redhat.com>; Sun, 2 Jun 2013 09:15:13 -0400
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r52DFCFr014769
	for <linux-lvm@redhat.com>; Sun, 2 Jun 2013 09:15:12 -0400
Received: by mail-pd0-f170.google.com with SMTP id x10so4446633pdj.1
	for <linux-lvm@redhat.com>; Sun, 02 Jun 2013 06:15:12 -0700 (PDT)
Received: from gmail.com (nat-pool-pnq-t.redhat.com. [209.132.188.26])
	by mx.google.com with ESMTPSA id aj2sm55014535pbc.1.2013.06.02.06.15.10
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 06:15:11 -0700 (PDT)
Date: Sun, 2 Jun 2013 03:39:45 -0400
From: Kumar amit mehta <gmate.amit@gmail.com>
Message-ID: <20130602073945.GA30753@gmail.com>
References: <20130602033724.GA17194@gmail.com>
	<20130602035010.GB17194@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20130602035010.GB17194@gmail.com>
Subject: Re: [linux-lvm] segfault with pvcreate command
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

On Sat, Jun 01, 2013 at 11:50:10PM -0400, Kumar amit mehta wrote:
> However, I'd appreciate a lot if you can look into my concern, mentioned
> in "Q3" in my previous mail and guide me to build the debug package of
> lvm2.

Figured, how to build the binaries(pvcreate,etc) with debugging symbols.
# ./configure CFLAGS=-g

-Amit
