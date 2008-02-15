Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1FGINDE001379
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 11:18:23 -0500
Received: from ulx.hu (ulx.tvnet.hu [195.38.96.124])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1FGHwNZ020118
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 11:17:59 -0500
Received: from lucy.ulx.hu (lucy [172.16.0.2])
	by ulx.hu (Postfix) with ESMTP id 080CA140341
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 17:17:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lucy.ulx.hu (Postfix) with ESMTP id 92A606405D
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 17:17:52 +0100 (CET)
Received: from lucy.ulx.hu ([127.0.0.1])
	by localhost (lucy.ulx.hu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3qTmPEkrQOd for <linux-lvm@redhat.com>;
	Fri, 15 Feb 2008 17:17:46 +0100 (CET)
Received: from [172.16.1.240] (unknown [172.16.1.240])
	by lucy.ulx.hu (Postfix) with ESMTP id E04D16405C
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 17:17:46 +0100 (CET)
Message-Id: <F66CC8D7-624C-4090-B0D8-1A0406B384A4@ulx.hu>
From: =?ISO-8859-1?Q?Lajk=F3_Attila?= <Lajko.Attila@ulx.hu>
In-Reply-To: <2D7245F3-4FBF-4569-BBA9-22E37E22C58A@redhat.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] mirrored LV + cmirror problem
Date: Fri, 15 Feb 2008 17:17:46 +0100
References: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
	<2D7245F3-4FBF-4569-BBA9-22E37E22C58A@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>



On Feb 15, 2008, at 4:41 PM, Jonathan Brassow wrote:

> Are all the packages rhel4.6 as well, or have you compiled pkgs  
> yourself?

All the packages are binaries from rhel4.6:
lvm2-cluster-2.02.27-2.el4_6.1
cmirror-1.0.1-1
cmirror-kernel-xenU-2.6.9-38.5

>
>
> What was the load you had on the system?

Very low, approx. 0.

> The messages I see from dm-cmirror suggest that it is properly  
> shutting down in the face of the failure... However, before it has  
> finished, we can see "Failed to remove faulty devices in vgtest- 
> lvtest".  This suggests to me that clvmd is not waiting long enough  
> for the shutdown to complete, but I only see 3 seconds of the log.   
> When was the device failure initiated?
>
> brassow
>
>

The failure was initiated at the beginning of the log. I put the  
complete messages files from both nodes (el42 and el4) to FTP.

ftp://ftp.ulx.hu/upload/clvmd/messages.el4
ftp://ftp.ulx.hu/upload/clvmd/messages.el42

Attila
