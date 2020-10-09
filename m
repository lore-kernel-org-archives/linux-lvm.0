Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CE712166BCC
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 15:18:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84EC78EF5AC
	for <linux-lvm@redhat.com>; Fri,  9 Oct 2020 15:18:44 +0000 (UTC)
References: <fee58e48-151f-9eab-a6a2-eb31c690029c@alteeve.ca>
	<32651cc4-159f-a7f3-83cc-1e1c50071b93@redhat.com>
From: Digimer <lists@alteeve.ca>
Message-ID: <b3d53a4d-dafe-4d92-700a-f9df28061020@alteeve.ca>
Date: Fri, 9 Oct 2020 11:18:38 -0400
MIME-Version: 1.0
In-Reply-To: <32651cc4-159f-a7f3-83cc-1e1c50071b93@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM PV UUID problem
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 2020-10-09 10:43 a.m., Zdenek Kabelac wrote:
> Dne 09. 10. 20 v 15:12 Digimer napsal(a):
>> Hi all,
>>
>>    I'm storing LVM information in a postgres database, and wanted to use
>> the UUID from the PVs / VGs / LVs as the UUIDs in the database. I
>> noticed when I tried to do this that postgres complained that the UUID
>> was not valid. I checked with an online UUID validator
>> (https://www.freecodeformat.com/validate-uuid-guid.php) and it also
>> reported as invalid.
>>
>> Example;
>>
>> ====
>> # pvdisplay | grep UUID
>>    PV UUID               jLkli2-dEXx-5Y8n-pYlw-nCcy-9dFL-3B6jU3
>> ====
>>
>>    Is this a known issue?
>>
> 
> Hi
> 
> At the time of lvm2 devel I believe UUID was just a unique identifier,
> later some effort to standardize it came in.
> 
> But really you should NOT be using basically internal unique identifiers
> in your DB - this are internal to DM/LVM work and might be changed at
> any time to something else.
> 
> User is supposed to use  'vgname' & 'lvname'  - so there you can put those
> valid UUID sequences - although human readable strings are always nicer ;)
> 
> Zdenek

The trick is that VG and LV names can change, so I wanted to use the
(so-called) UUID as a way to keep track of a given item through name
changes.

I suppose I'll have to rework to use the internal "UUIDs" as more like
serial numbers instead...

-- 
Digimer
Papers and Projects: https://alteeve.com/w/
"I am, somehow, less interested in the weight and convolutions of
Einstein’s brain than in the near certainty that people of equal talent
have lived and died in cotton fields and sweatshops." - Stephen Jay Gould
