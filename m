Received: from [10.34.130.232] (dhcp130-232.brq.redhat.com [10.34.130.232])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uATFxCeQ020704
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2016 10:59:13 -0500
References: <59a4ab68-65cc-5205-65c6-6cd7ea41f582@topit.si>
	<77c42b07-5af7-a297-4562-cb4fcd9642c0@topit.si>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <71a09047-1d6c-88b0-84d7-88049a5bbd15@redhat.com>
Date: Tue, 29 Nov 2016 16:59:12 +0100
MIME-Version: 1.0
In-Reply-To: <77c42b07-5af7-a297-4562-cb4fcd9642c0@topit.si>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] deadlock during lvm snapshot target
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 29.11.2016 v 11:28 Tomaz Beltram napsal(a):
> On 29. 11. 2016 09:38, Zdenek Kabelac wrote:
>>
>> Please switch to newer version of lvm2.
>>
>> Sequence with snapshot activation had been reworked to minimize possibility
>> to hit this kernel race - race is still there even with the latest kernel, but in the real world you should not have a much chance to hit it.
> Thanks for the explanation. I reported this to Ubuntu launchpad. Please add
> your votes.
>
> https://bugs.launchpad.net/ubuntu/+source/lvm2/+bug/1645636
>


Yep just a minor comment - it's not 'fixed' - but the chance to hit the race 
have been considerably decreased - but we still have an example where it could 
be demonstrated (and it's not just 'dm' - it's more generic - see Mikulas's post)

Regards

Zdenek
