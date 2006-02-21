Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1LLMM113136
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 16:22:22 -0500
Received: from kivasystems.com (10.67.14.204.dsci-net.com [204.14.67.10] (may
	be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1LLMKj9006659
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 16:22:20 -0500
Received: from localhost (localhost [127.0.0.1])
	by kivasystems.com (Postfix) with ESMTP id 556F573A124
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 16:22:19 -0500 (EST)
Received: from kivasystems.com ([127.0.0.1])
	by localhost (formicarium.kivasystems.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 23091-01 for <linux-lvm@redhat.com>;
	Tue, 21 Feb 2006 16:22:15 -0500 (EST)
Received: from [192.168.3.188] (unknown [192.168.3.188])
	by kivasystems.com (Postfix) with ESMTP id E3DA573A0CE
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 16:22:14 -0500 (EST)
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Transfer-Encoding: 7bit
Message-Id: <BD8C22BB-D4AF-4117-A615-D67AAD9E81F3@kivasystems.com>
From: Joshua ChaitinPollak <jpollak@kivasystems.com>
Date: Tue, 21 Feb 2006 16:22:10 -0500
Subject: [linux-lvm] Volume Groups and Clusters
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

Hello, I found this mention of sharing Volume Groups across Clusters  
on the LVM howto:

http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html

Am I right in assuming that this means you can have a single volume  
group active on multiple nodes in a cluster, provided that you doing  
mount the same logical volume on more than one node at a time?

Thanks,

Josh

-- 
Joshua ChaitinPollak
Software Engineer
Kiva Systems
