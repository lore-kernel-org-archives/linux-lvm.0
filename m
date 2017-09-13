References: <1575245610.821680.1505258554456.ref@mail.yahoo.com>
	<1575245610.821680.1505258554456@mail.yahoo.com>
	<052d4c46af896716c0f47132f4ddfb8d@assyoma.it>
	<b0d6b9a1-19fa-5e88-e031-d30d7386dfe8@redhat.com>
	<738b359eccce111fb8c81733276b9845@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <49748849-d6ac-1b02-7f7a-7bb03981529d@redhat.com>
Date: Wed, 13 Sep 2017 10:44:38 +0200
MIME-Version: 1.0
In-Reply-To: <738b359eccce111fb8c81733276b9845@assyoma.it>
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 13.9.2017 v 10:28 Gionatan Danti napsal(a):
> Il 13-09-2017 10:15 Zdenek Kabelac ha scritto:
>> Ohh this is pretty major constrain ;)
> 
>
>> I can well imagine� LVM will let you forcible� replace such LV with
>> error target� - so instead of� thinLV� - you will have� single 'error'
>> target snapshot - which could be possibly even� auto-cleaned once the
>> volume use-count drops bellow 0� (lvmpolld/dmeventd monitoring
>> whatever...)
>>
>> (Of course - we are not solving what happens to application
>> using/running out of such error target - hopefully something not
>> completely bad....)
>>
>> This way - you get very 'powerful' weapon to be used in those 'scriplets'
>> so you can drop uneeded volumes ANYTIME you need to and reclaim its 
>> resources...
>>
> 
> This would be *really* great. I played with dm-setup remove/error target and, 
> while working, it often freezed LVM.
> An integrated forced volume removal/swith to error target would be great.
> 


Forcible remove (with some reasonable locking - so i.e. 2 processes are not 
playing with same device :)   'dmsetup remove --force' - is replacing
existing device with 'error' target (with built-in noflush)

Anyway - if you see a reproducible problem with forcible removal - it needs to 
be reported as this is a real bug then and BZ shall be opened...

Regards

Zdenek
