Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBU3SuP0024774
	for <linux-lvm@redhat.com>; Sun, 29 Dec 2013 22:28:56 -0500
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBU3StxK015100
	for <linux-lvm@redhat.com>; Sun, 29 Dec 2013 22:28:55 -0500
Received: by mail-qa0-f52.google.com with SMTP id cm18so10344880qab.18
	for <linux-lvm@redhat.com>; Sun, 29 Dec 2013 19:28:55 -0800 (PST)
Received: from [127.0.0.1] (pool-71-126-174-26.washdc.fios.verizon.net.
	[71.126.174.26])
	by mx.google.com with ESMTPSA id lc1sm67267751qeb.5.2013.12.29.19.28.54
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 29 Dec 2013 19:28:54 -0800 (PST)
Message-ID: <52C0E864.7060905@gmail.com>
Date: Sun, 29 Dec 2013 22:28:36 -0500
From: Guy Rouillier <guy.rouillier@gmail.com>
MIME-Version: 1.0
References: <52C0C51C.7060806@gmail.com>
	<20131230020026.GB16777@agk-dp.fab.redhat.com>
In-Reply-To: <20131230020026.GB16777@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvremove is not deleting the file system
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 12/29/2013 9:00 PM, Alasdair G Kergon wrote:
> On Sun, Dec 29, 2013 at 07:58:04PM -0500, Guy Rouillier wrote:
>> /dev/dell-vg/oraclelinux-root appears to contain an existing filesystem
>> (btrfs).
>> Error: Use the -f option to force overwrite.
>
> Does your version of xen-create-image offer a way to supply that -f?

I tried supplying the -f option to xen-create-image.  Unfortunately, it 
did not alter the outcome.

>
> If you're running lvremove yourself before retrying, look into running
> wipefs manually on the device first.

Thank you, that solved the problem.  I was then able to run 
xen-create-image again and it recreated the LVs.  To answer Sven's 
question: "What is your actual intention?", I'm trying to rerun 
xen-create-image so that I can create this xen virtual machine. I could 
not do that because it failed trying to recreate the root LV.

-- 
Guy Rouillier

---
This email is free from viruses and malware because avast! Antivirus protection is active.
http://www.avast.com
