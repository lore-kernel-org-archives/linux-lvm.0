Message-ID: <5225BFF0.2040300@redhat.com>
Date: Tue, 03 Sep 2013 12:54:40 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <521871FD.8000700@mglug.de>
In-Reply-To: <521871FD.8000700@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] howto speed-up thinpool-devices?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Oliver Rath <rath@mglug.de>

Dne 24.8.2013 10:42, Oliver Rath napsal(a):
> Hi list,
>
> Im using thinpool-devices (and snapshots, too). I know, thinpool-devices
> arent the fastest one, but maybe there could make more use of read (and
> maybe write) caching. In my test-system are 32GB of ram, but there is a
> max use of cache about <1GB, not more, by heavily use of these devices.
>
> Is it possible to speed up the reading with growing up the cache use?
> The /sys/block/dm-X/.. directories have lots of parameters, but Im not
> experienced for that. Maybe Im looking at the wrong place and modifying
> kernel parameters (scheduler etc.) are the better way?
>


You  could look at lot of Howto text around various kernel settings i.e.:

http://en.wikipedia.org/wiki/Swappiness
https://www.kernel.org/doc/Documentation/sysctl/vm.txt

Check with Google for more hints.

Zdenek
