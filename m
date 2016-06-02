References: <574CB690.5030401@partidopirata.com.ar>
	<dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
	<574D8EE6.8020903@partidopirata.com.ar>
	<fadf6004-73b7-ebd6-035f-9167764ff7a8@redhat.com>
	<5750371C.2070201@partidopirata.com.ar>
	<603e0110-8de8-3c03-bf93-db0c19c2d4e0@redhat.com>
	<57504C3B.70303@partidopirata.com.ar>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <1b83651a-db90-cfbf-4d2d-6cf571cebece@redhat.com>
Date: Thu, 2 Jun 2016 17:20:43 +0200
MIME-Version: 1.0
In-Reply-To: <57504C3B.70303@partidopirata.com.ar>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [dm-crypt] LVM on LUKS: volumes missing
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
To: fauno <fauno@partidopirata.com.ar>, linux-lvm@redhat.com

Dne 2.6.2016 v 17:09 fauno napsal(a):
> On 02/06/16 11:50, Zdenek Kabelac wrote:
>
>>
>> Hi
>>
>> This was not a full lvm2 -vvvv trace output - unless you would be using
>> a modified lvm2 source code base.
>>
>> 'pvscan -vvvv --cache device  &>out'
>>
>>
>> Also please provide full lvm2 package version eventually reference to
>> package
>> with sources (and extra patches) (link).
>
>
> i can't confirm the version now, but it was lvm2 from trisquel belenos
> (ubuntu trusty, lvm2 2.02.98 it seems[^0]), the hd was running archlinux
> with latest lvm2 from repos.  i can try later with a more modern lvm2.
>
> the pvscan output was exactly that though, i just selected it from the
> terminal i was using.  see it finished with error 5, perhaps that's why
> it's incomplete?
>
>
> thanks!
>


So in your case any usage of lvmetad seems rather irrelevant.
(it's been freshly deployed daemon in that age for testing...)

It's unclear where have you get use_lvmpolld in your config file
since I'm sure it's not been in 2.02.98  (introduced around 2.02.120)

So are you mixing usage of various lvm2 versions ?


What does     'vgscan -vvvv'  shows on decrypted partition?

Also please provide output of:

dmsetup table
dmsetup status

And yeah  2.02.98 is somewhat out-of-date....
(Make sure your systems' & initramdisk version are somewhat matching)

Regards

Zdenek
