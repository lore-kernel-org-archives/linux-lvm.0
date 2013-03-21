Message-ID: <514B5C86.6050304@hoster-ok.com>
Date: Thu, 21 Mar 2013 22:16:22 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<1363699970-10002-11-git-send-email-bubble@hoster-ok.com>
	<20130319153215.GB986@redhat.com> <5148874A.2060106@hoster-ok.com>
	<20130319155456.GC986@redhat.com> <514897BE.90609@hoster-ok.com>
	<20130319171608.GE986@redhat.com>
	<5148A215.7080004@hoster-ok.com> <51497718.5080209@redhat.com>
	<514B521D.7080805@hoster-ok.com> <514B591B.7070305@redhat.com>
In-Reply-To: <514B591B.7070305@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 10/10] man: document --node option to
	lvchange
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: David Teigland <teigland@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

21.03.2013 22:01, Zdenek Kabelac wrote:
> Dne 21.3.2013 19:31, Vladislav Bogdanov napsal(a):
>> 20.03.2013 11:45, Zdenek Kabelac wrote:
>> ...
>>>
>>> (BTW there is already one thing which will surely not pass - it's the
>>> 'node' option for lvm command - this would have to be made diferently).
>>
>> clvmd uses term 'node' internally. And that is the most right term for
>> what it means IMHO.
>>
> 
> Yes - in clvmd locking layer it's ok - but  lvm namespace stays aways
> from this layer. Thus lvm is not aware of any locking mechanism.. So the
> thing would have to be handle via activation lock flags and as I've said
> - the protocol used there (lvm  <-> clvmd) is quite fragile.

And it also has "node" field (struct clvm_header used everywhere in
cluster_locking.c). It is fragile, yes, but I managed to not break it I
think.

So, what would be the right option name?
