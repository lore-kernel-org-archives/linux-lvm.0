Message-ID: <51FF69EF.7060303@redhat.com>
Date: Mon, 05 Aug 2013 11:01:35 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAETiKr-D5XPJ5oB+Pn2HOMAUNONrQ6Y-3L=XWNtppQSePx2bdg@mail.gmail.com>
	<51FF6818.5000801@redhat.com>
In-Reply-To: <51FF6818.5000801@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Linux LVM online shrinking :(
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
Cc: DILIP KURUMANGHAT <dilip.kurumanghat@gmail.com>

Dne 5.8.2013 10:53, Zdenek Kabelac napsal(a):
> Dne 1.8.2013 11:00, DILIP KURUMANGHAT napsal(a):
>> Hi Team,
>>
>> You might already have come across this stuff many a times.
>>
>> I am sending this query as to why LVM is not supporting online shrink.
>> How is that AIX can do the shrink but not in our best Linux.
>>
>> Is there a big difference i the underlying architecture which prevents us from
>> an online shrink?
>>
>
> You are asking this question on a wrong mailing list.
>
> LVM2 of course does fully support online device shrink.
>
> The other side of story is - there is no filesystem I'd know about which
> would be supporting online shrinking.  The fact is - it's pretty hard

Except for btrfs - which on the other hand doesn't need  lvm2.
So if you need something shrinkable online - try to go with btrfs.

Zdenek
