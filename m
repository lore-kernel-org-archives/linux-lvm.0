References: <CABWX_dqg3za8oGq9-ohoCvDiJbmLs36Jgqy2a6NSa82Gxrr8tg@mail.gmail.com>
	<ebead878-135f-a69c-455a-0c08e4947996@redhat.com>
	<20170829162340.GB12503@redhat.com>
	<CABWX_dqRON_r+NdkUKT7FKjKbqxYG2gE4J=LbMQc6Mxx4O2Dxw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <dc1799b9-07ff-b0b9-d152-4102d878422e@redhat.com>
Date: Thu, 31 Aug 2017 10:08:47 +0200
MIME-Version: 1.0
In-Reply-To: <CABWX_dqRON_r+NdkUKT7FKjKbqxYG2gE4J=LbMQc6Mxx4O2Dxw@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Kalyana sundaram <kalyanceg@gmail.com>

Dne 31.8.2017 v 08:32 Kalyana sundaram napsal(a):
> Thanks all people
> I understand reboot/fencing is mandatory
> I hope the visibility might be better in external locking tool like redis
> With lvmlockd I find no deb available for ubuntu, and documentations for clvm 
> to handle an issue is difficult to find

Unfortunately  Debian based distros are not 'the best fit' for anything lvm2 
related and it's not lvm2 fault ;) and it's pretty hard to fix....

Maybe you can try some other distro ?
Or eventually building things from source ?


Regards


Zdenek
