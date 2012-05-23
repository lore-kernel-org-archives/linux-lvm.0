MIME-Version: 1.0
In-Reply-To: <4FBD1D47.204@redhat.com>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<4FBCA5D6.60507@redhat.com>
	<CAOAgVpwKBXJBbzbcVFhxjN_SdvncN0Vae55MC+sLJ7H2hBHabw@mail.gmail.com>
	<4FBD03F0.9080809@redhat.com>
	<CAOAgVpzOjhKbR8VDseYRHe5wy5Uuaw4icmJ7FNbUCKcWADhnUw@mail.gmail.com>
	<4FBD1D47.204@redhat.com>
Date: Wed, 23 May 2012 13:00:45 -0500
Message-ID: <CAOAgVpz_b738-YwyUXMDMzjuzPYP_VV=YusaFjLVAUiMHvaOsA@mail.gmail.com>
From: Les Mikesell <lesmikesell@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: lvm@beer.org.uk, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 23, 2012 at 12:24 PM, Bryn M. Reeves <bmr@redhat.com> wrote:
>
>>> Just do the experimental installation on your second disk and
>>> leave the other one alone.
>>
>> That's a reasonable option too... �But it might not be the way you
>> want to end up.
>
> You have two disks. You want to put something new on one of them.
> Explain to me again why copying all the data from the first to the
> second before completely overwriting it with a new install does
> anything useful?

I normally want my data on two disks all of the time (and have a large
pile of failed drives waiting to be destroyed to back up the reasoning
there...).  But I might tolerate only one fresh copy for the duration
of testing a possible replacement OS/filesystem.  So in the 'break the
mirror' case, the copy is already there, and in an instantly usable
form if I want it back.

The unfortunate part is that most linux distributions don't allow
installation on a 'broken mirror' or have a way to convert from
non-raid to raid after the install the way you can on a windows server
- or if there is, I haven't found it.  So even if you like the new
replacement that you tried on the single-disk install, you have to
throw it away and re-install on raid in the end.

>> How is it not blind if it does not in fact know that a mirror is
>> or isn't complete? � Or at least if it doesn't give me the option
>> to say start only if it has at least one complete copy of the
>> data?
>
> Again: that is not what I said. Please read again. The --partial
> option is DESIGNED to activate devices with bits missing. If you use
> it you, the administrator are asking for that to happen. There is
> nothing blind about that.

So what is the command to start in the case where devices are missing,
but no bits?  That is, under conditions where it is reasonable to
start.

>
> I don't see how you construe from that that vgchange activates devices
> that it does not know are complete let alone how you get to it not
> giving you the option to avoid that. It is the default.

I construed that because you didn't say it is possible.  Half of a
mirror is complete, more or less by the definition of mirroring.  But
the device should know that, not the administrator.   The MD raid1
case is usually pretty simple, but I thought LVs could be spread
across devices in ways that the administrator (much less an operator)
of the machine might not know if a complete half of the mirror is
present or not or whether starting with --partial is a sane choice.

> How the administrator chooses to use or not use those tools while
> waiting for new features to arrive is entirely his or her own choice.

Personally, I've generally chosen not to use LVM at all most of the
time because it hasn't seemed to offer anything I'd want in a
real-world situation and adds unnecessary overhead, but maybe I'm just
missing something.  But it is extra work during installs to do my own
layout so I keep reading this list for something that might change my
mind...

-- 
  Les Mikesell
     lesmikesell@gmail.com
