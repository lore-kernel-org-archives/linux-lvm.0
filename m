Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1B556012D
	for <linux-lvm@redhat.com>; Fri, 12 Jul 2019 12:39:06 +0000 (UTC)
Received: from e2i64.smtp2go.com (e2i64.smtp2go.com [103.2.140.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D808C18B2D2
	for <linux-lvm@redhat.com>; Fri, 12 Jul 2019 12:39:03 +0000 (UTC)
References: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
	<7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
	<40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
	<d8224c32-56bd-4e53-1090-d86b2e904678@redhat.com>
	<1f54874c-d4da-2579-955e-73e6caa8613b@linagora.com>
	<a89a98b3-3bde-96f0-7f31-3a9ca26ef203@gmail.com>
	<34f1f2af-cc02-6678-39d6-02323dd0236e@linagora.com>
	<d19f0e9f-d4a9-5362-34ef-4b33b5990d07@redhat.com>
	<756972b8-53ad-946a-e2a7-f55eed0bcdf7@linagora.com>
	<9b95869d-4693-a890-3340-41a05c7e7308@linagora.com>
	<fb5379cd-7260-d2fa-4abe-7ffd05f635cb@redhat.com>
From: Simon ELBAZ <selbaz@linagora.com>
Message-ID: <75cb7cc1-c863-86de-4a31-ca2a2ffa23dd@linagora.com>
Date: Fri, 12 Jul 2019 14:38:58 +0200
MIME-Version: 1.0
In-Reply-To: <fb5379cd-7260-d2fa-4abe-7ffd05f635cb@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US-large
Subject: Re: [linux-lvm] lvdisplay "open" field computing
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi,

Indeed:

root@sympa:~# swapon -s
Nom de fichier                Type        Taille    Utilisé Priorité
/dev/xvdb1                                 partition    2096124 0    -2
/dev/dm-1                                  partition    2084860 0    -3
root@sympa:~# swapoff /dev/sympa-vg/swap_1
root@sympa:~# lvdisplay
...
   --- Logical volume ---
   LV Path                /dev/sympa-vg/swap_1
   LV Name                swap_1
   VG Name                sympa-vg
   LV UUID                1b59OW-M2yW-PuI1-QN5t-pN0w-6Akl-AnJnNh
   LV Write Access        read/write
   LV Creation host, time sympa, 2019-07-10 11:06:42 +0200
   LV Status              available
   # open                 0
   LV Size                <1,99 GiB
   Current LE             509
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           254:1

root@sympa:~# swapon /dev/sympa-vg/swap_1
root@sympa:~# lvdisplay
...

   --- Logical volume ---
   LV Path                /dev/sympa-vg/swap_1
   LV Name                swap_1
   VG Name                sympa-vg
   LV UUID                1b59OW-M2yW-PuI1-QN5t-pN0w-6Akl-AnJnNh
   LV Write Access        read/write
   LV Creation host, time sympa, 2019-07-10 11:06:42 +0200
   LV Status              available
   # open                 2
   LV Size                <1,99 GiB
   Current LE             509
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           254:1

I wonder if there is a similar tool for regular filesystem types.

Regards


On 11/07/2019 17:17, Zdenek Kabelac wrote:
> Dne 11. 07. 19 v 11:39 Simon ELBAZ napsal(a):
>> Hi,
>>
>> I have setup a Debian 10 VM to understand the issue.
>>
>> root@sympa:~# uname -a
>> Linux sympa 4.19.0-5-amd64 #1 SMP Debian 4.19.37-5 (2019-06-19) 
>> x86_64 GNU/Linux
>> root@sympa:~# lvdisplay /dev/sympa-vg/swap_1
>>    --- Logical volume ---
>>    LV Path                /dev/sympa-vg/swap_1
>>    LV Name                swap_1
>>    VG Name                sympa-vg
>>    LV UUID                1b59OW-M2yW-PuI1-QN5t-pN0w-6Akl-AnJnNh
>>    LV Write Access        read/write
>>    LV Creation host, time sympa, 2019-07-10 11:06:42 +0200
>>    LV Status              available
>>    # open                 2
>>    LV Size                <1,99 GiB
>>    Current LE             509
>>    Segments               1
>>    Allocation             inherit
>>    Read ahead sectors     auto
>>    - currently set to     256
>>    Block device           254:1
>>
>> root@sympa:~# lsof | grep "254,1"
>> root@sympa:~# dmsetup info
>> Name:              sympa--vg-swap_1
>> State:             ACTIVE
>> Read Ahead:        256
>> Tables present:    LIVE
>> Open count:        2
>> Event number:      0
>> Major, minor:      254, 1
>> Number of targets: 1
>> UUID: 
>> LVM-Imuz5YW2OXfsyO2ChOPPLI5flib9YlLi1b59OWM2yWPuI1QN5tpN0w6AklAnJnNh
>>
>> Name:              sympa--vg-root
>> State:             ACTIVE
>> Read Ahead:        256
>> Tables present:    LIVE
>> Open count:        1
>> Event number:      0
>> Major, minor:      254, 0
>> Number of targets: 1
>> UUID: 
>> LVM-Imuz5YW2OXfsyO2ChOPPLI5flib9YlLiJMF1vN1e6TKmfV1rT0fvWJnpViu7BMw5
>>
>> root@sympa:~# lsof | grep swap_1
>>
>> root@sympa:~#
>>
>> Could someone pls give me some hints to verify the "open" value ?
>>
>
> Hi
>
> Have you tried  'swapon -s' ?
>
> From the name I'd have guessed it's an active swapping device (so held 
> open by kernel and not visible by user-space tools like lsof)
>
> 'swapoff' should close opened swapping device (in case you have enough 
> free RAM to live without swap space)
>
> Regards
>
> Zdenek
>
>
>
-- 
Simon Elbaz
@Linagora
Mob: +33 (0) 6 38 99 18 34
Tour Franklin 31ème étage
100/101 Quartier Boieldieu
92042 La Défense
FRANCE
