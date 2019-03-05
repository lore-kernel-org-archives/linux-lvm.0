Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2128A608C8
	for <linux-lvm@redhat.com>; Tue,  5 Mar 2019 07:54:20 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20A27307E046
	for <linux-lvm@redhat.com>; Tue,  5 Mar 2019 07:54:19 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x257iNSv139928
	for <linux-lvm@redhat.com>; Tue, 5 Mar 2019 02:54:18 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2r1j1uxycp-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 05 Mar 2019 02:54:18 -0500
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Tue, 5 Mar 2019 07:54:16 -0000
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
	<30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
	<CAMRbyyuVek7CnYhD3S6JcYLTfxP73CScpErCX3D2eapbfJgd4g@mail.gmail.com>
	<840f278d-fc42-a2ea-03b2-cea5f32b4837@gmail.com>
	<CAMRbyyuK+w5bM4QLewDpMWzjVwa=nyrUS6rmgri0OATdWW4Avw@mail.gmail.com>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Tue, 5 Mar 2019 08:54:12 +0100
MIME-Version: 1.0
In-Reply-To: <CAMRbyyuK+w5bM4QLewDpMWzjVwa=nyrUS6rmgri0OATdWW4Avw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <2c942603-4704-4919-eb0e-52fc7990000c@linux.ibm.com>
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
Content-Type: text/plain; charset="utf-8"
To: Nir Soffer <nsoffer@redhat.com>, Cesare Leonardi <celeonar@gmail.com>
Cc: David Teigland <teigland@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 05.03.2019 00:22, Nir Soffer wrote:
> On Tue, Mar 5, 2019 at 12:45 AM Cesare Leonardi <celeonar@gmail.com> wrote:
> 
>> On 02/03/19 21:25, Nir Soffer wrote:
>>> # mkfs.xfs /dev/test/lv1
>>> meta-data=/dev/test/lv1          isize=512    agcount=4, agsize=25600
>> blks
>>>           =                       sectsz=512   attr=2, projid32bit=1
>>>           =                       crc=1        finobt=1, sparse=0,
>>> rmapbt=0, reflink=0
>>> data     =                       bsize=4096   blocks=102400, imaxpct=25
>>>           =                       sunit=0      swidth=0 blks
>>> naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
>>> log      =internal log           bsize=4096   blocks=855, version=2
>>>           =                       sectsz=512   sunit=0 blks, lazy-count=1
>>> realtime =none                   extsz=4096   blocks=0, rtextents=0
>>
>> Has the problem here the same root as for ext4? I guess sectsz should be
>>  >=4096 to avoid troubles, isn't it?
>>
>> Just to draw some conlusion, could we say that currently, if we are
>> going to move data around with LVM, it's better to check that the
>> filesystem is using a block size >= than "blockdev --getbsz
>> DESTINATIONDEVICE"? At least with ext4 and xfs.
>>
>> Something that couldn't be true with really small devices (< 500 MB).
>>
>> Is there already an open bug regarding the problem discussed in this
>> thread?
>>
> 
> There is this bug about lvextend:
> https://bugzilla.redhat.com/1669751
> 
> And this old bug from 2011, discussing mixing PVs with different block size.
> Comment 2 is very clear about this issue:
> https://bugzilla.redhat.com/732980#c2
I don't have access to that one, can you cite comment 2 ?
> 
> Nir
> 


-- 
Ingo Franzki
eMail: ifranzki@linux.ibm.com  
Tel: ++49 (0)7031-16-4648
Fax: ++49 (0)7031-16-3456
Linux on IBM Z Development, Schoenaicher Str. 220, 71032 Boeblingen, Germany

IBM Deutschland Research & Development GmbH / Vorsitzender des Aufsichtsrats: Matthias Hartmann
Geschäftsführung: Dirk Wittkopp
Sitz der Gesellschaft: Böblingen / Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM DATA Privacy Statement: https://www.ibm.com/privacy/us/en/
