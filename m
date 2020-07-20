Date: Mon, 20 Jul 2020 12:54:16 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200720175416.GB8135@redhat.com>
References: <b482a655-342c-86f9-085d-e09a1ffe8bb0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b482a655-342c-86f9-085d-e09a1ffe8bb0@suse.com>
Subject: Re: [linux-lvm] Suggestion: lvm2 filters lib needs to show some
 readable info for end user
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
To: "heming.zhao@suse.com" <heming.zhao@suse.com>
Cc: linux-lvm@redhat.com

On Mon, Jul 20, 2020 at 07:02:15PM +0800, heming.zhao@suse.com wrote:
> So, in my opinion, I suggest there should be some code improvement for
> all filter failed info. Some filter failed debug log should convert from
> debug level to standard output level.

Yes, that's long standing annoyance, and it's simple to fix.  Added that
in the branch below, but it needs some tests, and it should probably be
used in some more places.
https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/dev-dct-filter-reason
