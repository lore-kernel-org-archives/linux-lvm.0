Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41Kip56027385
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:44:51 -0400
Received: from smtp02.atlngahp.sys.nuvox.net (smtp-out2.atlngahp.sys.nuvox.net
	[70.43.63.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41KidDN006279
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:44:40 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp02.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m41KibbX015965
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:44:37 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 3006037B3EB
	for <linux-lvm@redhat.com>; Thu,  1 May 2008 16:44:37 -0400 (EDT)
Message-ID: <481A2BB4.7080504@Media-Brokers.com>
Date: Thu, 01 May 2008 16:44:36 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
References: <4818F2FC.5050907@verizon.net>	<20080501154800.GA5941@us.ibm.com>	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>	<481A08A7.5010305@verizon.net>	<481A0E28.5030108@Media-Brokers.com>	<481A1C09.7070508@verizon.net>	<481A1D32.6020705@Media-Brokers.com>	<481A1FAF.5050303@verizon.net>	<481A221D.80209@Media-Brokers.com>	<481A262C.7080908@verizon.net>	<20080501202534.GU18935@agk.fab.redhat.com>	<481A286E.80309@verizon.net>
	<481A2947.9070907@Media-Brokers.com> <481A29DD.6040108@verizon.net>
In-Reply-To: <481A29DD.6040108@verizon.net>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 5/1/2008 4:36 PM, Gerry Reno wrote:
>  Without knowing the exact cause of the hang there is no way to know if 
> the ramdisk was at issue.  I doubt it myself, I ran a whole series of 
> backups last night using the ramdisk snapshot and everything went fine.

Actually, I'm not talking about the hang as much as I am the problem you 
had recovering from it...

My questions is, had the snapshot volume been on a regular hard drive, 
would you have had the same problems recovering from the situation.

-- 

Best regards,

Charles
