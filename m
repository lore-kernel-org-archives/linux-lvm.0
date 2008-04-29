Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3T8tta5018369
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 04:55:56 -0400
Received: from jeltz.chrissie.net (vpn-6-23.fab.redhat.com [10.33.6.23])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m3T8ttlO013513
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 04:55:55 -0400
Message-ID: <4816E299.4080505@redhat.com>
Date: Tue, 29 Apr 2008 09:55:53 +0100
From: Christine Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Patch to clvmd-openais.c again
References: <1cafab770804250311n1c530743h30cbd62e725f345f@mail.gmail.com>	<1cafab770804250312y7556ceddu3cff6a4c13a06355@mail.gmail.com>	<4815918E.5080806@redhat.com>
	<1cafab770804280927u69a71c26n7a6857f958efd020@mail.gmail.com>
In-Reply-To: <1cafab770804280927u69a71c26n7a6857f958efd020@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Xinwei Hu wrote:
>> Your patch has now been included in upstream clvmd.
> 
> Thanks for the inclusion.
> 
> And here are another 2:
> . remove_lock_wait.diff remove the definition of "struct lock_wait",
> which is not used since the switch away from async version saLck
> . num_nodes should equal to member_list_entries, i.e.
> joined_list_entires is 0 when a node leaves the group.
> 
> Would you help review them ;)

Those patches also look good. They are now in CVS.

Thanks!

Chrissie
