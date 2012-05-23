Message-ID: <4FBD1D47.204@redhat.com>
Date: Wed, 23 May 2012 18:24:23 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<4FBCA5D6.60507@redhat.com>
	<CAOAgVpwKBXJBbzbcVFhxjN_SdvncN0Vae55MC+sLJ7H2hBHabw@mail.gmail.com>
	<4FBD03F0.9080809@redhat.com>
	<CAOAgVpzOjhKbR8VDseYRHe5wy5Uuaw4icmJ7FNbUCKcWADhnUw@mail.gmail.com>
In-Reply-To: <CAOAgVpzOjhKbR8VDseYRHe5wy5Uuaw4icmJ7FNbUCKcWADhnUw@mail.gmail.com>
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
To: Les Mikesell <lesmikesell@gmail.com>
Cc: lvm@beer.org.uk, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/23/2012 06:03 PM, Les Mikesell wrote:
> On Wed, May 23, 2012 at 10:36 AM, Bryn M. Reeves <bmr@redhat.com>
> wrote:
>> If your experiment involves completely overwriting the device
>> then what was the point of snapshotting or imaging it in the
>> first place?
> 
> So you have an instant 'undo'.

You already have one: switch to the second drive.

>> You're just wasting time, I/O bandwidth and storage lifetime 
>> shovelling data around for the purpose of immediately overwriting
>> it.
> 
> By definition you don't know the result an experiment.  You may
> want the new replacement, you may want to recover.

In this case you know very well the result; everything you just backed
up has been overwritten (at least to the point of being very hard to
recover). There is no point in doing that.

>> Just do the experimental installation on your second disk and
>> leave the other one alone.
> 
> That's a reasonable option too...  But it might not be the way you 
> want to end up.

You have two disks. You want to put something new on one of them.
Explain to me again why copying all the data from the first to the
second before completely overwriting it with a new install does
anything useful?

> How is it not blind if it does not in fact know that a mirror is
> or isn't complete?   Or at least if it doesn't give me the option
> to say start only if it has at least one complete copy of the
> data?

Again: that is not what I said. Please read again. The --partial
option is DESIGNED to activate devices with bits missing. If you use
it you, the administrator are asking for that to happen. There is
nothing blind about that.

The *default* is to refuse to ever activate any VG of any kind that
has missing devices.

In the case of mirrors vgchange /could/ figure out that all the
devices for one whole side are there and activate a consistent device
/without/ --partial but as Vic noticed that is not yet implemented.

I don't see how you construe from that that vgchange activates devices
that it does not know are complete let alone how you get to it not
giving you the option to avoid that. It is the default.

> If I have an MD device it will know whether it is reasonable to 
> assemble or not.   A missing member in raid1 is still reasonable
> to run since it still has a complete copy of the filesystems on
> it. Where is the 'start if reasonable' concept in LVM?    That is,
> if it won't start automatically with a missing mirror, it seems
> like I have to tell it to start even if it does not have a complete
> image - which doesn't seem reasonable.

Nobody is arguing that the handling of mirrored LVs cannot be
improved; I'd like to see vgchange apply the fault policy during
activation and tidy up automatically but this is not implemented today.

Right now the tools give the administrator a means to make the VG
consistent again and to reinstate mirroring for the LV on another
device if desired.

How the administrator chooses to use or not use those tools while
waiting for new features to arrive is entirely his or her own choice.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+9HUcACgkQ6YSQoMYUY961EACgzWdASkFnxjqAWD8HhOceN2EA
y5kAnR3BWTBQN5VGXgdS0+ReJM+T8Cqw
=2uxE
-----END PGP SIGNATURE-----
