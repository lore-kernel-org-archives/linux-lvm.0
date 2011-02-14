Date: Mon, 14 Feb 2011 18:14:49 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110214181448.GC5825@agk-dp.fab.redhat.com>
References: <AANLkTi=sSJiVJkqOojR7HUs=STDR1-wXNEqaHsv7smWP@mail.gmail.com>
	<20110214103112.4fb76864@bettercgi.com>
	<AANLkTimT06YazYy8LWGQY46X_uq9QN+XCSA9cLhwQWSB@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTimT06YazYy8LWGQY46X_uq9QN+XCSA9cLhwQWSB@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff <jlar310@gmail.com>
Cc: linux-lvm@redhat.com

The simple problem is that the code today does not distinguish between
essential output (to stdout) and incidental output (to stdout).

If I run 'pvs' I expect a list of PVs.
If I run 'pvs --quiet' do I still expect to see that list?

Today, there is no distinction: pvs output and the message you're wanting
to suppress are the same category of message.

The fix is to introduce a new macro alongside log_print so we can distinguish
between the two cases, then have --quiet discard the incidental output and
review every instance of log_print to see if it needs moving into the 'discard
if quiet' category.  Also provide an lvm.conf option to make --quiet the default
for those who want that.  etc.

Alasdair
