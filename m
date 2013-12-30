Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBU5ImOS003142
	for <linux-lvm@redhat.com>; Mon, 30 Dec 2013 00:18:48 -0500
Received: from mps1.wohnheimg.uni-frankfurt.de
	(mps1.wohnheimg.uni-frankfurt.de [141.2.118.239])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBU5Ik4u021168
	for <linux-lvm@redhat.com>; Mon, 30 Dec 2013 00:18:46 -0500
Received: from localhost ([127.0.0.1] helo=ssl.verfeiert.org)
	by mps1.wohnheimg.uni-frankfurt.de via ESMTP (Exim)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1VxVFU-0001gp-Hh
	for linux-lvm@redhat.com; Mon, 30 Dec 2013 06:18:44 +0100
Message-ID: <5aa8e0e059167befb821be0aa72f110f.squirrel@ssl.verfeiert.org>
In-Reply-To: <52C0E864.7060905@gmail.com>
References: <52C0C51C.7060806@gmail.com>
	<20131230020026.GB16777@agk-dp.fab.redhat.com>
	<52C0E864.7060905@gmail.com>
Date: Mon, 30 Dec 2013 06:18:44 +0100
From: "Sven Eschenberg" <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvremove is not deleting the file system
Reply-To: sven@whgl.uni-frankfurt.de,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I guess my question was somewhat misleading:

I was not sure, if you had some data to keep, or if you'd planned to trash
everything. Usually the warning about an existing FS is not a coincidence,
so better make sure, people really intend to wipe it ;-).

-Sven


On Mon, December 30, 2013 04:28, Guy Rouillier wrote:
> On 12/29/2013 9:00 PM, Alasdair G Kergon wrote:
>>
>> If you're running lvremove yourself before retrying, look into running
>> wipefs manually on the device first.
>
> Thank you, that solved the problem.  I was then able to run
> xen-create-image again and it recreated the LVs.  To answer Sven's
> question: "What is your actual intention?", I'm trying to rerun
> xen-create-image so that I can create this xen virtual machine. I could
> not do that because it failed trying to recreate the root LV.
>
> --
> Guy Rouillier
>
> ---
> This email is free from viruses and malware because avast! Antivirus
> protection is active.
> http://www.avast.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
