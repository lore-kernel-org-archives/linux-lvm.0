Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Chris Webb <chris@arachsys.com>
In-Reply-To: <55ED77AA.7030708@redhat.com>
Date: Mon, 7 Sep 2015 14:01:02 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <5012B517-1C69-427E-8BF5-9C35F48F40C5@arachsys.com>
References: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
	<55ED3D10.4070203@redhat.com> <55ED77AA.7030708@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: Richard Davies <richard.davies@elastichosts.com>, LVM general discussion and development <linux-lvm@redhat.com>

Peter Rajnoha <prajnoha@redhat.com> wrote:

> I'd advise you to use global_filter instead which should do the job
> you need as global_filter is always evaluated at the beginning of the  
> filter
> chain. It's also more appropriate to use global_filter in your case if you
> want to be sure that devices are filtered completely all the time, never
> scanned, even if you switched to using lvmetad.

Hi Peter. Yes, we switched our config to use global_filter when we hit the  
problem. Great to hear that's the more efficient way to leave it long-term  
anyway. (global_filter didn't exist as an option when I last touched that  
lvm.conf, but it definitely makes sense to be able to restrict the device  
tree before any other, potentially expensive, processing.)

We should probably look at running the new lvmetad ourselves too: thanks  
for the pointer. We do quite a few read only queries from our management  
layer using lvs, vgs and so on. Caching the meta data between invocations  
could make a lot of sense if the daemon's reasonably lightweight and  
doesn't pull in extra dependencies. (LVM can't interrogate our udev  
database, though, as we don't use udev to handle our kernel uevents.)

Best wishes,

Chris.
