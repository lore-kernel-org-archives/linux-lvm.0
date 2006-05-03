Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k43GW4P0011882
	for <linux-lvm@redhat.com>; Wed, 3 May 2006 17:32:04 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FbKGi-0006qN-CX
	for linux-lvm@redhat.com; Wed, 03 May 2006 17:32:04 +0100
Date: Wed, 3 May 2006 17:32:04 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Importing a VG with existing name
Message-ID: <20060503163204.GW16180@agk.surrey.redhat.com>
References: <200605021333.13986.tennert@science-computing.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200605021333.13986.tennert@science-computing.de>
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

On Tue, May 02, 2006 at 01:33:13PM +0200, Oliver Tennert wrote:
> can anybody tell me what the best way is to import a volume group, when the 
> vg's name already exists in the system?
 
Version 2.02.05 lets you rename it by giving its uuid to vgrename
in place of its name.

Prior to that you can set up a one-off lvm.conf file with filters that
exclude everything except the disk(s) being imported and use the
LVM_SYSTEM_DIR environment variable to point lvm at the temporary
configuration file.

Alasdair
-- 
agk@redhat.com
