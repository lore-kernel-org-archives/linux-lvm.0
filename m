Received: from [192.168.1.2] (vpn-68-16.surrey.redhat.com [10.32.68.16])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k81CiooB027046
	for <linux-lvm@redhat.com>; Fri, 1 Sep 2006 13:44:50 +0100
Message-ID: <44F82B40.3050906@redhat.com>
Date: Fri, 01 Sep 2006 13:44:48 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] RHEL4, LVM and Locking type 3 (cluster)
References: <072F438B739FD04ABAAF668C117EAB64D46313@ziff.int.tbc.co.uk>
In-Reply-To: <072F438B739FD04ABAAF668C117EAB64D46313@ziff.int.tbc.co.uk>
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

brett.dellegrazie@uk.logicalis.com wrote:
> Hi,
>  
> Sorry if this is on the FAQ but I can't seem to find it.
> Has anyone had any experience with using LVM and Locking Type 3
> (internal cluster locking).
>  
> I have attempted to use this primarily to put LVM on a SAN.
> However, when I try to create the physical volume initially I get:
>  
> [root@somehost ~]# pvcreate --verbose /dev/sdb
>   connect() failed on local socket: Connection refused
>   Locking type 3 initialisation failed.

That nearly always means that clvmd isn't running.

> Effectively stopping this technique.  Is RHEL4's version of LVM not
> compiled --with-cluster=internal option?
>  


-- 

patrick
