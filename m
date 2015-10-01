Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t91GGBL2025669
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 1 Oct 2015 12:16:11 -0400
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (Postfix) with ESMTPS id 40B08C0A148E
	for <linux-lvm@redhat.com>; Thu,  1 Oct 2015 16:16:08 +0000 (UTC)
Received: by lahh2 with SMTP id h2so77943444lah.0
	for <linux-lvm@redhat.com>; Thu, 01 Oct 2015 09:16:07 -0700 (PDT)
Received: from [192.168.43.226] ([78.25.121.70])
	by smtp.gmail.com with ESMTPSA id
	j189sm747961lfg.48.2015.10.01.09.10.36 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 09:10:37 -0700 (PDT)
References: <560BFF8B.7030006@koolin.ru> <560D1857.9070909@redhat.com>
From: Timofey Koolin <timofey@koolin.ru>
Message-ID: <560D5AFA.5000500@koolin.ru>
Date: Thu, 1 Oct 2015 19:10:34 +0300
MIME-Version: 1.0
In-Reply-To: <560D1857.9070909@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Usable space in PV
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

Task - problem.
I make universal extender of filesystem (for example extend fs in 
virtual computer after resize disk or add space to filesystem in hosting 
server, etc.). Before extend volume group and filesystem I want to make 
plan of extends. For plan I need to know how many bytes it can add to VG 
from disk/partition. I know size of disk, partition, free space - and I 
have to know free space after create PV on free space of disk.
I don't know how many LV will be on target system (system, which run 
fsextender), I don't know fragmentation of it and etc.
Is any way to know how many space take metadata and how many space will 
be usable?

On 01.10.2015 14:26, Zdenek Kabelac wrote:
> Dne 30.9.2015 v 17:28 Timofey Koolin napsal(a):
>> Task: calc usable space of PV before create PV and before create 
>> partition for
>> PV.
>>
>> In my experiments usable space in PV = PVSize / ExtentSize * 
>> ExtentSize with
>> integer operations.
>> But when Metadata may be large - when LVM have a lot of logical 
>> volumes and it
>> can take more space.
>>
>> I found in /etc/lvm/lvm.conf parameter pvmetadatasize = 255 secotors 
>> (default).
>> What will if metadata will grow to more then 255 sectors?
>>
>
>
> If you plan to host lots of LVs within a single VG (in range of hundreds)
> use i.e. 'pvcreate --metadatasize 5M'
> (i.e. ~7000 linear single segment LVs  takes around 2.2MB and you need 
> space for at least 2 metadatas to fit in)
>
> What I'm not quite sure is your 'task' - what's the purpose ?
> Do you want to do some 'sector' precise emulation of what lvm2 is 
> doing by watching resuls of couple command with just subset of it's 
> options ?
>
> Isn't better to read man pages ?
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Timofey Koolin
