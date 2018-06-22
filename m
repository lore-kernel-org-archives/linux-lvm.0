References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
	<39a2408c600ed4caf00724eb72c191c2@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <326c998e-67f8-6331-c8f1-a22e8c06fd98@redhat.com>
Date: Fri, 22 Jun 2018 22:07:11 +0200
MIME-Version: 1.0
In-Reply-To: <39a2408c600ed4caf00724eb72c191c2@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unable to un-cache logical volume when chunk size
	is over 1MiB
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: Ryan Launchbury <ryan@magenta.tv>

Dne 22.6.2018 v 20:13 Gionatan Danti napsal(a):
> Il 20-06-2018 12:15 Zdenek Kabelac ha scritto:
>> Hi
>>
>> Aren't there any kernel write errors in your 'dmegs'.
>> LV becomes fragile if the associated devices with cache are having HW
>> issues (disk read/write errors)
>>
>> Zdenek
> 
> Is that true even when using a writethrough cache mode?

With writethrough - all writes are first committed on 'origin' disk - before 
they are ack back to writing apps - so cache can be through away anytime.

When cache will experience write error - it will become invalidate and will
need to be dropped - but this thing is not automated ATM - so admin
works is needed to handle this task.

Regards

Zdenek
