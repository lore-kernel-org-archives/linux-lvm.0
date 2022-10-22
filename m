Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6486C3A59D
	for <linux-lvm@archiver.kernel.org>; Mon, 24 Oct 2022 06:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666593971;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FBdMxl7cPGKeWHSbg0Xgrpm+fFN/nDvyjoWyo8SMKLo=;
	b=iP9jyJZw5iAx/r4mX1vRlq/674fDvAnaTb9+gZEE5Y8FBrhzL5zVaI8L/92XBhF7ZH6qXa
	8AzhdiC/guOlbpwFAz0N3EXrR7pLrOfLjIvrKAB88chFbc2VvUBXu+kSGY5NOHAmItvJl4
	WgUlgyMe0w+HmTM+eLEh3NDdtKauoH4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-UkY7G2LXMQ-4o7H2szKnvA-1; Mon, 24 Oct 2022 02:46:09 -0400
X-MC-Unique: UkY7G2LXMQ-4o7H2szKnvA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91C623C02193;
	Mon, 24 Oct 2022 06:46:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1700F492B0A;
	Mon, 24 Oct 2022 06:46:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E2131194658D;
	Mon, 24 Oct 2022 06:46:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB7681946586
 for <linux-lvm@listman.corp.redhat.com>; Sat, 22 Oct 2022 12:11:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B8C5640C6EE9; Sat, 22 Oct 2022 12:11:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B10A240C6EC2
 for <linux-lvm@redhat.com>; Sat, 22 Oct 2022 12:11:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91CCC185A794
 for <linux-lvm@redhat.com>; Sat, 22 Oct 2022 12:11:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-428-c9i4hoNWOTCYeErhCIlBZg-1; Sat,
 22 Oct 2022 08:11:11 -0400
X-MC-Unique: c9i4hoNWOTCYeErhCIlBZg-1
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.44.3] ([83.135.91.180]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhD2O-1pGJ9d3tNy-00eN2j; Sat, 22
 Oct 2022 14:05:56 +0200
Message-ID: <e47a6b2f-e5f3-a81a-a4ba-e5bde5c7f3b6@gmx.de>
Date: Sat, 22 Oct 2022 14:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
From: corubba <corubba@gmx.de>
To: linux-lvm@redhat.com
X-Provags-ID: V03:K1:pBH+L9cu8bShTRsK2n4O0ybCsEPH5Cq5Z05rYNudIo7OTw3vDdG
 3UvQ4ABN0y1c19OVMd6YoIah9kPMuBcAeMld8hAu4tkNnZY3JKHjw8/C/OgCpsG8CbvXi6b
 BOYdSV+5TF/eFvJuI6+FmwQl1ykPE3GgDetFksMLlKufdvLmolAfURxePHRJ5dyWXtH9Pbf
 fhOsN1LxPT6b4e4SSvf+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:miqHMxYr/d4=:o3mI+eh0V95LadVtWT7MYA
 acWgcEspTNU5rIenROC1B/qqiPlfXY1GF0gO2i17yeCcCrcB62FYblS41KMs4b6WlDBp1xMkx
 vKXUVHWv0VYJfFW9mZ9F5KZQNSUvavux2emwcfmB/JiowE0TKG/o30WrUaOsbEOospf2GrQQU
 K+dlkr5376ZeG/s1i/ivN3qdkuDUUTgKqVgJX1Df96faLyp7JMxb+UdgYXb7FDXF8/0ZQFlHk
 CJRLVFKx6+W9XcrjxBxmD3sk6r4sFVWVH7RKa6qOyYVf2b7TpiTBVvE0cApjPl09ZoE3pMCIs
 rmO3lvwgDyP+1UQDe3ZWcKjPDFG93JX1dWPfDZiqdy0yS4CW/hLdF+0KzvJqum1e/S5Wjahkc
 9s6Pygdd5uvazr8Wo72GxtoyWdqelKTkg/RiKD6Z99LsCL0EGDTg/yBQ94e3Ku0uxav1EopRp
 Ghj4hPW89/LCdg2l5aO7uKTl0YzuxWK7hM30DrIF/doboe9aOpJXBDXY6IXagrcQXhMR3OamP
 YhSsqYNrkGy0fHedPSlEp/ozdfEhxJxs2iQXOXT5oyzTOZBGjXnB0agDKQfk+ImmK9ahQIWXw
 IdYPMbsP/V+gNmd39GKmHcZIyGqyLwNT544SBk+pSE8GHdwLPJi6dy3RlrXlfdGkl2po5fMH6
 OnTrvno2j26tah3yTa1+1MuPVj1Pp4jrUnLbdOOD4oKucCDoaoPt7piSbJ2jWNnZ+5HZ4KXPX
 TPgmmSUmvkocmjqfoEo5lapvNmlVPTj+F+GybDtBAboMJF3S+XbWp1d4K2gkmzF/9sdDYqiIO
 B+u/ohM1vfLEgj55gf29xpqj/HL5MDIV9ZWOJTw3USPdkia5mY4B3ediXwNzN+oHeJvTnyJo5
 JN6ulYXimz54Blkeib05I8npY9fgmF8oPZ2CF8cZctKTFQpe3+xbVynGhziNl6/0DpaAnYawz
 6RiAFfhTDXeXWRLCYe1xZ/Jg5I5zuHftb+RC+r5dsVAxPiDsc5yvczwFtg82W5kF96ow35Md5
 xB6aBRku+hItmFp5O1cuZj68ZHdedbJUf6wgPsdSkCTA06ENaNsAV52VBDb9dB1tvvHZQBOMH
 E1ZMXHdZCabv3FhV0T/HEoeu+Sqinh4U0Hj6R9XE3rjR/WF2hJVVxYWoklfKZeEh6d47Sph2r
 g+SrYnRcU6fNERFQReQuT7kWBhYQG43z6H9BQBk4HhRKHqDaMjl4DLjuuT7JcOdZV0eF0JSDt
 VJEZ6CaMHL7sReU/Y6B+iTHZPav4Sbzdk0bVqcFi0gMK/CGpe2c5i4aak1DKesV01Mat6TGcx
 hCEnh45YvxRxd36dj4AQvfYJv831k5srHI1Z24YzJncnT9snBlM1mRP0kHCwKmuCz/Eoy1WEO
 SXiIOQAyYLrnLXNPErr/jCUIW94sFel+Rnn+F3Dbvo6KXgnE/1z5l2rOHK6F8fZEb6D20RrVn
 w4qVzyKd2O+VGyOu5062XHOJzXt4PONQONwZQGF5uaxWYLsNX4wWORI8yxUNpgZ0t5aYe/OIr
 LDl86zBDof+LEtXGdyB/Gpl5c5pN7XD6Pv/TWY8I8U6eP
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Mon, 24 Oct 2022 06:46:01 +0000
Subject: [linux-lvm] lvs activation columns are confusing for shared volume
 groups
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: de-CH, en-GB
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi,

in 2018 there was a change [0] that removed clvmd support from the LV
active columns of the `lvs` tool. The column `lv_active_remotely` is
always unset/empty, and the columns `lv_active_locally` and
`lv_active_exclusively` are all simply coupled to the activation state
of the LV. For a local VG this all fine and dandy, but it gets confusing
for shared VGs. Take this example of a 2-node shared VG setup using
lvmlockd+sanlock:


```
root@node1:~# lvm version
   LVM version:     2.03.17(2)-git (2022-05-18)
   Library version: 1.02.187-git (2022-05-18)
   Driver version:  4.43.0
   Configuration:   ./configure --build=x86_64-linux-gnu --prefix=/usr --includedir=${prefix}/include --mandir=${prefix}/share/man --infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var --disable-option-checking --disable-silent-rules --libdir=${prefix}/lib/x86_64-linux-gnu --runstatedir=/run --disable-maintainer-mode --disable-dependency-tracking --libdir=/lib/x86_64-linux-gnu --sbindir=/sbin --with-usrlibdir=/usr/lib/x86_64-linux-gnu --with-optimisation=-O2 --with-cache=internal --with-device-uid=0 --with-device-gid=6 --with-device-mode=0660 --with-default-pid-dir=/run --with-default-run-dir=/run/lvm --with-default-locking-dir=/run/lock/lvm --with-thin=internal --with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump --with-thin-repair=/usr/sbin/thin_repair --with-udev-prefix=/ --enable-applib --enable-blkid_wiping --enable-cmdlib --enable-dmeventd --enable-editline --enable-lvmlockd-dlm --enable-lvmlockd-sanlock --enable-lvmpolld --enable-notify-d
 bus --enable-pkgconfig --enable-udev_rules --enable-udev_sync --disable-readline

root@node1:~# vgchange --lock-start
root@node1:~# lvchange -aey 'my-shared-vg/node1-exclusive-lv'
root@node1:~# lvchange -asy 'my-shared-vg/shared-but-only-node1-lv'
root@node1:~# lvchange -asy 'my-shared-vg/shared-on-both-lv'

root@node2:~# vgchange --lock-start
root@node2:~# lvchange -aey 'my-shared-vg/node2-exclusive-lv'
root@node2:~# lvchange -asy 'my-shared-vg/shared-but-only-node2-lv'
root@node2:~# lvchange -asy 'my-shared-vg/shared-on-both-lv'

root@node1:~# lvs -a -o 'vg_name,vg_shared,lv_name,lv_uuid,lv_active,lv_active_locally,lv_active_remotely,lv_active_exclusively,lv_lockargs'
   VG           Shared  LV                       LV UUID                                Active ActLocal       ActRemote  ActExcl            LLockArgs
   my-shared-vg  shared [lvmlock]                2Iuwpm-TA9H-0JSA-EmeS-PaZX-oCzU-jo3X7h active active locally            active exclusively
   my-shared-vg  shared node1-exclusive-lv       TDFv2h-gYnZ-dkj4-kAVx-tkCR-gCvf-fXgDK7 active active locally            active exclusively 1.0.0:70254592
   my-shared-vg  shared node2-exclusive-lv       Pjhy72-Ah71-lPac-mC1f-FH4h-yXYx-JoplUH                                                     1.0.0:71303168
   my-shared-vg  shared shared-but-only-node1-lv qPVTYt-YGP0-X7kr-afGJ-8PyG-vS1p-FGWQLf active active locally            active exclusively 1.0.0:72351744
   my-shared-vg  shared shared-but-only-node2-lv 0mfufn-JJDI-IoVm-dyUf-soWa-Wy4G-TcGnbe                                                     1.0.0:73400320
   my-shared-vg  shared shared-on-both-lv        DPsQl2-6pqd-ZUTM-plv6-qR4w-VSZv-6mRwBr active active locally            active exclusively 1.0.0:74448896
   my-shared-vg  shared unused-lv                96X21r-Zm2Z-O2gp-hWVw-ryCb-y6JV-QYQOBk                                                     1.0.0:75497472
root@node1:~# lvmlockctl --info --dump | grep 'type=lv'
   info=r name=TDFv2h-gYnZ-dkj4-kAVx-tkCR-gCvf-fXgDK7 type=lv mode=ex sh_count=0 version=0
   info=r name=Pjhy72-Ah71-lPac-mC1f-FH4h-yXYx-JoplUH type=lv mode=un sh_count=0 version=0
   info=r name=qPVTYt-YGP0-X7kr-afGJ-8PyG-vS1p-FGWQLf type=lv mode=sh sh_count=1 version=0
   info=r name=0mfufn-JJDI-IoVm-dyUf-soWa-Wy4G-TcGnbe type=lv mode=un sh_count=0 version=0
   info=r name=DPsQl2-6pqd-ZUTM-plv6-qR4w-VSZv-6mRwBr type=lv mode=sh sh_count=1 version=0
   info=r name=96X21r-Zm2Z-O2gp-hWVw-ryCb-y6JV-QYQOBk type=lv mode=un sh_count=0 version=0

root@node2:~# lvs -a -o 'vg_name,vg_shared,lv_name,lv_uuid,lv_active,lv_active_locally,lv_active_remotely,lv_active_exclusively,lv_lockargs'
   VG           Shared  LV                       LV UUID                                Active ActLocal       ActRemote  ActExcl            LLockArgs
   my-shared-vg  shared [lvmlock]                2Iuwpm-TA9H-0JSA-EmeS-PaZX-oCzU-jo3X7h active active locally            active exclusively
   my-shared-vg  shared node1-exclusive-lv       TDFv2h-gYnZ-dkj4-kAVx-tkCR-gCvf-fXgDK7                                                     1.0.0:70254592
   my-shared-vg  shared node2-exclusive-lv       Pjhy72-Ah71-lPac-mC1f-FH4h-yXYx-JoplUH active active locally            active exclusively 1.0.0:71303168
   my-shared-vg  shared shared-but-only-node1-lv qPVTYt-YGP0-X7kr-afGJ-8PyG-vS1p-FGWQLf                                                     1.0.0:72351744
   my-shared-vg  shared shared-but-only-node2-lv 0mfufn-JJDI-IoVm-dyUf-soWa-Wy4G-TcGnbe active active locally            active exclusively 1.0.0:73400320
   my-shared-vg  shared shared-on-both-lv        DPsQl2-6pqd-ZUTM-plv6-qR4w-VSZv-6mRwBr active active locally            active exclusively 1.0.0:74448896
   my-shared-vg  shared unused-lv                96X21r-Zm2Z-O2gp-hWVw-ryCb-y6JV-QYQOBk                                                     1.0.0:75497472
root@node2:~# lvmlockctl --info --dump | grep 'type=lv'
   info=r name=TDFv2h-gYnZ-dkj4-kAVx-tkCR-gCvf-fXgDK7 type=lv mode=un sh_count=0 version=0
   info=r name=Pjhy72-Ah71-lPac-mC1f-FH4h-yXYx-JoplUH type=lv mode=ex sh_count=0 version=0
   info=r name=qPVTYt-YGP0-X7kr-afGJ-8PyG-vS1p-FGWQLf type=lv mode=un sh_count=0 version=0
   info=r name=0mfufn-JJDI-IoVm-dyUf-soWa-Wy4G-TcGnbe type=lv mode=sh sh_count=1 version=0
   info=r name=DPsQl2-6pqd-ZUTM-plv6-qR4w-VSZv-6mRwBr type=lv mode=sh sh_count=1 version=0
   info=r name=96X21r-Zm2Z-O2gp-hWVw-ryCb-y6JV-QYQOBk type=lv mode=un sh_count=0 version=0
```

As soon as a LV is active, `lvs` will report it as "active exclusively"
regardless of whether it was activated in exclusive or shared mode. To
get accurate information, you have to check the lock-mode on that LV
using `lvmlockctl --info`. And as noted above, it is never reported as
"active remotely" even if it is. It took me a while to realise this.

I am willing to spend some time on this to develop a fix, but I am
unsure in what direction to move.
If `lvmlockctl` is supposed to be the source of truth here, a
deprecation note in the docs for these columns would be appropriate. Or
more drastically, remove these columns altogether. The downside is the
output of `lvmlockctl` in its current state isn't very human-readable,
especially compared to lvs.
Another way would be to integrate `lvs` with lvmlockd such that the
exclusivity is properly reported for shared VGs: It is exclusive only if
it is in a local VG, or in a shared VG and has a exclusive lock. As you
can see in the example above, it is impossible to ascertain if a LV is
remotely active, because the "shared count" reported by `lvmlockctl`
never exceeds 1 even if that LV is active on 2 nodes (at least with
sanlock). Depending on how that behaves with dlm, the column could be
deprecated/removed or show something akin to "unknown".

I am very much interested in the opinions of the developers and more
knowledgeable and experienced users.

Full disclaimer: I have only recently started using non-local LVM
setups, and so far only used sanlock; no experience whatsoever with dlm
or clvmd.


[0] https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=18259d5559307f2708e12b9923988319e46572df

----
Greetings

Corubba
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

