References: <20190725184901.24234-1-julian.klode@canonical.com>
	<e14a2033-893a-0e0a-4e32-0a62883a9d25@redhat.com>
	<20190730151223.jfxvd2qwaf5jdjsm@jak-t480s>
	<01707c6d-1fe3-f52e-47de-b8b13502fd0c@redhat.com>
	<20190731093328.ily6u3xgpbnovyen@jak-t480s>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <dd20d3cf-36a8-167c-a46b-3f06bf27e079@redhat.com>
Date: Wed, 31 Jul 2019 12:16:37 +0200
MIME-Version: 1.0
In-Reply-To: <20190731093328.ily6u3xgpbnovyen@jak-t480s>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] Detect systemd at run-time in
	69-dm-lvm-metad.rules
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Julian Andres Klode <julian.klode@canonical.com>

Dne 31. 07. 19 v 11:33 Julian Andres Klode napsal(a):
> On Wed, Jul 31, 2019 at 11:21:10AM +0200, Zdenek Kabelac wrote:
>>> Debian and Ubuntu, as Debian requires support for non-systemd inits, and
>>> Ubuntu requires event-based root device finding in initramfs. Surely that's
> 
> This is nonsense. No Ubuntu release has systemd-based background scanning,
> and all of them work fine. Also, it's still possible to not use backgrounding
> by building lvm2 accordingly - so much for "not working".

lvm2 activation cannot be time-bounded by random udev-rule timeout
(being chosen by systemd/udev developers anywhere between 90-180seconds).

The fact it 'mostly' works is because majority of activations are finished
with this time constrain, but it doesn't make it 'a workable' solution.

So as long as there is 'randomly' killing udev timeout - we can't relocate
activation back into udev rule.

> In our current development series, we did merge the new change to enable
> the background handling from Debian, and this caused our initramfs to fail.

Sorry to say this, we are aware of several other non-upstream accepted 
'workarounds' within Debian lvm2 packages - I can only wish users affected 
with problems caused by these 'hacks' would be asking for repair and recovery 
scenarios only and directly their authors...

> Hence, this approach to revert to the previous behavior where needed (as it
> was clearly working), and still use systemd if available.

When it appears to work on a system with a single disk really doesn't make it 
'clearly working' - we are providing solution for thousands disks based 
heavily loaded servers as well, so there is not much wish to 'hack-in' 
occasionally working fix.

So some other proposal the offloads activation out of udev rule is needed.


Regards

Zdenek
