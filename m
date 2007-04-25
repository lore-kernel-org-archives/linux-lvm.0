Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3PK0fb5023652
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 16:00:43 -0400
Received: from emailgate2.cpvie.co.at (smtp.cargo-partner.com [195.234.151.28])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3PK0dUg016112
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 16:00:40 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id 0D6B740C66
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 22:00:34 +0200 (CEST)
Received: from cp.com (mail.cargo-partner.com [10.10.201.21])
	by emailgate2.cpvie.co.at (Postfix) with ESMTP id 7CFCF40C0F
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 22:00:33 +0200 (CEST)
Received: from [81.217.103.251] (account eisenkoe@cargo-partner.com HELO
	[10.1.1.15]) by cp.com (CommuniGate Pro SMTP 5.1.8)
	with ESMTPA id 23299482 for linux-lvm@redhat.com;
	Wed, 25 Apr 2007 22:00:33 +0200
Message-ID: <462FB35F.3010904@cargo-partner.com>
Date: Wed, 25 Apr 2007 22:00:31 +0200
From: =?ISO-8859-1?Q?Michael_Eisenk=F6lbl?= <eisenkoe@cargo-partner.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clusteredVG+mirroredLV
References: <20070425121838.70D3A732E7@hormel.redhat.com>	<97982DAF1EA1494DB6C65C2EEAA6296105EAA2D1@CORPUSMX40B.corp.emc.com>
	<25F6FD1D-0C06-49C5-99D0-2029DB762115@redhat.com>
In-Reply-To: <25F6FD1D-0C06-49C5-99D0-2029DB762115@redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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

Does anybody know, when it will be official released (rhel4u5)?
or is there any rpm, which i can dowload to patch my kernel?
how can I create the dm_cmirror myself?

michael

Jonathan Brassow wrote:
> cluster mirroring is slated to come out with rhel4 u5
>
> It will not be immediately available in rhel5.
>
> There are two versions of cluster mirroring.  One which will go into 
> rhel4u5.  The other is to go upstream and into rhel5 at some point.  
> The re-write is based on OpenAIS.
>
>  brassow
>
> On Apr 25, 2007, at 9:46 AM, Lin_ChiiShing@emc.com wrote:
>
>>
>> I am using source with cvs tag RHEL4U4, and was able to go into
>> cmirror-kernel directory to build the module dm-cmirror.ko
>>
>> After loading dm_cmirror module, the system-config-lvm tool
>> configured a mirrored LV in a clustered VG successfully.
>>
>> Can someone in RedHat shed light on what's the current status of source
>> for cmirror-kernel and clustered mirroring?
>> What's expected to work (such as normal IO), and
>> what's expected not to work yet ? For early bird developers who are 
>> interested in
>> using this technology, do you have a recommended CVS tag for the 
>> source to do the prototype ?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
