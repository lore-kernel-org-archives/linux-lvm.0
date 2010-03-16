Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2GJ9Ss8018174
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:09:28 -0400
Received: from vodka.alita.cc (vodka.trans.am [62.12.162.173])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2GJ9JgK011300
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:09:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by localhost.alita.cc (Postfix) with ESMTP id 35C1940B61C1
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 20:09:19 +0100 (CET)
Received: from vodka.alita.cc ([127.0.0.1])
	by localhost (vodka.alita.cc [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MZkeS3ccQY8W for <linux-lvm@redhat.com>;
	Tue, 16 Mar 2010 20:09:16 +0100 (CET)
Received: from trans.am (localhost [127.0.0.1])
	by vodka.alita.cc (Postfix) with ESMTP id 4C3D240B61AB
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 20:09:16 +0100 (CET)
Message-ID: <f6105209d6067f820f119b0f157890d0.squirrel@trans.am>
In-Reply-To: <20100316180619.GC15884@maude.comedia.it>
References: <4ec1d19a71ad4c8a10b487a3cf49840f.squirrel@trans.am>
	<20100316180619.GC15884@maude.comedia.it>
Date: Tue, 16 Mar 2010 20:09:16 +0100
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
To: linux-lvm@redhat.com

hello
thanks for trying to help :)

I've changed the filter and preferred_names variables to

preferred_names="^/dev/mapper/"
filter=["a|/dev/mapper/.*|", "r/.*/"]

without luck :(

new pvscan output:
http://pastebin.com/5PysR0rD


> On Tue, Mar 16, 2010 at 05:40:20PM +0100, blub@trans.am wrote:
>>hello
>>
>>I have troubles to get multipathing working on gentoo. I have an
>> identical
>>setup working on a debian box.
>>The problem is that LVM does not detect labels on the multipath device
>>node; instead it does try to use a physical path (eg /dev/sda1)
>>
>>the device nodes /dev/dm-X are not automaticaly created like they get on
>>debian, I did run dmsetup mknodes which did not create /dev/dm-X nodes,
>> so
>>i created /dev/dm-0 with the minor/major of the corresponding
>> /dev/mapper/
>>node. I don't know if this is a problem.
>>
>>anyway, I've pasted alot of output to http://pastebin.com/wheL4nyE
>>
> change the preferred_names in /etc/lvm.conf to reference /dev/mapper
> entries before /dev/sd
>
> eg:
> preferred_names = [ "^/dev/mapper/" ]
>
> L.
>
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
