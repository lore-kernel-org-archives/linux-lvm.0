MIME-Version: 1.0
In-Reply-To: <4FBD03F0.9080809@redhat.com>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<4FBCA5D6.60507@redhat.com>
	<CAOAgVpwKBXJBbzbcVFhxjN_SdvncN0Vae55MC+sLJ7H2hBHabw@mail.gmail.com>
	<4FBD03F0.9080809@redhat.com>
Date: Wed, 23 May 2012 12:03:01 -0500
Message-ID: <CAOAgVpzOjhKbR8VDseYRHe5wy5Uuaw4icmJ7FNbUCKcWADhnUw@mail.gmail.com>
From: Les Mikesell <lesmikesell@gmail.com>
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
Content-Transfer-Encoding: 7bit
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: lvm@beer.org.uk, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 23, 2012 at 10:36 AM, Bryn M. Reeves <bmr@redhat.com> wrote:
>>>
>> If your experiment involves reinstalling an OS that reformats one
>> of the drives, what will that do to your snapshot?
>
> If your experiment involves completely overwriting the device then
> what was the point of snapshotting or imaging it in the first place?

So you have an instant 'undo'.

> You're just wasting time, I/O bandwidth and storage lifetime
> shovelling data around for the purpose of immediately overwriting it.

By definition you don't know the result an experiment.  You may want
the new replacement, you may want to recover.

> Just do the experimental installation on your second disk and leave
> the other one alone.

That's a reasonable option too...  But it might not be the way you
want to end up.

>
>>> Patches are welcome. LVM is designed not to activate a partial
>>> VG unless the user specifies --partial. This is because for
>>> non-mirrored LVs activating without all PVs present would leave
>>> holes in devices.
>>
>> Wait, so LVM doesn't know if the volume it is starting is complete
>> or not in the case of mirrors and --partial just blindly starts
>> anyway?
>
> Wait, what? I'm not sure how you got to that from the paragraph you
> quoted. It's not what was stated and is not correct.
>
> The --partial switch is *designed* for recovery scenarios where you
> have one or more missing devices. The one and only thing --partial
> does is to tell LVM to activate even though devices are missing and to
> fill any gaps as best it can.
>
> It's not "blindly" starting things - it is doing what the
> administrator told it to do: attempt to activate a VG with missing
> devices substituting the error target (or whatever the admin
> configured as activation{missing_stripe_filler}) for any segments
> allocated on missing devices.

How is it not blind if it does not in fact know that a mirror is or
isn't complete?   Or at least if it doesn't give me the option to say
start only if it has at least one complete copy of the data?

>> LVM doesn't know if the volume it is starting is complete or not in
>> the case of mirrors
>
> No. That's not what I said. I said that LVM will not start a VG that
> has missing PVs unless --partial is specified because it could leave
> holes in LVs (specifically non-mirrored LVs).
>
>> That's one of those things where you have to ask what they were
>> thinking.
>
> Actually, I have to ask that in regards to your mail ;-)

If I have an MD device it will know whether it is reasonable to
assemble or not.   A missing member in raid1 is still reasonable to
run since it still has a complete copy of the filesystems on it.
Where is the 'start if reasonable' concept in LVM?    That is, if it
won't start automatically with a missing mirror, it seems like I have
to tell it to start even if it does not have a complete image - which
doesn't seem reasonable.

-- 
   Les Mikesell
     lesmikesell@gmail.com
