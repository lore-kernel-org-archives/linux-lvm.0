Date: Thu, 27 Sep 2018 12:35:51 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20180927173550.GB2706@redhat.com>
References: <CABZYMH498m-hNpkbAagiNPmFjFLrMZZZncx6S1ksupRVnPtYqw@mail.gmail.com>
	<20180925164405.GA10635@redhat.com>
	<CABZYMH57cROshtj0YMJ8PNU0Udw7qe0d7evuhc3-aXMYYEit3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZYMH57cROshtj0YMJ8PNU0Udw7qe0d7evuhc3-aXMYYEit3A@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] recovery lvmlockd after kill_vg
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
To: Damon Wang <damon.devops@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Sep 27, 2018 at 10:12:44PM +0800, Damon Wang wrote:
> Thank you for your reply, I have another question under such circumstances.
> 
> I usually run "vgck" to check weather vg is good, but sometimes it
> seems it stuck, and leave a VGLK on sanlock. (I'm sure io error will
> cause it, but sometimes not because io error)
> Then i'll try use sanlock client release -r xxx to release it, but it
> also sometimes not work.(be stuck)
> Then I may lvmlockctl -r to drop vg lockspace, but it still may stuck,
> and I'm io is ok when it stuck
> 
> This usually happens on multipath storage, I consider multipath will
> queue some io is blamed, but not sure.
> 
> Any idea?

First, you might be able to avoid this issue by doing the check using
something other than an lvm command, or perhaps and lvm command configured
to avoid taking locks (the --nolocking option in vgs/pvs/lvs).  What's
appropriate depends on specifically what you want to know from the check.

I still haven't fixed the issue you found earlier, which sounds like it
could be the same or related to what you're describing now.
https://www.redhat.com/archives/linux-lvm/2018-July/msg00011.html

As for manually cleaning up a stray lock using sanlock client, there may
be some limits on the situations that works in, I don't recall off hand.
You should try using the -p <pid> option with client release to match the
pid of lvmlockd.

Configuring multipath to fail more quickly instead of queueing might give
you a better chance of cleaning things up.

Dave
