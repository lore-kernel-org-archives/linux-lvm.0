Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i82HutJ0018304
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 18:56:55 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C2vpP-0005IE-0E
	for linux-lvm@redhat.com; Thu, 02 Sep 2004 18:56:55 +0100
Date: Thu, 2 Sep 2004 18:56:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Suggested Kernel and LVM version for production
	storage
Message-ID: <20040902175654.GH6264@agk.surrey.redhat.com>
References: <413195B2.3050103@jct.ac.il>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <413195B2.3050103@jct.ac.il>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Aug 29, 2004 at 11:37:06AM +0300, Yedidia Klein wrote:
> Sometimes I'm getting the following errors, and get all my LVM 
> FileSystem Blocked .. (mean I can't access the files on these partitions 
> and have to reboot for getting access again)
 
>    Aug 26 01:00:02 nazir kernel: device-mapper: 
>                          Unable to allocate hash table space 

i.e. There wasn't enough memory available to set up the snapshot.
What sizes:  How big is the LV & snapshot? 
What chunk size?  [Try changing.]
Is there just one snapshot?
Check your memory usage.

Alasdair
-- 
agk@redhat.com
