Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2RM1jj08850
	for <linux-lvm@redhat.com>; Sat, 27 Mar 2004 17:01:45 -0500
Received: from email02.aon.at (WARSL402PIP7.highway.telekom.at [195.3.96.94])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2RM1i1X029907
	for <linux-lvm@redhat.com>; Sat, 27 Mar 2004 17:01:44 -0500
From: Manfred Koizar <mkoi-pg@aon.at>
Date: Sat, 27 Mar 2004 23:03:09 +0100
Message-ID: <06sb60hni6h5cok941gqnuo4ld1b0v1rgi@email.aon.at>
References: <200403262200.i2QM04223972@mail.osdl.org>
In-Reply-To: <200403262200.i2QM04223972@mail.osdl.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [HACKERS] PostgreSQL block size vs. LVM2 stripe
	width
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
Content-Type: text/plain; charset="us-ascii"
To: markw@osdl.org
Cc: linux-lvm@redhat.com, linux-ia64@vger.kernel.org, pgsql-hackers@postgresql.org

Mark,

how often did you run your tests?  Are the results reproduceable?

On Fri, 26 Mar 2004 14:00:01 -0800 (PST), markw@osdl.org wrote:
>                        Linux-2.6.3, LVM2 Stripe Width
>                        (going across)
>PostgreSQL
>BLCKSZ
>(going down)    16 KB   32 KB   64 KB   128 KB  256 KB  512 KB
>2 KB            2617    2656    2652    2664    2667    2642
>4 KB            4393    4486    4577    4557    4511    4448
>8 KB            4337    4423    4471    4576    4111    3642
>16 KB           4412    4495    4532    4536    2985    2312
>32 KB           3705    3784    3886    3925    2936    2362

Unless someone can present at least an idea of a theory why a BLCKSZ of
8 KB is at a local minimum (1 or 2% below the neighbouring values) for
stripe widths up to 64 KB I'm not sure whether we can trust these
numbers.

Before I hit the send button, I did a quick check of the link you
provided.  The links in the table contain the following test numbers:

        16 KB   32 KB   64 KB   128 KB  256 KB  512 KB
2 KB     72      71      70       69      66      65
4 KB     64      63      62       61      60      58
8 KB     54      53      52       51      50      49
16 KB    79      78      77       76      75      74
32 KB    86      85      84       83      82      80

Does this mean that you first ran all test with 8 KB, then with 4, 2, 16
and 32 KB BLCKSZ?  If so, I suspect that you are measuring the effects
of something different.

Servus
 Manfred
