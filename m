Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC6D5DA27
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 00:00:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E2C030B844F
	for <linux-lvm@redhat.com>; Wed, 27 Feb 2019 00:00:33 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t18so15926894wrx.2
	for <linux-lvm@redhat.com>; Tue, 26 Feb 2019 16:00:33 -0800 (PST)
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
From: Cesare Leonardi <celeonar@gmail.com>
Message-ID: <2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
Date: Wed, 27 Feb 2019 01:00:29 +0100
MIME-Version: 1.0
In-Reply-To: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
Content-Language: it-IT
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ingo Franzki <ifranzki@linux.ibm.com>

On 25/02/19 16:33, Ingo Franzki wrote:
> we just encountered an error when using LVM's pvmove command to move the data from an un-encrypted LVM physical volume onto an encrypted volume.
> After the pvmove has completed, the file system on the logical volume that resides on the moved physical volumes is corrupted and all data on this LV is lost.

Hello, your message is interesting. And also this thread:
https://www.redhat.com/archives/linux-lvm/2019-February/msg00002.html

But I'd like to know if I understood correctly.
Should I care about the physical disk size when I use LVM? Mixing disk 
with different sector size (512b and 4k) is dangerous?

Your message and others from the other thread, seems to say that LVM 
doesn't handle correctly that situation and that if I pvmove data 
between a 512b disk and a 4k disk (or viceversa), it will lead to a 
massive filesystem corruption. If I understood correctly, the problem 
that you described looks unrelated to encrypted volume and was only 
exacerbated by that. Right?

Cesare.
