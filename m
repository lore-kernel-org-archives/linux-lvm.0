References: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
	<55ED3D10.4070203@redhat.com> <55ED77AA.7030708@redhat.com>
	<5012B517-1C69-427E-8BF5-9C35F48F40C5@arachsys.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <55ED8DC0.40302@redhat.com>
Date: Mon, 7 Sep 2015 15:14:40 +0200
MIME-Version: 1.0
In-Reply-To: <5012B517-1C69-427E-8BF5-9C35F48F40C5@arachsys.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] devices.filter changed behaviour in 80ac8f37d6
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
To: Chris Webb <chris@arachsys.com>
Cc: Richard Davies <richard.davies@elastichosts.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 09/07/2015 03:01 PM, Chris Webb wrote:
> Peter Rajnoha <prajnoha@redhat.com> wrote:
> 
>> I'd advise you to use global_filter instead which should do the job
>> you need as global_filter is always evaluated at the beginning of the
>> filter
>> chain. It's also more appropriate to use global_filter in your case if
>> you
>> want to be sure that devices are filtered completely all the time, never
>> scanned, even if you switched to using lvmetad.
> 
> Hi Peter. Yes, we switched our config to use global_filter when we hit
> the problem. Great to hear that's the more efficient way to leave it
> long-term anyway. (global_filter didn't exist as an option when I last
> touched that lvm.conf, but it definitely makes sense to be able to
> restrict the device tree before any other, potentially expensive,
> processing.)
> 
> We should probably look at running the new lvmetad ourselves too: thanks
> for the pointer. We do quite a few read only queries from our management
> layer using lvs, vgs and so on. Caching the meta data between
> invocations could make a lot of sense if the daemon's reasonably
> lightweight and doesn't pull in extra dependencies. (LVM can't
> interrogate our udev database, though, as we don't use udev to handle
> our kernel uevents.)

Yes, without lvmetad daemon, each LVM command needs to run full device
scan at its start to look for PVs and then when a PV is found, it needs
to read all LVM metadata it finds (and check for consistency etc etc).
Of course, not including those devices which are filtered out.

However, with lvmetad, you can save some disk access here since all the
metadata are taken from lvmetad cache...

If you're not using udev to handle kernel uevents (hmm, what are you using
then?), then you need to make sure that whatever is processing the uevents,
it needs to do the same or similar job as usual udev rules would do with udev.
See also https://git.fedorahosted.org/cgit/lvm2.git/tree/udev/69-dm-lvm-metad.rules.in.

That means, you need to make sure that lvmetad knows about each new PV
that appears - normally we run "pvscan --cache major:minor" to do this -
this is triggered on uevents.

For now, we officially support only udev with lvmetad. Lvmetad doesn't have
any extra deps except what lvm binary already has.

-- 
Peter
