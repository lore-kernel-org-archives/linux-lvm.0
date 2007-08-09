Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l797NOgh003815
	for <linux-lvm@redhat.com>; Thu, 9 Aug 2007 03:23:24 -0400
Received: from mail.streamline-computing.com (mail.streamline-computing.com
	[87.127.209.200])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l797NFmj025900
	for <linux-lvm@redhat.com>; Thu, 9 Aug 2007 03:23:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.streamline-computing.com (Postfix) with ESMTP id 35873BB33
	for <linux-lvm@redhat.com>; Thu,  9 Aug 2007 08:23:10 +0100 (BST)
Received: from mail.streamline-computing.com ([127.0.0.1])
	by localhost (mail.streamline-computing.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 6jPTJSMTkhxT for <linux-lvm@redhat.com>;
	Thu,  9 Aug 2007 08:23:07 +0100 (BST)
Received: from [192.168.1.13] (unknown [212.159.87.168])
	by mail.streamline-computing.com (Postfix) with ESMTP id 3A415BB31
	for <linux-lvm@redhat.com>; Thu,  9 Aug 2007 08:23:07 +0100 (BST)
Subject: Re: [linux-lvm] Best practice: metadata backup
From: John Hearns <john.hearns@streamline-computing.com>
In-Reply-To: <Pine.LNX.4.44.0708081447350.23150-100000@bmsred.bmsi.com>
References: <Pine.LNX.4.44.0708081447350.23150-100000@bmsred.bmsi.com>
Date: Thu, 09 Aug 2007 08:23:54 +0100
Message-Id: <1186644244.11799.6.camel@Vigor13>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: john.hearns@streamline-computing.com,
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2007-08-08 at 15:03 -0400, Stuart D. Gathman wrote:

> 
> I've always been interested in data storage that can recover from
> disaster.  I designed a database filesystem that stores a table id
> in every block, so that usable tables and directories can be recovered
> regardless of what portion of the filesystem is wiped out (missing records,
> of course).  It has saved our customers butt several times ("No, we don't
> know where the backup tapes have gone...we took them offsite like you said.
> You didn't say anything about bringing them back.").

Something along the lines of an object-based filesystem?
Great minds think alike!

I do a lot of work with Panasas  www.panasas.com
and Lustre   www.clusterfs.com


Not that familiar with ZFS - anyone care to comment?
