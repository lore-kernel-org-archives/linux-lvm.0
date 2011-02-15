Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1FD2XR3023825
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2011 08:02:33 -0500
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1FD2Luo022858
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2011 08:02:21 -0500
Received: by bwz15 with SMTP id 15so405925bwz.33
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2011 05:02:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20110214181448.GC5825@agk-dp.fab.redhat.com>
References: <AANLkTi=sSJiVJkqOojR7HUs=STDR1-wXNEqaHsv7smWP@mail.gmail.com>
	<20110214103112.4fb76864@bettercgi.com>
	<AANLkTimT06YazYy8LWGQY46X_uq9QN+XCSA9cLhwQWSB@mail.gmail.com>
	<20110214181448.GC5825@agk-dp.fab.redhat.com>
Date: Tue, 15 Feb 2011 07:02:20 -0600
Message-ID: <AANLkTinLKNDt9XypbmsTZBRUPuOZty710geV5ku-CR6V@mail.gmail.com>
From: Jeff <jlar310@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvcreate and lvremove --quiet option is not quiet
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
To: linux-lvm@redhat.com

On Mon, Feb 14, 2011 at 12:14 PM, Alasdair G Kergon <agk@redhat.com> wrote:
> The simple problem is that the code today does not distinguish between
> essential output (to stdout) and incidental output (to stdout).
>
> If I run 'pvs' I expect a list of PVs.
> If I run 'pvs --quiet' do I still expect to see that list?
>
> Today, there is no distinction: pvs output and the message you're wanting
> to suppress are the same category of message.

Yes, there should be a difference between "do-something" commands and
"tell-me-something" commands. I hope there aren't too many cases where
that's a gray area.

> The fix is to introduce a new macro alongside log_print so we can distinguish
> between the two cases, then have --quiet discard the incidental output and
> review every instance of log_print to see if it needs moving into the 'discard
> if quiet' category. �Also provide an lvm.conf option to make --quiet the default
> for those who want that. �etc.


Jeff
