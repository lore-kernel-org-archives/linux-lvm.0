From: Marius Vollmer <marius.vollmer@redhat.com>
References: <87zjmxzmga.fsf@red.mvo.lan>, <87wqhp4f7d.fsf@red.mvo.lan>,
	<52E28081.50308@redhat.com>
In-reply-to: <52E28081.50308@redhat.com>
Date: Mon, 27 Jan 2014 09:37:56 +0200
Message-ID: <8761p5q3hn.fsf@red.mvo.lan>
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

> Thing with setting variables is that we need to rely on others to properly
> check this variable - and each variable coming from different subsystems has
> a different name. Would be really great if we have a more decent way
> how to mark devices as private where with the "private" I mean that it can
> be processed only by the subsystem that claims it.

I don't know whether it is at all feasible, but what about using
something like SUBSYSTEM="proto-block" for devices that are not general
purpose block devices (yet).  For example, a device mapper node would
start out as a proto-block, and could be changed to a block via dmsetup.

That would be a fundamental change, though, and might cause more
breakage than it helps to clean things up.

> For example, even systemd tries to gather this information from
> various sources and sets SYSTEMD_READY=0/1 (see also
> https://github.com/systemd/systemd/blob/master/rules/99-systemd.rules.in)
> (unfortunately, systemd is not the only one in the world, there are
> alternatives, that's why having this info directly in sysfs would make
> more sense as it's global).

Yeah, but on the other hand, everone might have their own slight
variation on what to ignore exactly.  For example, systemd seems to
ignore encrypted but unformatted block devices for some reason, while
the guy who is actually going to format them (maybe UDisks2) probably
doesn't want to ignore them.

But, yes, it would be good if everyone could start from a sane setup and
then add exceptions to it.
