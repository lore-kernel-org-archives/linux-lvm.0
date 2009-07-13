Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6DHAi8I027157
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 13:10:44 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6DHASvf024797
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 13:10:29 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e38.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n6DH3XB8017238
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 11:03:33 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6DH6p3w223828
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 11:06:51 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6DH6ot5031667
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 11:06:50 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n6DH6ont031642
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 11:06:50 -0600
Date: Mon, 13 Jul 2009 10:06:49 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] LVM mirroring or mdadm
Message-ID: <20090713170649.GA9504@us.ibm.com>
References: <200907131732.20178.imobachgs@banot.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200907131732.20178.imobachgs@banot.net>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Imobach Gonz?lez Sosa [imobachgs@banot.net] wrote:
> Hi all,
> 
> I've got a pair of identical Seagate disks on a server and I'm considering 
> using a software RAID (RAID1). I was thinking of setting up LVM on a mdadm 
> RAID, but I've read that LVM has support itself for mirroring.
> 
> So, what is the better approach? Using LVM mirroring capabilities or putting 
> the LVM on a mdadm RAID 1?

LVM on mdadm RAID1 is more stable than LVM's own mirroring at the
moment.

--Malahal.
