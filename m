Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBCHmYH6024795
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 17:48:34 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CdXpi-0002EN-12
	for linux-lvm@redhat.com; Sun, 12 Dec 2004 17:48:34 +0000
Date: Sun, 12 Dec 2004 17:48:34 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm lost after debian upgrade
Message-ID: <20041212174834.GO11338@agk.surrey.redhat.com>
References: <41BA5A7F.1010302@danielroth.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41BA5A7F.1010302@danielroth.se>
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

On Sat, Dec 11, 2004 at 03:25:03AM +0100, Daniel Roth wrote:
> My lvm is at /dev/volume_group/mylv, my lvm consisted of hde,g,i

Known issues with Debian:

  lvm.conf detect_md_component should be set to 1 not 0

  lvm.conf filters - check if cdrom drive is excluded correctly:
    sometimes the cdrom exclusion points to a real hard disk by mistake

Use pvscan -P to check what LVM2 actually sees.

Alasdair
-- 
agk@redhat.com
