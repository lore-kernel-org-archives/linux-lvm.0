References: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
	<55ED3D10.4070203@redhat.com> <55ED77AA.7030708@redhat.com>
	<5012B517-1C69-427E-8BF5-9C35F48F40C5@arachsys.com>
	<55ED8DC0.40302@redhat.com>
	<B5E3ACA3-D8D1-49F5-A195-EE2345F4B79A@arachsys.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <55ED96F9.8020809@redhat.com>
Date: Mon, 7 Sep 2015 15:54:01 +0200
MIME-Version: 1.0
In-Reply-To: <B5E3ACA3-D8D1-49F5-A195-EE2345F4B79A@arachsys.com>
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

On 09/07/2015 03:44 PM, Chris Webb wrote:
> (I note from the pvscan(8) man page that global_filter applies to pvscan
> --cache but not standard filter, which sounds like another good reason
> to switch to global_filter!)

Yes, exactly. The idea behind filter and "global_filter" split is that
the global_filter applies globally on system scope (in our context of
lvmetad, it means lvmetad will see everything that "global_filter" allows,
not taking care about the "filter").

Then each LVM client (all LVM commands except pvscan --cache) can use
different "filter" for the information that lvmetad returns.

So you have two levels of filtering here: global one and client-side one
(that's exactly the split between "to update lvmetad" and
"to retrieve info from lvmetad" filter chain I described in my previous
post).

-- 
Peter
