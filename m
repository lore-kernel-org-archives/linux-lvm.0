Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4DHj66S030971
	for <linux-lvm@redhat.com>; Thu, 13 May 2010 13:45:06 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4DHio8b016180
	for <linux-lvm@redhat.com>; Thu, 13 May 2010 13:44:51 -0400
Received: by wyb32 with SMTP id 32so1103791wyb.33
	for <linux-lvm@redhat.com>; Thu, 13 May 2010 10:44:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100513170253.GA16374@redhat.com>
References: <AANLkTik4sH2MlJ21brfAT5ZmNTcl6FUd7VzO4cnxwAxZ@mail.gmail.com>
	<20100513170253.GA16374@redhat.com>
Date: Thu, 13 May 2010 12:44:49 -0500
Message-ID: <AANLkTinGnonRGhPz8W8-7V878ddJy8eZYBo-akbs3n29@mail.gmail.com>
From: Richard Shaw <hobbes1069@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Status of LVM snapshot merging
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, May 13, 2010 at 12:02 PM, Mike Snitzer <snitzer@redhat.com> wrote:
> On Thu, May 13 2010 at 11:52am -0400,
> Richard Shaw <hobbes1069@gmail.com> wrote:
>
>> There does not seem to be much information available on the status of
>> LVM snapshot merging available. I looked at the patches available from
>> the original author and both my kernel and LVM versions are newer than
>> what he provides patches for.
>
> I'm not sure where you're looking for status but both the upstream
> linux-2.6 and LVM2 sources are quite public.

I only did google searching so I didn't get to the source level...

> The snapshot-merge target support was included in Linux v2.6.33.
> The corresponding LVM2 support was fully baked with v2.02.62, there were
> also 2 fixes in v2.02.64.

That explains it for me. I'm running Fedora 12 so my current
kernel/lvm versions are 2.6.32 and 2.02.53 respectively. It looks like
Fedora 13 will have the required versions, but I actually would like
the merge option in order to upgrade to F13 beta with the ability to
roll back.

>> In lieu of the feature being available, does anyone know if it would
>> be possible to use rsync to effectivly merge a snapshot volume with
>> its origin volume?
>>
>> If so, my plan was to try an extensive upgrade of my system on the
>> snapshot volume. If all goes well, I would then rsync the snapshot
>> back to the origin, update my fstab, and remove the snapshot. If it
>> does not go well, that's the easy part, just drop the snapshot and go
>> back to the origin.
>
> I'm not going to comment on using rsync as a poor-man's rollback
> mechanism. �The snapshot-merge support is widely available so I think
> it'd be great if you gave it a try.
>
> So rsync aside, the problem with your proposed approach is two-fold:
> 1) having your package manager install into the snapshot LV.
> 2) getting your system to boot off the snapshot LV.
>
> These aren't insurmountable problems but they would need to be overcome
> and things _could_ get dicey.
>
> Generally the process is inverted: you make the changes to the system
> (after having created a snapshot). �If you don't like the changes you
> use 'lvconvert --merge ...' to merge the snapshot back to origin on the
> next reboot (reboot needed for the root LV). �This gives you instant
> rollback.

Thanks for the info! I may get brave and try to install the F13 kernel
and lvm2 package and see if I can get away with it. I will have to
update udev as well, right?

Thanks,
Richard
