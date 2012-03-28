Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2SIQDaJ025446
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2012 14:26:13 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2SIQCMa024729
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2012 14:26:13 -0400
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q2SIPHkM007555
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2012 14:25:18 -0400
Message-ID: <4F7357C3.4060205@bmsi.com>
Date: Wed, 28 Mar 2012 14:26:11 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <4F6ECF9B.40907@nuclearwinter.com>
	<20120326155540.19c85fe9@bettercgi.com>
	<4F7100EC.6070406@nuclearwinter.com> <4F71CFFF.6090909@redhat.com>
	<4F722FFF.4010703@nuclearwinter.com> <4F72C38E.2080806@redhat.com>
In-Reply-To: <4F72C38E.2080806@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM commands extremely slow during raid check/resync
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

Long ago, Nostradamus foresaw that on 03/28/2012 03:53 AM, Zdenek 
Kabelac would write:
> It seems that your cfq scheduler should be tuned better for raid 
> arrays - I assume you allow the system to create very large queues of 
> buffers and your mdraid isn't fast enough to store dirty pages on disk 
> - I'd probably suggest to significantly lower the maximum amount of 
> dirty pages - as creation of snapshot requires fs sync operation it 
> will need to wait till all buffers before the operation are in place.
A question (or minor nit): how could lvm possibly require a fs sync to 
create a snapshot?  I could see this for Xen, where guest OS has to 
support a com channel to host.  But for full virtualization, LVM doesn't 
know in general what OS is running, or how to suggest an FS sync.  Or is 
this something an admin does, run a script that tells guest to sync 
before creating shapshot through lvm (to maximize the amount of useful 
data in the snapshot)?
