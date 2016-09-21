Received: from [10.34.131.42] (dhcp131-42.brq.redhat.com [10.34.131.42])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8LBkD4M011691
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2016 07:46:13 -0400
References: <5208271474387670@web5h.yandex.ru>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <7d6b51cd-1b39-4931-a4c6-6af80459c847@redhat.com>
Date: Wed, 21 Sep 2016 13:46:12 +0200
MIME-Version: 1.0
In-Reply-To: <5208271474387670@web5h.yandex.ru>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Shared LUN without CLM
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 20.9.2016 v 18:07 Руденко Александр napsal(a):
> Hi, friends.
>
> I have strange question)
>
> I have one shared LUN on many different hosts.
> LUN is PV in some VG.
>
> Each hosts can make any operation in this VG - create LV, remove LV, resize LV, etc.
> If i want access to same LV on same host, i take "lvscan" and "lvchange -aey /dev/VG/LV_name".
> I'm sure can't two modification VG in same time.
>
> It work fine for me.
>
> My question.
>
> Can i not use the CLVM extension?
>
> CLVM is great extension for LVM, but i will have more 100 nodes.
> This count not supported in corosync.
>


There is now (slowly) introduce another clustered locking support where
the instead of 'dlm' locking engine it's using  'sanlock'

It's targeting the 'many-nodes' clusters, might be likely worth to check.

It has some advantages over clvmd/dlm and on the other hand some features are 
missing (i.e. remove node activation).

But from the context you've show - it seems like it might be a good fit to 
start playing with..

Regards

Zdenek
