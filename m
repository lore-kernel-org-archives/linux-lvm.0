Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NJgDbb013027
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:42:13 -0400
Received: from mailstore03.fastname.no (mailstore03.fastname.no [85.19.150.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NJg1CA006274
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:42:02 -0400
Received: from [84.49.98.38] (helo=[192.168.3.20])
	by mailstore03.fastname.no with esmtpa (Exim 4.69)
	(envelope-from <morten@mortent.org>) id 1N1Q1A-00015q-4D
	for linux-lvm@redhat.com; Fri, 23 Oct 2009 21:41:44 +0200
Message-ID: <4AE206FF.2050606@mortent.org>
Date: Fri, 23 Oct 2009 21:41:51 +0200
From: Morten Torstensen <morten@mortent.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mirrored LVs
References: <4AE1B9FB.504@mortent.org>
	<20091023172914.GA12748@us.ibm.com>	<1958a88d0910231128x2b072b48q504d56b03da39196@mail.gmail.com>
	<20091023190230.GA13442@us.ibm.com>
In-Reply-To: <20091023190230.GA13442@us.ibm.com>
Content-Transfer-Encoding: 7bit
Reply-To: morten@mortent.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 23.10.2009 21:02, malahal@us.ibm.com wrote:
>> In a LE it would be mirrored too and a copy would be in each mirror...
>
> That is not possible with the current LVM code. The log can't be a
> 'mirror' segment. Jonathan posted few patches to place the log on
> mirrored segment but the code is not in the upstream yet!

So keep the map in the vgda, with a copy on each pv, or somewhere 
similar. It should just be a map of which LE is stale and doesn't have 
to be big anyway.

Maybe IBM should donate some LVM code to linux :)

-- 

//Morten Torstensen
//Email: morten@mortent.org
//IM: morten.torstensen@gmail.com

I can't listen to that much Wagner. I start getting the urge to conquer 
Poland.
	-- Woody Allen
