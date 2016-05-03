MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 03 May 2016 19:07:36 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <5728BA8A.3040009@redhat.com>
References: <CAPLCSGBydm62eZuqACSfuX9Y7cHPC-GbnHzTRLBsp1hFHvRLbw@mail.gmail.com>
	<5720CDAF.1020604@redhat.com>
	<CAPLCSGAE9T_wWU5+9T0k5X+V6t7ztAguW84pUoh=Nfbir4J4iQ@mail.gmail.com>
	<572317B4.9030309@redhat.com>
	<CAPLCSGAma7ixsFmWHmuiJ4d426yBf+hunWCN+htijHmQnWCmOw@mail.gmail.com>
	<57287570.5090509@redhat.com>
	<CAPLCSGBXKXZLthYSFGUkG+kGO=8aUXh8SS4wh+6Ynj8A7xfh2w@mail.gmail.com>
	<5728BA8A.3040009@redhat.com>
Message-ID: <24e0da7a5078c5523136f8c2e149e094@assyoma.it>
Subject: Re: [linux-lvm] Lvm think provisioning query
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
Cc: Zdenek Kabelac <zkabelac@redhat.com>

Il 03-05-2016 16:49 Zdenek Kabelac ha scritto:
> 
> Now few people (me included) believe  thin volume should error 'ANY'
> further write when there was an overprovisioning error on a device and
> I'm afraid this can't be solved elsewhere then in target driver.
> ATM this thin volume puts filesystem into very complex situation which
> does not have 'winning' scenario in number of cases - so we need to
> define number of policies.
> 
> BUT ATM we clearly communicate - when you run OUT of thin-pool space
> it's serious ADMIN failure - and we could only try to lower damage.
> 
> Thin-pool overfull CANNOT be compared to writing to a full filesystem
> and there is absolutely no guarantee about content of non-flushed 
> files!

True, but non-synched writes should be always treated as "this item can 
be lost if power disappears / system crashes" anyway. On the other 
hands, (f)synched writes should already fail immediately if no space can 
be allocated from the storage subsystem.

In other words, even with a full data pool filesystem intergrity by 
itself should be guaranteed (both by jornaling and fsync), while non 
flushed writes "maybe" (if the data segment required was *already* 
allocated the writes completes, otherwise it fail as an async lost 
page).

For full tmeta things are much worse, as sometime it require 
thin_repair. (ps: if you have two free minutes, please see my other 
email regarding full tmeta. Thanks in advance).

This is my current understanding; please correct me if I am wrong!

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
