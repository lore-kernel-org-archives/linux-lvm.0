Received: from [10.40.200.46] (ovpn-200-46.brq.redhat.com [10.40.200.46])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4GE9OCk027536
	for <linux-lvm@redhat.com>; Mon, 16 May 2016 10:09:25 -0400
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <119b520d472b019ced48357eff9fb389@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5739D494.2040103@redhat.com>
Date: Mon, 16 May 2016 16:09:24 +0200
MIME-Version: 1.0
In-Reply-To: <119b520d472b019ced48357eff9fb389@dds.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
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

On 16.5.2016 15:01, Xen wrote:
> Zdenek Kabelac schreef op 16-05-2016 14:08:
>
>> Hi
>>
>> Well yeah - ATM we rather take 'early' action and try to stop any user
>> on overfill thin-pool.
>
> May I inquire into whether this is only available in newer versions atm?
>
> These are my versions (lvs --version):
>
>    LVM version:     2.02.133(2) (2015-10-30)
>    Library version: 1.02.110 (2015-10-30)
>    Driver version:  4.34.0
>
> I have noticed that on my current system the entire system will basically
> freeze on overfill.
>
> I wonder if I should take measures to upgrade to something newer if I want to
> prevent this.

Behavior should be there for quite a while, but relatively recent fixes
in dmeventd has made it working more reliable in more circumstances.
I'd recommend to play at least with 142 - but since recent releases are
bugfix oriented - if you are compiling yourself - just take latest.


Regards

Zdenek
