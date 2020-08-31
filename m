Date: Mon, 31 Aug 2020 17:37:24 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200831223724.GB15486@redhat.com>
References: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
	<128df0c3-beeb-7f8a-e611-e1372185209c@redhat.com>
	<20200828182608.GA17233@redhat.com>
	<4cce4f81-24b6-3730-a331-8b31cf57cd51@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4cce4f81-24b6-3730-a331-8b31cf57cd51@suse.com>
Subject: Re: [linux-lvm] [PATCH] lib/metadata: add new api lv_is_available()
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
Cc: linux-lvm@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>

On Sun, Aug 30, 2020 at 11:49:38PM +0800, heming.zhao@suse.com wrote:
> in my opinion, the 'not available'

We already use the word available/unavailable in other ways, so let's use
"broken" for the moment, maybe we can find a better word.

'lvs -o broken' would report 0|1.  Choosing an attr letter to represent
that is not as important and can be decided on later.

> means the LV can't correctly do r/w io.
>
> for raid, if the missing or breaking underlying devs number beyond raid level limit. the 
> 'not available' shoud be display.
> 
> for linear, any one of underlying dev is missing, upper layer module like fs may don't work
> (e.g. missing first disk, fs will missing w/r first disk's super-block metadata). the
> 'not available' should be display.

That definition of "broken" could be a specific enough, if we can report
it accurately enough.  Do we need to say "io will succeed on the entire LV
(as far as lvm knows)"?  It would be nice to know in which cases lvm can
report it accurately, and in which cases lvm doesn't know enough to report
it accurately.  If it's not correct in many cases, then we should consider
a different definition (maybe raid-specific.)

> for other type LV, I don't have too much experience to answer this question.

Any LV not using raid (or mirror) will be equivalant to linear, and be
broken if a single disk is missing or broken.

Dave
