Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j11H0OS9017498
	for <linux-lvm@redhat.com>; Tue, 1 Feb 2005 17:00:24 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Cw1O4-0005Nc-De
	for linux-lvm@redhat.com; Tue, 01 Feb 2005 17:00:24 +0000
Date: Tue, 1 Feb 2005 17:00:24 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problem mounting logical volumes after system rebuild.
Message-ID: <20050201170024.GN14093@agk.surrey.redhat.com>
References: <OFF68A4A6E.CB0EB5AC-ON80256F9B.003D8F55-80256F9B.0041559D@notes.cat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFF68A4A6E.CB0EB5AC-ON80256F9B.003D8F55-80256F9B.0041559D@notes.cat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Feb 01, 2005 at 11:54:47AM +0000, Steve M Blackwell wrote:
> Does anyone know how to create a LVM1 volume group and logical volumes 
> with LVM2 tools. The reason I ask is because the tools on my rescue CD 
> have LVM2 on it and I am trying to rebuild my RHEL 3 server which uses 
> LVM1. I think the main problem is the metadata being create in the wrong 
> version and I am not sure how to change it.
 
Add -M1 to commands.
Or have lvm.conf: global { format = "lvm1" }

Alasdair
-- 
agk@redhat.com
