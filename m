Received: from [10.43.17.41] (unknown [10.43.17.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDBE95C684
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 11:20:51 +0000 (UTC)
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
Date: Mon, 11 Sep 2017 13:20:51 +0200
MIME-Version: 1.0
In-Reply-To: <7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: linux-lvm@redhat.com

Dne 11.9.2017 v 12:55 Xen napsal(a):
> Zdenek Kabelac schreef op 11-09-2017 12:35:
> 
>> As thin-provisioning is about 'promising the space you can deliver
>> later when needed'� - it's not about hidden magic to make the space
>> out-of-nowhere.
>> The idea of planning to operate thin-pool on 100% fullness boundary is
>> simply not going to work well - it's� not been designed for that
>> use-case
> 
> I am going to rear my head again and say that a great many people would 
> probably want a thin-provisioning that does exactly that ;-).
> 

Wondering from where they could get this idea...
We always communicate clearly - do not plan to use 100% full unresizable 
thin-pool as a part of regular work-flow - it's always critical situation 
often even leading to system's reboot and full check of all volumes.

> I mean you have it designed for auto-extension but there are also many people 
> that do not want to auto-extend and just share available resources more flexibly.
> 
> For those people safety around 100% fullness boundary becomes more important.
> 
> I don't really think there is another solution for that.
> 
> I don't think BTRFS is really a good solution for that.
> 
> So what alternatives are there, Zdenek? LVM is really the only thing that 
> feels "good" to us.
> 

Thin-pool  needs to be ACTIVELY monitored and proactively either added more PV 
free space to the VG or eliminating  unneeded 'existing' provisioned blocks 
(fstrim,  dropping snapshots, removal of unneeded thinLVs.... -  whatever 
comes on your mind to make a more free space in thin-pool  - lvm2 fully 
supports now to call 'smart' scripts directly out of dmeventd for such action.


It's illusion to hope anyone will be able to operate lvm2 thin-pool at 100% 
fullness reliable - there should be always enough room to give 'scripts'
reaction time to gain some more space in-time  - so thin-pool can serve free 
chunks for provisioning - that's been design - to deliver blocks when needed,
not to brake system

> Are there structural design inhibitions that would really prevent this thing 
> from ever arising?

Yes, performance and resources consumption.... :)

And there is fundamental difference between full 'block device' sharing
space with other device - compared with single full filesystem - you can't 
compare these 2 things at all.....


Regards


Zdenek
