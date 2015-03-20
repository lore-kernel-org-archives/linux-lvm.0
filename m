Received: from [10.36.7.174] (vpn1-7-174.ams2.redhat.com [10.36.7.174])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2KJOufS005423
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 15:24:57 -0400
Message-ID: <550C7408.3060704@redhat.com>
Date: Fri, 20 Mar 2015 20:24:56 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>	<54743766.7020502@redhat.com>	<CAE8gLh=yKODk+7OcyB8=X5Qp1haEYOZuzVb8g4wUdENogs7wng@mail.gmail.com>	<5474933E.8070007@redhat.com>	<CAE8gLh=pJLBeWSWCkDOomH-7XjBWHJjx9z4Ss2r+JBTokisUtA@mail.gmail.com>	<CAHDsjKvsC4J++4d1kdzP0wvhTYjxVEJxyTG5Gw9ETHGPc5uGrw@mail.gmail.com>	<CAE8gLh=ju97Ne0y=tyXej3Ugh21VBSZq2fM7HExjcpxC1wFGyA@mail.gmail.com>	<CAE8gLhmWKur6vWEzv=NF-psPyMxHrS3S4Tgr82HD168J4c59=w@mail.gmail.com>	<550B1E2D.2030206@gathman.org>
	<550BDABE.3060005@redhat.com>
	<CAE8gLh=-X76FjQHPa6pODcv+BZqXPKR1-=TxMcp=+TLQNNqiig@mail.gmail.com>
In-Reply-To: <CAE8gLh=-X76FjQHPa6pODcv+BZqXPKR1-=TxMcp=+TLQNNqiig@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM VG is not activated during system boot
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 20.3.2015 v 17:52 MegaBrutal napsal(a):
> I resend this message in plaintext, as I think the previous
> HTML-formatted one didn't reach the list, as I don't see it in the
> archives.
>
>
> 2015-03-20 9:30 GMT+01:00 Zdenek Kabelac <zkabelac@redhat.com>:
>> This problem with old snaps basically cannot be fixed unless there would be
>> a completely different new snapshot target ;)
>
> I understand this is a by-design feature of LVM snapshots, and I
> accept it as-is. The problem for me is not the long activation time,
> but the fact that initrd stops waiting for the full activation to
> complete. It gives up and kills the vgchange process.
>
> I understand initrd behaviour may be distro-specific.

Yes we try to fight this  'timeout' battle all the time - but we
are likely on the 'bad-side' of table.

Lot of people seem to believe timeouts will solve their problems :)

Anyway - you could either configure bigger timeout in your distro or you could 
pvmove COW devices on fast disks (SSDs) in your VG (if you have one) or simply 
not use snapshot of larger sizes (which is IMHO always good idea).



>> So the advised fix for long term snapshot is to switch to use thin-pool.
>>
>> Here you will have all the goodies - very fast and efficient snapshots, you
>> could easily take snapshot of snapshot and you could also select if you want
>> to have snapshot activated or not (and by default it's skipped from
>> activation).
>
> Well, thin pools seem nice, but I don't see them being matured enough
> for production use. For example, basic VG management like reducing or
> splitting a VG failed for me when a thin pool was present in the VG,
> even if the split would have not affected the thin pool itself. I also
> failed to get rid of missing PVs when a thin pool would have been
> affected – while „vgreduce --removemissing --force” promises to remove
> affected LVs, it couldn't get rid of the thin pool. When I posted a
> thread about the issue here, no one bothered to answer.
> (It is here: https://www.redhat.com/archives/linux-lvm/2015-March/msg00001.html)

Fill bug please...

>
> Also, as far as I know, thin snapshots can only be created of thin LVs
> residing in the same thin pool. That means, you can't make a thin
> snapshot of any LV, and one shouldn't keep critical LVs (e.g. root FS)
> in thin pools.

Yes there are going to be some more improvements on thin-pool side, to better 
support logic that you have always some fully-provisioned origin, just 
snapshots may fail.

Regards

Zdenek
