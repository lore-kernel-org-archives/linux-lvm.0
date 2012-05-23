Message-ID: <4FBD03F0.9080809@redhat.com>
Date: Wed, 23 May 2012 16:36:16 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<4FBCA5D6.60507@redhat.com>
	<CAOAgVpwKBXJBbzbcVFhxjN_SdvncN0Vae55MC+sLJ7H2hBHabw@mail.gmail.com>
In-Reply-To: <CAOAgVpwKBXJBbzbcVFhxjN_SdvncN0Vae55MC+sLJ7H2hBHabw@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: lvm@beer.org.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/23/2012 04:21 PM, Les Mikesell wrote:
> On Wed, May 23, 2012 at 3:54 AM, Bryn M. Reeves <bmr@redhat.com>
> wrote:
>> 
>>> I'm not looking to have a LVM snapshot. I'm looking to have a 
>>> duplicate disk. This allows me to experiment on one, whilst
>>> keeping the other safe.
>> 
>> That's exactly what snapshots do.
> 
> If your experiment involves reinstalling an OS that reformats one
> of the drives, what will that do to your snapshot?

If your experiment involves completely overwriting the device then
what was the point of snapshotting or imaging it in the first place?

You're just wasting time, I/O bandwidth and storage lifetime
shovelling data around for the purpose of immediately overwriting it.

Just do the experimental installation on your second disk and leave
the other one alone.

> With MD raid1 you can just pull one of the mirrors and you are
> pretty safe.   Although I'm beginning to like ReaR 
> (http://rear.sourceforge.net/) as a backup mechanism that doesn't 
> require shutting down to do the backup and can restore to bare
> metal including reconstructing the underlying
> raid/lvm/filesystems. Clonezilla can work too, but you have to shut
> down for the save and it doesn't do raid (but on the plus side it
> can handle windows partitions).
> 
>> Patches are welcome. LVM is designed not to activate a partial
>> VG unless the user specifies --partial. This is because for
>> non-mirrored LVs activating without all PVs present would leave
>> holes in devices.
> 
> Wait, so LVM doesn't know if the volume it is starting is complete
> or not in the case of mirrors and --partial just blindly starts
> anyway?

Wait, what? I'm not sure how you got to that from the paragraph you
quoted. It's not what was stated and is not correct.

The --partial switch is *designed* for recovery scenarios where you
have one or more missing devices. The one and only thing --partial
does is to tell LVM to activate even though devices are missing and to
fill any gaps as best it can.

It's not "blindly" starting things - it is doing what the
administrator told it to do: attempt to activate a VG with missing
devices substituting the error target (or whatever the admin
configured as activation{missing_stripe_filler}) for any segments
allocated on missing devices.

> LVM doesn't know if the volume it is starting is complete or not in
> the case of mirrors

No. That's not what I said. I said that LVM will not start a VG that
has missing PVs unless --partial is specified because it could leave
holes in LVs (specifically non-mirrored LVs).

> That's one of those things where you have to ask what they were 
> thinking.

Actually, I have to ask that in regards to your mail ;-)

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+9A/AACgkQ6YSQoMYUY96h9gCfcP0XsBBnMMOFN+Lh+I5Mt6Bt
QNoAoMERSvumSpDryzvU8dqk4hdxtxMm
=kdRP
-----END PGP SIGNATURE-----
