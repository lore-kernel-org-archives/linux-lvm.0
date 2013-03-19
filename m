Date: Tue, 19 Mar 2013 16:42:24 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130319164224.GI20480@agk-dp.fab.redhat.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
Subject: Re: [linux-lvm] [PATCH 00/10] Enhancements to a clustered
	logical	volume activation
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
To: Vladislav Bogdanov <bubble@hoster-ok.com>
Cc: linux-lvm@redhat.com

So what I need is:

Separate out the fixes and minor changes that have no effect on support or
introduce new constraints on future changes.  Get those out of the way.

Then with what's left, sort out the impact in terms of additional support,
testing, constraints etc.  Then work out what the options are.
E.g. we support multiple lock managers.  How do your changes affect
each of these, including sanlock?

New features should only be available where they are tested and supported:
if some combination doesn't make sense or won't be tested properly, don't allow
that combination.  In extreme cases, use configure settings as the method of
control (e.g. if a distro decided it didn't want --node that would need to be a
configure option).  Man pages need to be correct - if an option doesn't work
with some lock manager, it should say that (or not mention it if under
configure's control).

Alasdair
