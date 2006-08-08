Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k78F1frf015890
	for <linux-lvm@redhat.com>; Tue, 8 Aug 2006 11:01:41 -0400
Received: from omner.org (www.omner.org [64.79.194.221])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k78F1Ylf020628
	for <linux-lvm@redhat.com>; Tue, 8 Aug 2006 11:01:35 -0400
Received: from omner.org (vps.omner.org [127.0.0.1])
	by omner.org (Postfix) with ESMTP id DD695863C130
	for <linux-lvm@redhat.com>; Tue,  8 Aug 2006 15:01:33 +0000 (UTC)
Received: from [192.168.2.119] (cpe-66-87-227-104.ut.sprintbbd.net
	[66.87.227.104]) by omner.org (Postfix) with ESMTP id 8E77D863C12F
	for <linux-lvm@redhat.com>; Tue,  8 Aug 2006 15:01:32 +0000 (UTC)
Subject: Re: [linux-lvm] Running LVM on shared LUNs
From: Joshua Aune <luken@omner.org>
In-Reply-To: <200608080050.42004.peregrine@openbrainstem.net>
References: <1154987972.16651.28.camel@localhost.localdomain>
	<200608080050.42004.peregrine@openbrainstem.net>
Date: Tue, 08 Aug 2006 09:01:50 -0600
Message-Id: <1155049310.16651.42.camel@localhost.localdomain>
Mime-Version: 1.0
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

On Tue, 2006-08-08 at 00:50 -0600, Lamont R. Peterson wrote:
> > The million dollar question is, can system1 and system2
> simultaneously
> > have both of the VGs active without hosing any data?
                                                  ^^ lvm metadata
> 
> As I understand it, only if you are using a filesystem that supports
> clustered operations, like GFS.
> 

Just to be clear, I should be able to issue [lv|vg]change -ay on both
systems simultaneously with no LVM corruption (data integrity will be
maintained by not starting a filesystems on both nodes simultaneously)
(as long as I don't start the filesystem on both nodes).

I would use something like GFS, but this is a HA setup for Lustre
oss/mds nodes :) 

Thanks again,
Josh
