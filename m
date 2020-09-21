References: <4972578.pTZnC5dHRY@walnut>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <02099334-08df-112d-1d02-dd76cc5d8f65@redhat.com>
Date: Mon, 21 Sep 2020 20:51:39 +0200
MIME-Version: 1.0
In-Reply-To: <4972578.pTZnC5dHRY@walnut>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why isn't issue_discards enabled by default?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, nl6720 <nl6720@gmail.com>

Dne 21. 09. 20 v 16:14 nl6720 napsal(a):
> Hi,
> 
> I wanted to know why the "issue_discards" setting isn't enabled by
> default. Are there any dangers in enabling it or if not is there a
> chance of getting the default changed?
> 
> Also it's not entirely clear to me if/how "issue_discards" affects thin
> pool discard passdown.

Hi

Have you checked it's enclosed documentation in within /etc/lvm/lvm.conf ?

issue_discards is PURELY & ONLY related to sending discard to removed disk 
extents/areas after 'lvremove'.

It is't not in ANY way related to actual discard handling of the LV itself. So 
if you have LV on SSD it is automatically processing discards. From the same 
reason it's unrelated to discard processing of thin-pools.

And finally why we prefer issue_discards to be disabled (=0) by default. It's 
very simple - with lvm2 we try (when we can) to support one-command-back 
restore - so if you do 'lvremove' - you can use vgcfgrestore to restore 
previous metadata and you have your LV back with all the data inside.

When you have issue_discards=1  - the device gets TRIM - so all the data
are discarded at device level - so when you try to restore your
previous metadata - well it's nice - but content is gone forever....

If user can live with this 'risk' and prefers immediate discard - perfectly 
fine - but it should be (IMHO) admin's  decision.

Regards

Zdenek
