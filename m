Message-ID: <4F86C1F4.4080809@redhat.com>
Date: Thu, 12 Apr 2012 12:52:20 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <1875424017.355888.1334230891233.JavaMail.root@nelson.canoo.com>
In-Reply-To: <1875424017.355888.1334230891233.JavaMail.root@nelson.canoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Hide volume group during startup
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Erik Schwalbe <erik.schwalbe@canoo.com>

On 04/12/2012 12:41 PM, Erik Schwalbe wrote:
> Hi,
> 
> filter was:
> 
> filter = [ "r|/dev/data/kvm_disk0|" ]
> 
> path:
> /dev/data/kvm_disk0 -> ../mapper/data-kvm_disk0

To filter a device-mapper device you also have to filter out the
/dev/dm-N device nodes that udev manages. There's also a symlink from
/dev/$VG_NAME/$LV_NAME to the dm-N node (although I think that should be
handled by filtering /dev/dm-N).

I'd be using something like:

    [ "r|/dev/dm.*|", "r|/dev/$VG_NAME|", "a|.*|"]

Alternately (and I prefer this for many configurations) you can accept
("a|..|") the device you need for the data VG and reject all other
devices ("r|.*|").

> The device name is stable, but what other way of control activation are possible??

Tags but since you're not currently filtering dm-N nodes I would try
that first.

Regards,
Bryn.
