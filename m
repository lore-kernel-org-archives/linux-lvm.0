Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2QM0Ij25245
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 17:00:18 -0500
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2QM0H1X021873
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 17:00:18 -0500
Message-Id: <200403262200.i2QM04223972@mail.osdl.org>
Date: Fri, 26 Mar 2004 14:00:01 -0800 (PST)
From: markw@osdl.org
MIME-Version: 1.0
Subject: [linux-lvm] PostgreSQL block size vs. LVM2 stripe width
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pgsql-hackers@postgresql.org
Cc: linux-ia64@vger.kernel.org, linux-lvm@redhat.com

I have some results from DBT-2 testing PostgreSQL with difference block
sizes against different lvm stripe widths on Linux.  I've found that
iostat appears to report more erratic numbers as the block size of the
database increases but I'm not able to see any reason for it.

I have pg_xlog on a separate set of drives from the rest of the database
and was wondering if having different block sizes for the log and the
data has been discusses?

Or does anyone have any tips for an optimal combination of settings?

Here's a summary from an Itanium2 system, where bigger is better:

                        Linux-2.6.3, LVM2 Stripe Width
                        (going across)
PostgreSQL
BLCKSZ
(going down)    16 KB   32 KB   64 KB   128 KB  256 KB  512 KB
2 KB            2617    2656    2652    2664    2667    2642
4 KB            4393    4486    4577    4557    4511    4448
8 KB            4337    4423    4471    4576    4111    3642
16 KB           4412    4495    4532    4536    2985    2312
32 KB           3705    3784    3886    3925    2936    2362

Links to more data:
	http://developer.osdl.org/markw/lvm2/blocks.html

Mark
