Received: from [10.36.4.25] (vpn1-4-25.ams2.redhat.com [10.36.4.25])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1AGLI1D032056
	for <linux-lvm@redhat.com>; Mon, 10 Feb 2014 11:21:19 -0500
Message-ID: <52F8FC7E.3080109@redhat.com>
Date: Mon, 10 Feb 2014 17:21:18 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <52F8CEEA.1070105@mglug.de>
In-Reply-To: <52F8CEEA.1070105@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thinpool undeleteable after server crash
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
To: linux-lvm@redhat.com

Dne 10.2.2014 14:06, Oliver Rath napsal(a):
> Hi list,
>
> Im using here lvm 2.02.104 with kernel 3.11 and today the server
> crashed, so I had to power off and reboot the machin (dont know why at
> the mom). After this, the used thinpool-device got an unrecoverable
> error (thin_repair didnt help) so i tried to remove the whole vg
> including the thinpool and its depending devices, which didnt work.
>
> My only working solution was to overwrite the the first 30MB or the
> beginning of the used pv with zeroes (dd if=/dev/zero of=/dev/sda1),
> then to reboot and NOW to recreate the whole thing.
>
> This seems not to be the best solution for this, so here my questions:
>
> Is it possible to force recreate of a thinpool device when it is
> crashing? What can I do to avoid unrecoverable errors on thinpools? Is
> there a better possibility for recreation of pv/vg/thinpools?

Developer are quite interested in any thin pool corruptions you could have.

There is of course 'final way' to remove thin pool -
'vgcfgbackup' your metadata - removed offending volumes
(thinpool + thin volumes) in text editor
and 'vgcfgrestore'.

But - thin recovery tools are there to fix it - and if they fail,
it would be good to get such problematic metadata for analysis,
before they are removed.

Zdenek
