Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D94CF60BFB
	for <linux-lvm@redhat.com>; Thu, 11 Jul 2019 02:44:04 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0DD8F30BC588
	for <linux-lvm@redhat.com>; Thu, 11 Jul 2019 02:44:02 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Thu, 11 Jul 2019 02:44:02 +0000
From: Gang He <GHe@suse.com>
Date: Thu, 11 Jul 2019 02:25:59 +0000
Message-ID: <CH2PR18MB32067BD6FBA17E47168C2597CFF30@CH2PR18MB3206.namprd18.prod.outlook.com>
References: <CH2PR18MB3206CB2E1FB879E424FCA2BACFF00@CH2PR18MB3206.namprd18.prod.outlook.com>
	<c6f91be7-fc45-3233-315d-70e1bc8eb9cc@redhat.com>
In-Reply-To: <c6f91be7-fc45-3233-315d-70e1bc8eb9cc@redhat.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Which lvm2 code branches are important?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello Marian,

Thank for your reply.
About the detailed changes for V2.03, where do we can find the related documents from the external link?

Thanks
Gang

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Marian Csontos
Sent: 2019��7��10�� 20:48
To: LVM general discussion and development <linux-lvm@redhat.com>; Gang He <GHe@suse.com>
Subject: Re: [linux-lvm] Which lvm2 code branches are important?

On 7/10/19 8:42 AM, Gang He wrote:
> Hello List,
> 
> After you clone the code from git://sourceware.org/git/lvm2.git, you can find lots of remote code branches.
> But which code branches are important for the third party users/ developer? That means we should monitor these code branches.
> For example,
> Which code branches are main (or long-active) code branches?
> Which code branches are used for which lvm2 products (big versions)?

master - 2.03 branch, new features land here,
stable-2.02 - legacy 2.02 branch, bug fixes mostly.

> What are the main differences between different lvm2 products? E.g. some features are added/removed.

2.03 vs 2.03:

- dropped lvmetad and clvmd,
- added handling of writecache and VDO targets.

> 
> 
> Thanks a lot.
> Gang
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
