References: <CABWX_dqg3za8oGq9-ohoCvDiJbmLs36Jgqy2a6NSa82Gxrr8tg@mail.gmail.com>
	<ebead878-135f-a69c-455a-0c08e4947996@redhat.com>
	<20170829162340.GB12503@redhat.com>
	<CABWX_dqRON_r+NdkUKT7FKjKbqxYG2gE4J=LbMQc6Mxx4O2Dxw@mail.gmail.com>
	<dc1799b9-07ff-b0b9-d152-4102d878422e@redhat.com>
	<22952.25484.926754.730502@quad.stoffel.home>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <ea9df9a7-b55a-e5ee-7a0b-7ae93e0e8311@redhat.com>
Date: Fri, 1 Sep 2017 09:37:49 +0200
MIME-Version: 1.0
In-Reply-To: <22952.25484.926754.730502@quad.stoffel.home>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Distributed Locking of LVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>, John Stoffel <john@stoffel.org>
Cc: Kalyana sundaram <kalyanceg@gmail.com>

On 08/31/2017 09:29 PM, John Stoffel wrote:
>>>>>> "Zdenek" == Zdenek Kabelac <zkabelac@redhat.com> writes:
> 
> Zdenek> Dne 31.8.2017 v 08:32 Kalyana sundaram napsal(a):
>>> Thanks all people
>>> I understand reboot/fencing is mandatory
>>> I hope the visibility might be better in external locking tool like redis
>>> With lvmlockd I find no deb available for ubuntu, and documentations for clvm 
>>> to handle an issue is difficult to find
> 
> Zdenek> Unfortunately Debian based distros are not 'the best fit' for
> Zdenek> anything lvm2 related and it's not lvm2 fault ;) and it's
> Zdenek> pretty hard to fix....
> 
> Can you please elaborate on this?  I use Debian distros by
> preference. Is it because they've changed stuff to fit the debian
> ideals too much?  
It's more about the attitude of the lvm2 package maintenance in Debian.

There were times when certain things didn't work quite well because
there were changes done apart from upstream release and they were not
correct, causing various problems (e.g. Debian used changed udev rules
for some time which had some issues and even if upstream warned about
these issues right away, it took some time to fix them - by not using
these extra changes apart from upstream). Also, there were certain
decisions done for Debian's lvm2 package in the past like removing the
clvmd altogether from the package, not taking into account there might
be active users still and not providing any alternative properly (the
clvmd is now back).

So it's all about these issues and decisions which make lvm2 in Debian
not that trustworthy, at least not from upstream's perspective.

Things may have changed and improved these days, but upstream is now
very cautious when it comes to recommending Debian for lvm2 usage (that
also implies Ubuntu usage as the packages are somewhat inherited from
Debian there).

-- 
Peter
