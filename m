Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j27KVIn03602
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2005 15:31:18 -0500
Received: from marketview.co.nz (210-54-92-188.ipnets.xtra.co.nz
	[210.54.92.188])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j27KVCMW007201
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2005 15:31:13 -0500
Message-ID: <422CBA04.3000002@vilain.net>
Date: Tue, 08 Mar 2005 09:31:00 +1300
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] hardware raid5 and lvm "recipe"
References: <FBBA14180DBE83499AC81277324251B0113181@jaxmsx01.nemours.org>
In-Reply-To: <FBBA14180DBE83499AC81277324251B0113181@jaxmsx01.nemours.org>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Amir Mistric wrote:
> We are contemplating to start using RHEL v4 in our enterprise.
> Most of our servers have a hardware RAID.
> The server we are using for a RHEL 4 trial install has 4x36GB SCSI 
> drives configured using RAID 5.
> Of course, we also want to use LVM.
> Can someone please suggest what would be the best �layout�/�recipe� 
> considering the configuration I described?
> Using �automatically� partitioning during install RHEL suggests:
> /boot and swap outside LVM and the rest of space in LVM mounted under / 
> file system.
> Is this sufficient layout for maximum flexibility? Should I create other 
> logical volumes and file systems?

Seems like a good enough policy.  An alternative is to have a larger
root, so that you can do LVM diagnostics without using a boot CD.  But
using a standard vendor configuration means that you're going to surprise
fewer admins that come along.

> Any tips are appreciated

Here's a tip... simulate a failure and make sure that you can detect it.
If you've got pluggable disks, then quiesce the system and unplug one.
Never unplug an active disk, of course.
-- 
Sam Vilain, sam /\T vilain |><>T net, PGP key ID: 0x05B52F13
(include my PGP key ID in personal replies to avoid spam filtering)
