Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D58B32C7
	for <linux-lvm@redhat.com>; Mon,  2 Oct 2017 10:55:42 +0000 (UTC)
Received: from mail-lf0-f70.google.com (mail-lf0-f70.google.com
	[209.85.215.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 887175D68C
	for <linux-lvm@redhat.com>; Mon,  2 Oct 2017 10:55:42 +0000 (UTC)
Received: by mail-lf0-f70.google.com with SMTP id n140so785851lfn.10
	for <linux-lvm@redhat.com>; Mon, 02 Oct 2017 03:55:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53363824-396a-a4c6-9661-831637690936@redhat.com>
References: <CACj3i71bvspO5H_h8s=XBnDzRBvJwdL=Q18_4dvy+C7-ktdirw@mail.gmail.com>
	<53363824-396a-a4c6-9661-831637690936@redhat.com>
From: Jan Tulak <jtulak@redhat.com>
Date: Mon, 2 Oct 2017 12:55:20 +0200
Message-ID: <CACj3i722boaSX5bh0Q_j5tysFHi_Lx15ArXBsbMNkbxpaR8Wgw@mail.gmail.com>
Subject: Re: [linux-lvm] Difference between Debian and some other
	distributions with thin provisioning
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
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Sep 30, 2017 at 7:24 PM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> Dne 29.9.2017 v 18:42 Jan Tulak napsal(a):
>>
>> Hi guys,
>> I found out this difference and I'm not sure what is the cause. A
>> command for creating a thin LV, which works on Archlinux, Centos and
>> Fedora, fails on Debian and Ubuntu:
>>
>> lvm lvcreate FOOvg1 \
>>      -T \
>>      -l 100%PVS \
>>      -n FOOvg1_thin001 \
>>      /dev/loop0 /dev/loop1 /dev/loop2
>
>
> Hi
>
> This command is not actually creating 'thin'  - only a thin-pool.
> For 'thin' you need to specify -V  --virtualsize.
>
> The usage of -T  is 'smart' flag - telling lvm2 to do 'something'
> thin/thin-pool oriented.
>
> If you want to be 'exact' you can use --type thin  or --type thin-pool
> giving you more errors and requiring user more specific option for passing
> in.
>
Hi,

Ah, thanks for the explanation.


>> Versions seem to be close enough for it not to be a change in LVM
>
>
> Hmm, close enough 111 and 171 ??
>

I would swear I saw different numbers when I wrote it. 117 perhaps?
So, disregard this part of my message. :-)

>
>> behaviour, so I suspect some downstream or configuration changes. All
>> tested distributions were run in their current stable versions, up to
>> date. For example:
>
>
> The original naming convention with pool names was to add the name next to
> VG name.
>
> lvcreate -T -L10 vg/pool
>
> Pool is 'special' type of LV - thus it got this privileged naming and
> standard option --name was normally left for  'thin' when user specifies -V.
>
> Newer version of lvm2 can use  --name with --size specifier for pool name
> when there is no virtual size given as its unique combination.
>
>> Debian:
>> # cat /etc/debian_version
>> 8.9
>> # lvm version
>>    LVM version:     2.02.111(2) (2014-09-01)
>>    Library version: 1.02.90 (2014-09-01) >    Driver version:  4.27.0
>
>
> I'd suggest upgrading your Debian machine....

It is a current Debian 8, so the only thing I can do is to upgrade to
Debian 9 or use a different repository. And indeed, on 9 it works.

Thanks for your answers, I know what the issue is and can now decide
what to do next with it. :-)

Cheers,
Jan
