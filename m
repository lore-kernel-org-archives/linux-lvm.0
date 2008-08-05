Received: from pobox.corp.redhat.com (pobox.corp.redhat.com [10.11.255.20])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m75FKRrk016249
	for <linux-lvm@redhat.com>; Tue, 5 Aug 2008 11:20:27 -0400
Received: from [192.168.1.104] (vpn-13-88.rdu.redhat.com [10.11.13.88])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m75FKPNp005699
	for <linux-lvm@redhat.com>; Tue, 5 Aug 2008 11:20:26 -0400
Message-Id: <54CA3782-8BC9-4F64-B209-2066B2315E77@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <48985774.2080509@squirk.org>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v928.1)
Subject: Re: [linux-lvm] the lvm shared storage question of the week
Date: Tue, 5 Aug 2008 10:20:24 -0500
References: <48985774.2080509@squirk.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Our testing group has machines that use AOE.  It works well with  
CLVM.  However, they use their machines as a cluster.  It seems to me  
that you want to carve up your storage, but you only want one machine  
to use each piece.

LVM manual briefly mentions CLVM (should apply equally well to debian):
http://www.redhat.com/docs/manuals/enterprise/RHEL-5-manual/Cluster_Logical_Volume_Manager/index.html

You will want to come up to speed on the cluster infrastructure (at  
least the setup) if you want to use CLVM....

  brassow

On Aug 5, 2008, at 8:36 AM, Jean Spirat wrote:

> Hello there,
>
> Is there any hint or any links anyone could share for the use of lvm  
> on an AOE storage (shared block device over the network). I wanted  
> to know how to create lvm group on a device that is shared among  
> several host.
>
>
> so i use debian 4 servers that acces a AOE target drive. The servers  
> all mount the etherdrive and i want to use lvm to partition this  
> 4Terabyte  block device in smaller chunck. what should be the best  
> way to do that ?
>
> While googling about this i found  references to clvm but no  
> documentation i could use on how to set it up. Is this the way to go ?
>
>
> regards,
> Jean.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
