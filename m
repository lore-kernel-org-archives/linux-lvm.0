References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
	<20180727182658.GI23157@merlins.org>
	<20180731024410.v3ovzjth4svrus6y@merlins.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c086c2e3-8b84-76a6-129a-0bad04bb849f@redhat.com>
Date: Tue, 31 Jul 2018 14:35:42 +0200
MIME-Version: 1.0
In-Reply-To: <20180731024410.v3ovzjth4svrus6y@merlins.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why use thin_pool_autoextend_threshold < 100 ?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Marc MERLIN <marc@merlins.org>

Dne 31.7.2018 v 04:44 Marc MERLIN napsal(a):
> On Fri, Jul 27, 2018 at 11:26:58AM -0700, Marc MERLIN wrote:
>> Hi Zdenek,
>>
>> Thanks for your helpful reply.
>   
> Ha again Zdenek,
> 
> Just to confirm, am I going to be ok enough with the scheme I described
> as long as I ensure that 'Allocated pool data' does not get to 100% ?
> 
> For now, I have my btrfs filesystems mounted with "discard", so
> hopefully it should tell dm-thin when it can free up/reuse blocks.
> 
> Given that, am I more or less ok using dm-thin that way?
> 
> And for my own understanding, is there any reason why I would even want
> to consider thin_pool_autoextend_threshold < 100 ?
> 

Hi

If you monitor amount of free space for data AND for metadata in thin-pool
yourself you can keep easily threshold == 100.

Just don't forget when you upsize 'data' - you should also typically
extend also metadata -  it's not uncommon issue user  start with small
'data' & 'metadata' LV with thin-pool - then  continue to only extend
thin-pool 'data' volume and ignore/forget about metadata completely
and hit the full metadata device - which can lead to many troubles
(hitting full dataLV is normally not a big deal).

Regards

Zdenek
