From: Marius Vollmer <marius.vollmer@redhat.com>
References: <87zjmxzmga.fsf@red.mvo.lan>, <87y5265106.fsf@red.mvo.lan>,
	<52E269A8.9090707@redhat.com>
In-reply-to: <52E269A8.9090707@redhat.com>
Date: Fri, 24 Jan 2014 16:50:03 +0200
Message-ID: <87vbx94ep0.fsf@red.mvo.lan>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Identifying useable block devices
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
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Peter Rajnoha <prajnoha@redhat.com> writes:

> Thanks! Well, sorry for that, I've finally noticed the thing,
> that was another bug, unfortunately. Should be solved now with
> this git head in lvm2 upstream:
>   89d77326170d020ebba6ae1c717c08ac4b07996a
> (git.fedorahosted.org/git/lvm2.git)
>
> Thing is that the pool volume *should always* be marked
> as private which also means DM_UDEV_DISABLE_OTHER_RULES_FLAG
> is set.

Nice, thanks!

With this fixed, I have to ask again: Is _every_ situation where a block
device goes from public to private with a "change" event a bug?

I would say "yes", simply because I can't think of a situation where
LVM2 doesn't know from the start whether the device is creates is gonna
be public or private.

If so, we just keep UDisks2 as it is, I'd say, and I file bugs when I
find another public->private transition.
