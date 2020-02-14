Date: Fri, 14 Feb 2020 14:40:28 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20200214204028.GB20792@redhat.com>
References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
	<20200214191115.GA20792@redhat.com>
	<1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
Subject: Re: [linux-lvm] commit c527a0cbfc3 may have a bug
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: linux-lvm@redhat.com, heming.zhao@suse.com

On Fri, Feb 14, 2020 at 08:34:19PM +0100, Gionatan Danti wrote:
> Hi David, being filters one of the most asked questions, can I ask why we
> have so many different filters, leading to such complex interactions and
> behaviors?
> 
> Don't get me wrong: I am sure you (the lvm team) have very good reasons to
> do that, and I am surely missing something? But what, precisely? How should
> we (end users) consider filters? Should we only use global_filter?

You're right, filters are difficult to understand and use correctly.  The
complexity and confusion in the code is no better.  With the removal of
lvmetad in 2.03 versions (e.g. RHEL8) there's no difference between filter
and global_filter, so that's some small improvement.  But, I think filters
should be replaced or overhauled with something easier to use and more
useful at a technical level.

I've created a bz about that and welcome thoughts about what a replacement
should or should not be like.  With input the work is more likely to be
prioritized.

https://bugzilla.redhat.com/show_bug.cgi?id=1803266
