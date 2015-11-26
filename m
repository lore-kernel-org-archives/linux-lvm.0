Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAQH7Gld016412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 12:07:16 -0500
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mx1.redhat.com (Postfix) with ESMTPS id 98205C0B7AA7
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 17:07:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAQH7CAT010978
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 09:07:12 -0800 (PST)
Message-ID: <56573C3E.3060501@windriver.com>
Date: Thu, 26 Nov 2015 11:07:10 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
References: <565734C4.5020402@windriver.com>
	<20151126164353.GA5235@agk-dp.fab.redhat.com>
In-Reply-To: <20151126164353.GA5235@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin_check called with wrong path during "vgchange
 -ay"
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
To: linux-lvm@redhat.com

On 11/26/2015 10:43 AM, Alasdair G Kergon wrote:
> On Thu, Nov 26, 2015 at 10:35:16AM -0600, Chris Friesen wrote:
>> controller-0:/home/wrsroot# vgchange -ay cinder-volumes
>>    Check of thin pool cinder-volumes/cinder-volumes-pool failed
>> (status:1). Manual repair required (thin_dump --repair
>> /dev/mapper/cinder-volumes-cinder-volumes-pool_tmeta)!
>
> I don't see that upstream. Try upgrading lvm2.
>
> Alasdair

I think I found it.  Git commit e866931 (Improve thin_check option passing) has 
"Fix dm name usage for thin pools with '-' in name." in the commit message.

Looks like it went into 2.2.96, one version after the one I'm using.  Just my 
luck. :)

Chris
