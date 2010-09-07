Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o87IC3Rx017587
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2010 14:12:03 -0400
Received: from sv4-mta-52a.us.emailfiltering.com
	(sv4-mta-52a.emailfiltering.com [208.87.136.233])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o87IBsrU005002
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2010 14:11:54 -0400
Received: from smtp.media-brokers.com ([70.43.81.99])
	by sv4-mta-52a.us.emailfiltering.com with emfmta (version 4.6.0.71)
	vanilla id 686829760 for linux-lvm@redhat.com; c830fd9e0d69e47;
	Tue, 07 Sep 2010 11:11:54 -0700
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id E9D867278DE
	for <linux-lvm@redhat.com>; Tue,  7 Sep 2010 14:11:51 -0400 (EDT)
Message-ID: <4C868067.8050909@Media-Brokers.com>
Date: Tue, 07 Sep 2010 14:11:51 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
References: <AANLkTikbz3mxVyaXtE_gavc3ri-4Y7TJTWmCXxcDkbT=@mail.gmail.com>
In-Reply-To: <AANLkTikbz3mxVyaXtE_gavc3ri-4Y7TJTWmCXxcDkbT=@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Either the superblock or the partition table is
 likely to be corrupted
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 2010-09-07 12:45 PM, James Corteciano <james@linux-source.org> wrote:
> 2) I run system-config-lvm and reduce lv-wf1 from 160G to 70G and
> increased lv-wf2 from 10G to 30G. 
> 
> Now, when I run the rhcs-nfs1 service using the command "clusvcadm
> -e rhcs-nfs1 -m rhcs-node1", I got failed result. I have checked the 
> /var/log/messages and this is the output.

Dumb/obvious question... you did reduce the size of the filesystem
*before* reducing the size of the LV, right?

-- 

regards,

Charles
