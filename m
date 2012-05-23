Message-ID: <4FBCA5D6.60507@redhat.com>
Date: Wed, 23 May 2012 09:54:46 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
In-Reply-To: <54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fun and games with mirroring
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
To: lvm@beer.org.uk, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/22/2012 05:40 PM, Vic wrote:
>>> You can do it to a box that hasn't been set up with mdadm...
>> 
>> Sure but you will need LVM set up.
> 
> I always have.
> 
>> In that case, why not use LVM's snapshot capabilities?
> 
> Because that doesn't do what I want.
> 
> I'm not looking to have a LVM snapshot. I'm looking to have a
> duplicate disk. This allows me to experiment on one, whilst keeping
> the other safe.

That's exactly what snapshots do.

> Alternatively, it allows me to migrate from one disk to another
> without too much risk - before anyone points me at pvmove, I lost a
> filesystem when that fell over on a live machine once :-(

pvmove uses the exact same infrastructure as a mirrored LV; it just
constructs a temporary mirror over the source/destination extent
ranges, syncs it and breaks it leaving only the destination side
allocated so I wouldn't take past experience with pvmove as a reason
to prefer mirroring and splitting things.

> --splitmirrors would seem to do what I'm after *except* that it
> will leave the mirror unbootable without further attention (the
> machine won't boot with the wrong name on the LVs)

Sure but that's not an LVM problem - you're changing the name of
system LVs. That's always going to require some reconfiguration
(although in the snapshot case if you decide to keep the changes by
merging them back in the original LV name is preserved).

> This is true - but sorta misses the point; a LV mirror is not a LV
> mirror if it won't activate. Adding a mirror means that a faliure
> of *either* side renders the whole unusable.

Not really, it's just getting to where the problem is. LVM provides
tools to make a partial VG consistent again to allow activation of a
volume in the state you found. Right now this is not well integrated
with the initramfs activation - as you found it will break on a
partial volume group (any partial VG - mirroring is just a special
case of that where repair is more obvious and straightforward).

Fixing this properly may involve changes in both dracut and LVM.

> Well, we can call it Somebody Else's Problem, or perhaps LVM should
> be able to use a broken mirror - that's how every other mirror
> system works, and is generally the very reason for having a mirror
> at all. I consider this to be a bug within LVM.

Patches are welcome. LVM is designed not to activate a partial VG
unless the user specifies --partial. This is because for non-mirrored
LVs activating without all PVs present would leave holes in devices.
There is currently no logic to detect that the VG contains only
mirrored LVs and that sufficient PVs remain to allow safe conversion
to linear and activation. Implementing that would be a new feature.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+8pdYACgkQ6YSQoMYUY95QFgCg1aBWAC8CZ3UhaueXYrGcEYlK
zeYAn1dBCfkyv/DXGPMYueHnOEhn9dx0
=7uH9
-----END PGP SIGNATURE-----
