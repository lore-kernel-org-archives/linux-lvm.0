Date: Tue, 14 Jul 2020 11:05:56 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200714160556.GA16281@redhat.com>
References: <1juzXg-0002Wp-5c@mx1.helsinki.tools>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1juzXg-0002Wp-5c@mx1.helsinki.tools>
Subject: Re: [linux-lvm] RAID-less parity?
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
Content-Type: text/plain; charset="iso-8859-1"
To: Janne =?iso-8859-1?B?SGXf?= <janne+lvm@hess.ooo>
Cc: linux-lvm@redhat.com

On Mon, Jul 13, 2020 at 04:34:52PM +0200, Janne He=EF=BF=BD wrote:
> However some of my systems are single-disk systems. For those, RAIDs are
> not possible so I was thinking if LVM has some support for single-PV
> setups with parity on the same PV.

Hi,

We didn't include integrity+linear because we didn't see much value in it,
since it would require going to backups in case of an integrity failure.

> While this is probably a niche feature right now, I can see other
> projects like Stratis benefit from the integrity checks provided by
> dm-integrity (and dm-crypt in the future) to detect (and thanks to
> parity fix) bit rots.

dm-integrity will detect but not fix bit rot.

> So is there any way to get a parity setup with the current state of LVM?
> I was thinking of a RAID-4 with one PV but the current tooling (more
> specifically lvcreate) doesn't let me do that.

It's not currently possible.  We had an implementation for this we could
bring back if there is enough interest, so we'd like to hear more about
how this would be useful for you and others.

Thanks,
Dave
