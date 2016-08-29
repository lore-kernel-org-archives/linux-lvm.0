Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7TEMqT8017540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2016 10:22:52 -0400
Received: from nm33-vm8.bullet.mail.ir2.yahoo.com
	(nm33-vm8.bullet.mail.ir2.yahoo.com [212.82.97.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3863F8F4E5
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2016 14:22:50 +0000 (UTC)
References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
	<3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
	<a1a1c9d00457985bf312ddde42c3e5ab@dds.nl>
	<1d81389a-48bd-9374-7c09-183926f9be1e@yahoo.co.uk>
	<1004ca527029b35e6d621a2629fd6ed4@dds.nl>
	<e41054b4-573e-1960-bd97-c669c6ae9249@yahoo.co.uk>
	<40998f97-9728-c1e6-1c94-cab31fdef870@redhat.com>
	<fda6b9fe-44c6-3274-748a-394a5717c48b@yahoo.co.uk>
	<08940795-857f-f519-5866-bc1a20f86b3b@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <62f29dda-8a04-9125-8b3e-3e9925f485e3@yahoo.co.uk>
Date: Mon, 29 Aug 2016 15:22:47 +0100
MIME-Version: 1.0
In-Reply-To: <08940795-857f-f519-5866-bc1a20f86b3b@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM cache/dm-cache questions.
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
To: linux-lvm@redhat.com

$ lvs -a h200front
   LV                      VG        Attr       LSize   Pool 
Origin    Data%  Meta%  Move Log Cpy%Sync Convert
   0                       h200front Cwi-aoC---   9.10t 
[cache0] [0_corig] 100.00 8.18            0.00
   [0_corig]               h200front rwi-aoC--- 
9.10t                                           100.00
   [0_corig_rimage_0]      h200front iwi-aor--- 1.82t
   [0_corig_rimage_1]      h200front iwi-aor--- 1.82t
   [0_corig_rimage_2]      h200front iwi-aor--- 1.82t
   [0_corig_rimage_3]      h200front iwi-aor--- 1.82t
   [0_corig_rimage_4]      h200front iwi-aor--- 1.82t
   [0_corig_rimage_5]      h200front iwi-aor--- 1.82t
   [0_corig_rmeta_0]       h200front ewi-aor--- 4.00m
   [0_corig_rmeta_1]       h200front ewi-aor--- 4.00m
   [0_corig_rmeta_2]       h200front ewi-aor--- 4.00m
   [0_corig_rmeta_3]       h200front ewi-aor--- 4.00m
   [0_corig_rmeta_4]       h200front ewi-aor--- 4.00m
   [0_corig_rmeta_5]       h200front ewi-aor--- 4.00m
   [cache0]                h200front Cwi---C--- 
220.00g                    100.00 8.18            0.00
   [cache0_cdata]          h200front Cwi-aor--- 
220.00g                                           100.00
   [cache0_cdata_rimage_0] h200front iwi-aor--- 220.00g
   [cache0_cdata_rimage_1] h200front iwi-aor--- 220.00g
   [cache0_cdata_rmeta_0]  h200front ewi-aor--- 4.00m
   [cache0_cdata_rmeta_1]  h200front ewi-aor--- 4.00m
   [cache0_cmeta]          h200front ewi-aor--- 
512.00m                                           100.00
   [cache0_cmeta_rimage_0] h200front iwi-aor--- 512.00m
   [cache0_cmeta_rimage_1] h200front iwi-aor--- 512.00m
   [cache0_cmeta_rmeta_0]  h200front ewi-aor--- 4.00m
   [cache0_cmeta_rmeta_1]  h200front ewi-aor--- 4.00m
   [lvol0_pmspare]         h200front ewi------- 512.00m

I cannot debug now as for now I've given up the idea to 
encrypt this LV, but  I would say is should be easily 
reproducible (maybe even waste of time looking at my setup) 
I simply tried:

  cryptsetup -v luksFormat /dev/mapper/h200front-0

and that works(ed) with "regurlar" LVs.

$ lsblk
NAME                              MAJ:MIN RM   SIZE RO TYPE 
MOUNTPOINT
sda                                 8:0    0 238.5G  0 disk
├─sda1                              8:1    0     1G  0 part  
/boot
└─sda2                              8:2    0 237.5G  0 part
   ├─SL-root                       253:0    0   150G  0 lvm   /
   └─SL-home                       253:1    0    10G  0 lvm
sdb                                 8:16   0 223.6G  0 disk
├─h200front-cache0_cdata_rmeta_0  253:4    0     4M  0 lvm
│ └─h200front-cache0_cdata        253:8    0   220G  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
├─h200front-cache0_cdata_rimage_0 253:5    0   220G  0 lvm
│ └─h200front-cache0_cdata        253:8    0   220G  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
├─h200front-cache0_cmeta_rmeta_0  253:9    0     4M  0 lvm
│ └─h200front-cache0_cmeta        253:13   0   512M  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
└─h200front-cache0_cmeta_rimage_0 253:10   0   512M  0 lvm
   └─h200front-cache0_cmeta        253:13   0   512M  0 lvm
     └─h200front-0                 253:29   0   9.1T  0 lvm
sdc                                 8:32   0 223.6G  0 disk
├─h200front-cache0_cdata_rmeta_1  253:6    0     4M  0 lvm
│ └─h200front-cache0_cdata        253:8    0   220G  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
├─h200front-cache0_cdata_rimage_1 253:7    0   220G  0 lvm
│ └─h200front-cache0_cdata        253:8    0   220G  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
├─h200front-cache0_cmeta_rmeta_1  253:11   0     4M  0 lvm
│ └─h200front-cache0_cmeta        253:13   0   512M  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
└─h200front-cache0_cmeta_rimage_1 253:12   0   512M  0 lvm
   └─h200front-cache0_cmeta        253:13   0   512M  0 lvm
     └─h200front-0                 253:29   0   9.1T  0 lvm
sdd                                 8:48   0 894.3G  0 disk
└─h300Int1-0                      253:2    0   1.8T  0 lvm
   └─h300Int1.0_crypt              253:27   0   1.8T  0 
crypt /__.aLocalStorages/2
sde                                 8:64   0 894.3G  0 disk
└─h300Int1-0                      253:2    0   1.8T  0 lvm
   └─h300Int1.0_crypt              253:27   0   1.8T  0 
crypt /__.aLocalStorages/2
sdf                                 8:80   0 447.1G  0 disk
└─h300Int0-0                      253:3    0   1.3T  0 lvm
   └─h300Int0.0_crypt              253:28   0   1.3T  0 
crypt /__.aLocalStorages/1
sdg                                 8:96   0 447.1G  0 disk
└─h300Int0-0                      253:3    0   1.3T  0 lvm
   └─h300Int0.0_crypt              253:28   0   1.3T  0 
crypt /__.aLocalStorages/1
sdh                                 8:112  0 447.1G  0 disk
└─h300Int0-0                      253:3    0   1.3T  0 lvm
   └─h300Int0.0_crypt              253:28   0   1.3T  0 
crypt /__.aLocalStorages/1
sdi                                 8:128  0   1.8T  0 disk
├─h200front-0_corig_rmeta_0       253:14   0     4M  0 lvm
│ └─h200front-0_corig             253:26   0   9.1T  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
└─h200front-0_corig_rimage_0      253:15   0   1.8T  0 lvm
   └─h200front-0_corig             253:26   0   9.1T  0 lvm
     └─h200front-0                 253:29   0   9.1T  0 lvm
sdj                                 8:144  0   1.8T  0 disk
├─h200front-0_corig_rmeta_1       253:16   0     4M  0 lvm
│ └─h200front-0_corig             253:26   0   9.1T  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
└─h200front-0_corig_rimage_1      253:17   0   1.8T  0 lvm
   └─h200front-0_corig             253:26   0   9.1T  0 lvm
     └─h200front-0                 253:29   0   9.1T  0 lvm
sdk                                 8:160  0   1.8T  0 disk
├─h200front-0_corig_rmeta_2       253:18   0     4M  0 lvm
│ └─h200front-0_corig             253:26   0   9.1T  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
└─h200front-0_corig_rimage_2      253:19   0   1.8T  0 lvm
   └─h200front-0_corig             253:26   0   9.1T  0 lvm
     └─h200front-0                 253:29   0   9.1T  0 lvm
sdl                                 8:176  0   1.8T  0 disk
├─h200front-0_corig_rmeta_3       253:20   0     4M  0 lvm
│ └─h200front-0_corig             253:26   0   9.1T  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
└─h200front-0_corig_rimage_3      253:21   0   1.8T  0 lvm
   └─h200front-0_corig             253:26   0   9.1T  0 lvm
     └─h200front-0                 253:29   0   9.1T  0 lvm
sdm                                 8:192  0   1.8T  0 disk
├─h200front-0_corig_rmeta_4       253:22   0     4M  0 lvm
│ └─h200front-0_corig             253:26   0   9.1T  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
└─h200front-0_corig_rimage_4      253:23   0   1.8T  0 lvm
   └─h200front-0_corig             253:26   0   9.1T  0 lvm
     └─h200front-0                 253:29   0   9.1T  0 lvm
sdn                                 8:208  0   1.8T  0 disk
├─h200front-0_corig_rmeta_5       253:24   0     4M  0 lvm
│ └─h200front-0_corig             253:26   0   9.1T  0 lvm
│   └─h200front-0                 253:29   0   9.1T  0 lvm
└─h200front-0_corig_rimage_5      253:25   0   1.8T  0 lvm
   └─h200front-0_corig             253:26   0   9.1T  0 lvm
     └─h200front-0                 253:29   0   9.1T  0 lvm
sdo                                 8:224  0   9.1T  0 disk 
/__.aLocalStorages/3

LV is working fine, being a host for all sorts of data, only 
cryptsetup does not work on it.
many thanks.



On 29/08/16 12:22, Ondrej Kozina wrote:
> On 08/29/2016 11:42 AM, lejeczek wrote:
>>
>>
>> On 26/08/16 15:45, Ondrej Kozina wrote:
>>> On 08/26/2016 04:01 PM, lejeczek wrote:
>>>> whatever you might call it, it works, luks encrypting,
>>>> opening & mounting @boot - so I only wonder (which was my
>>>> question) why not cache pool LVs. Is it not supported...
>>>> would be great if a developer sees this question, I'm not
>>>> sure jut yet about filing a bug report.
>>>
>>> In general LVM2 doesn't auto-activate or interpret unknown
>>> device types. LUKS header is considered unknown from LVM2
>>> perspective. Simply put LVM2 doesn't understand LUKS
>>> header data. Not sure what you tried to do with cache pool
>>> LV, but in my opinion any effort to encrypt (live or
>>> detached) cache pool LV may end with severe data
>>> corruption...
>>>
>>> As of now I think you have in general two options:
>>>
>>> a) encrypt both PVs because obviously if you only encrypt
>>> the origin PV you end up with decrypted plaintext data
>>> stored in cache pool. Probably this is the exact scenario
>>> you were about to avoid?
>>>
>>> Unfortunately a) is suboptimal with regard to performance
>>> since you'd perform the encryption of data blocks twice.
>>>
>>> Option b): encrypt the top level LV (the one constructed
>>> from both cache and origin LV). This way ciphertext would
>>> be stored twice in cache PV and origin PV but the
>>> encryption would be performed only once.
>>>
>> gee, guys, thanks Ondrej,
>> this I was saying from the beginning did not work - option b
>> - does not work. I can Not encrypt top level cache pool LV.
>> It does work with any other LV I have, but cache pool fails
>> (like I said earlier) with:
>>
>> Command failed with code 22.
>
> Could you post here 'lsblk' and 'lvs' output together with 
> exact cryptsetup command you have executed to luksFormat 
> your top level cached LV? Please add also --debug option 
> among your original cryptsetup options.
>
> Regards
> Ondrej
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
