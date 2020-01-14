References: <4dd562cd-36ee-9960-58cf-8f504d4085ef@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <0fad9406-2354-50c2-7d0f-6f065d40ee91@redhat.com>
Date: Tue, 14 Jan 2020 10:17:44 +0100
MIME-Version: 1.0
In-Reply-To: <4dd562cd-36ee-9960-58cf-8f504d4085ef@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvmcache on non-lvm source?
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

Dne 14. 01. 20 v 9:21 Gionatan Danti napsal(a):
> Hi all,
> I have a question: can lvmcache be used to cache non-lvm source (ie: a raw 
> block device)?
> 
>  From the lvmcache man page I would say no; however, a direct confirmation 
> will be helpful.
> 

Hi

You can't use lvm2 on 'raw' device - we do require PV headers to stay correct.

BUT

Clearly you can use 'dm-cache' target with 'dmsetup' utility and maintain the 
correctness of devices & activation yourself.

See: linux/Documentation/admin-guide/device-mapper/
(or simply google it)  how to use individual targets with just dmsetup


Regard

Zdenek
