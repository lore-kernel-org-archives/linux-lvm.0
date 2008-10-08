Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m98ElAp1023701
	for <linux-lvm@redhat.com>; Wed, 8 Oct 2008 10:47:10 -0400
Date: Wed, 8 Oct 2008 15:45:25 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Question regarding liblvm2cmd
Message-ID: <20081008144525.GE23898@agk.fab.redhat.com>
References: <1221277437.5569.193.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1221277437.5569.193.camel@localhost.localdomain>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: echo@echoreply.us.redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Sep 13, 2008 at 11:43:57AM +0800, Tim Post wrote:
> I noticed that lvm2_run() only has a few possible return values and does
> not set a global errno to give more information as to why something may
> have failed. I inspected lvm2_run() and _run_command() in tools/.

This is a tricky one.  Work has begun on developing a proper library,
but the error handling mechanism is not yet resolved.  I am reluctant to
see 1001 specific lvm2 error codes introduced - this would be a
maintenance and documentation headache - but doing things errno-style
might be an acceptable compromise.  My question is usually: 'But how can
the caller make genuine use of the error code?' - if it failed, it
failed, how does having a specific error code really help?

Alasdair
-- 
agk@redhat.com
