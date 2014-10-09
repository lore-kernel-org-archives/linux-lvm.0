Message-ID: <5436998F.5090004@redhat.com>
Date: Thu, 09 Oct 2014 16:19:59 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CACaajQu+i6wu1z86wzWa-x=HN_wWy6ByZBnLHzPy7E5Etpj6jw@mail.gmail.com>	<542ABFC3.4000909@redhat.com>	<CACaajQut7caHMw6nc-ZUbb=1NuYMZu-untY3y6XdXkk==K7+WA@mail.gmail.com>	<20140930154918.GB9925@redhat.com>	<CACaajQuvvGhXsAG9FUjJ3p_EbwZ6XovFuY_9eU-fhHppi_5_YQ@mail.gmail.com>
	<CACaajQuyXg-=LUgwkFKEpH8mVc_CAyCkMUff3JAqxo_-Mg485A@mail.gmail.com>
In-Reply-To: <CACaajQuyXg-=LUgwkFKEpH8mVc_CAyCkMUff3JAqxo_-Mg485A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin pool and discards
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Vasiliy Tolstov <v.tolstov@selfip.ru>
Cc: Mike Snitzer <snitzer@redhat.com>

Dne 9.10.2014 v 15:19 Vasiliy Tolstov napsal(a):
> 2014-10-09 2:44 GMT+04:00 Vasiliy Tolstov <v.tolstov@selfip.ru>:
>> Thanks! Rhel kernel works fine for me. Does it possible to send needed
>> patches to stable for all other users ?=) As i see this commit does
>> not in 3.10 stable now.
>
>
> AS i see i have another issue. I don't know how created some thinp
> volumes, but on some of them i'm able to get back space after discard,
> but on some not. How can i debug this ?
>

Please mention which kernel do you use - there have been patches
related to discard on thin volumes (pretty resent - kernel 3.14 I think).

If you use old stable 3.10  from vanilla kernel it simply cannot be compared 
with 3.10  RHEL kernel -  they are very different (RHEL has ton of stuff 
backported even from the latest kernels)

So - please try first with upstream to see if you problem is not already fixed.


Zdenek
