Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0RMML110968
	for <linux-lvm@redhat.com>; Fri, 27 Jan 2006 17:22:21 -0500
Received: from mail.funsoft.com (funsoft.funsoft.com [71.129.27.18])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0RMMJSo009570
	for <linux-lvm@redhat.com>; Fri, 27 Jan 2006 17:22:19 -0500
Received: from [192.168.5.27] (funsoft.funsoft.com [192.168.11.1])
	by mail.funsoft.com (8.11.6/8.11.0) with ESMTP id k0RMMDY23379
	for <linux-lvm@redhat.com>; Fri, 27 Jan 2006 14:22:13 -0800
Message-ID: <43DA9D01.5050602@funsoft.com>
Date: Fri, 27 Jan 2006 17:21:53 -0500
From: Gary Eheman <eheman@funsoft.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] error msg: VG vgc1 metadata too large for circular
	buffer
References: <43DA841D.3080208@funsoft.com>
	<20060127213314.GF4280@agk.surrey.redhat.com>
In-Reply-To: <20060127213314.GF4280@agk.surrey.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: eheman@funsoft.com,
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

Alasdair:
Many thanks.  I blew away the pv with your suggested pvremove and 
recreated specifying a large metadatasize (16M, since  am experimenting) 
and all worked as desired this time around.


Alasdair G Kergon wrote:
> On Fri, Jan 27, 2006 at 03:35:41PM -0500, Gary Eheman wrote:
>> I can destroy the data. In fact, that is what I would like to do, but 
>> softly using lvremove, vgremove, pvremove if possible. But I can't get 
>> around the current error.
>>
>> Advice,please?  Are there parameters I can give during the creation of 
>> the group or volume to avoid this?
> 
> As you realised, you need to recreate the PV with a much larger 
> metadatasize.
> 
> There are no tools yet to manipulate it after it's been created.
> 
> If you can throw it away, do that: vgchange -an to deactivate everything
> then pvremove -ff to destroy it.
> 
> [If you weren't able to do that, there are workarounds involving making
> lvm2 stop using that metadata area and using a new larger one somewhere
> else instead.]
> 
> Alasdair

-- 
Gary Eheman
Fundamental Software, Inc.
http://www.funsoft.com
