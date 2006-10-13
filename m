Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DAEJUt016234
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 06:14:19 -0400
Received: from smtp002.apm-internet.net (smtp002.apm-internet.net
	[85.119.248.10])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k9DAEHeh031204
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 06:14:17 -0400
Message-ID: <452F66EF.5010005@mogmail.net>
Date: Fri, 13 Oct 2006 11:14:07 +0100
From: Nick <lists@mogmail.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using LVM snapshots for hourly backups
References: <452BFBF9.3060301@overnetdata.com>
	<bdb432dd699ec60a109bea3831d5d7d2@redhat.com>
In-Reply-To: <bdb432dd699ec60a109bea3831d5d7d2@redhat.com>
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

Sounds like it's not available in LVM but I achieve simmilar results 
with rsync. Take a look at this for some pointers.

http://www.mikerubel.org/computers/rsync_snapshots/

Nick

Jonathan E Brassow wrote:
> I think everyone feels the same way about the current snapshot 
> implementation, and there is growing momentum for change. See 
> "*[dm-devel] [RFC] DM Snapshot scalability - Common snap store 
> approach*" (Oct 9th on dm-devel).
>
> Certainly, any changes will take a while though.
>
> brassow
>
