Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2GLZngf004092
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 17:35:49 -0400
Received: from vodka.alita.cc (vodka.trans.am [62.12.162.173])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2GLZdYb030823
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 17:35:39 -0400
Received: from localhost (localhost [127.0.0.1])
	by localhost.alita.cc (Postfix) with ESMTP id 79DF340B61C1
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 22:35:38 +0100 (CET)
Received: from vodka.alita.cc ([127.0.0.1])
	by localhost (vodka.alita.cc [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eqO-H7vnYnO0 for <linux-lvm@redhat.com>;
	Tue, 16 Mar 2010 22:35:35 +0100 (CET)
Received: from trans.am (localhost [127.0.0.1])
	by vodka.alita.cc (Postfix) with ESMTP id B148040B61AB
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 22:35:35 +0100 (CET)
Message-ID: <165385cbda764eab1cd102f64397415d.squirrel@trans.am>
In-Reply-To: <20100316194513.GA22130@maude.comedia.it>
References: <4ec1d19a71ad4c8a10b487a3cf49840f.squirrel@trans.am>
	<20100316180619.GC15884@maude.comedia.it>
	<f6105209d6067f820f119b0f157890d0.squirrel@trans.am>
	<20100316194513.GA22130@maude.comedia.it>
Date: Tue, 16 Mar 2010 22:35:35 +0100
From: blub@trans.am
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Multipath / LVM2
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

i could resolve the issue, thanks to all who helped :)
the problem was that there is indeed a partition the the array's and the
partition map was not created. i did use the gentoo live cd, but on an
installed gentoo system the partition maps are not created out-of-the-box
by udev either

anyway, thanks again :)

> On Tue, Mar 16, 2010 at 08:09:16PM +0100, blub@trans.am wrote:
>>hello
>>thanks for trying to help :)
>>
>>I've changed the filter and preferred_names variables to
>>
>>preferred_names="^/dev/mapper/"
>>filter=["a|/dev/mapper/.*|", "r/.*/"]
>>
>>without luck :(
>
> reading your output again i noticed you partitioned the luns on the HDS
> (hope at least you aligned the partition)
> but i fail to see the partitioned multipath luns in /dev/mapper
> rereading again i see a "livecd" prompt
> are you by chance using systemrescuecd (gentoo based)? i tried it once and
> it did not
> run kpartix on /dev/mapper.
> you should check your udev rules and see why kpartx is not called and
> partitions are not created
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>          Communication Media & Services S.r.l.
>   /"\
>   \ /     ASCII RIBBON CAMPAIGN
>    X        AGAINST HTML MAIL
>   / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
