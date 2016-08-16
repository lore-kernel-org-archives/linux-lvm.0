Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7G9iRmf016721
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2016 05:44:27 -0400
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B08499D4A
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2016 09:44:26 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id o80so155090122wme.1
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2016 02:44:26 -0700 (PDT)
References: <CAOXD2Kufsndmiian5NwV5Cmg+CAZeiKRyzDRQdazbkOzs0LL9Q@mail.gmail.com>
	<aa376169-db61-4b17-06cf-10e6495e8b15@gathman.org>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <56821cec-70f8-086a-7e5b-6db8f0a9b780@gmail.com>
Date: Tue, 16 Aug 2016 11:44:23 +0200
MIME-Version: 1.0
In-Reply-To: <aa376169-db61-4b17-06cf-10e6495e8b15@gathman.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots & data security
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
To: LVM general discussion and development <linux-lvm@redhat.com>, stuart@gathman.org

Dne 27.7.2016 v 21:17 Stuart Gathman napsal(a):
> On 07/19/2016 11:28 AM, Scott Sullivan wrote:
>>
>> Could someone please clarify if there is a legitimate reason to worry
>> about data security of a old (removed) LVM snapshot?
>>
>> For example, when you lvremove a LVM snapshot, is it possible for data
>> to be recovered if you create another LVM and it happens to go into
>> the same area as the old snapshot we lvremoved?
>>
>> If this helps clarify, do we have to worry about security scrubbing a
>> LVM snapshot for data security ?
>>
> Another idea: if your VG is on SSD, and properly aligned, then DISCARD
> on the new LV will effectively zero it as far as any guest VMs are
> concerned.  (The data is still on the flash until erased by the
> firmware, of course.)  If VG and PE size do not align with the SSD erase
> block, then you can still zero the "edges" of the new LV, which is much
> faster (and less wear on the SSD) than zeroing the whole thing.  You
> could always read-verify that the data is actually all zero.

Yes - as already suggested -  once you create a new LV -
you can  'blkdicard /dev/vg/lv'

Note - SSD may not always ensure blocks are zeroed - they could just
move trimmed block into reuse list with undefined content.

Anyway - lvm2 is not tool for data protection and it's upto system admin
to ensure there are no data leaks.

So pick the solution which fits best your needs - lvm2 provides all the 
tooling for it.

Regards

Zdenek
