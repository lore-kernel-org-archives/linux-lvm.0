Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF3495D717
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 08:00:43 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5083309264E
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 08:00:42 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x217sf6d089545
	for <linux-lvm@redhat.com>; Fri, 1 Mar 2019 03:00:42 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2qxwex03kx-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 01 Mar 2019 03:00:41 -0500
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Fri, 1 Mar 2019 08:00:38 -0000
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<5c789f6a.1c69fb81.bdd85.c1bb@mx.google.com>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Fri, 1 Mar 2019 09:00:36 +0100
MIME-Version: 1.0
In-Reply-To: <5c789f6a.1c69fb81.bdd85.c1bb@mx.google.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <7d5474d4-a7f5-0321-1acb-fe1a5f1dbd19@linux.ibm.com>
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a
 PVwith a larger physical block size
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
Content-Type: text/plain; charset="utf-8"
To: Bernd Eckenfels <ecki@zusammenkunft.net>, LVM general discussion and development <linux-lvm@redhat.com>

On 01.03.2019 03:56, Bernd Eckenfels wrote:
> Hello,
> 
> I think the filesystems address in Logical blocks, so this is the size which should match.
> 
> However the physical size might be relevant for alignment/sizing decisions of mkfs  (but you would expect the to be encoded in the metadata of the filesystem so you can transport them (losing proper alignment which might affect Performance or robustness).
> 
> For ext3/4 I think the mkfs will use -b 4k by Default if your FS is at least 0,5GB.
That may make a difference. My tests were with relatively small volumes, so it might not be using -b 4k due to the size of the volume?
> 
> BTW: some applications (like SQL Server) also care about the physical size to make sure they always write complete sectors in transactions and avoid read-modify-write scenarios.
>  
> Gruss
> Bernd
> 


-- 
Ingo Franzki
eMail: ifranzki@linux.ibm.com  
Tel: ++49 (0)7031-16-4648
Fax: ++49 (0)7031-16-3456
Linux on IBM Z Development, Schoenaicher Str. 220, 71032 Boeblingen, Germany

IBM Deutschland Research & Development GmbH / Vorsitzender des Aufsichtsrats: Matthias Hartmann
Geschäftsführung: Dirk Wittkopp
Sitz der Gesellschaft: Böblingen / Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM DATA Privacy Statement: https://www.ibm.com/privacy/us/en/
