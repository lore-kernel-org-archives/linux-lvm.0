Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1OJPWua008167
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:25:32 -0500
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1OJPLmj003177
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 14:25:21 -0500
Received: from ns4.futuresource.com ([208.10.26.50])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id p1OJOThD002309
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 13:24:30 -0600
Received: from [172.22.181.98] ([172.22.181.98])
	by ns4.futuresource.com (8.13.8/8.13.8) with ESMTP id p1OJPHNj009494
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 13:25:18 -0600
Message-ID: <4D66B09C.5000705@gmail.com>
Date: Thu, 24 Feb 2011 13:25:16 -0600
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<4D651735.1000802@abpni.co.uk>	<20110223101259.77143753@bettercgi.com>	<4D653BEF.5010600@abpni.co.uk>	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>	<4D654FBD.8030504@abpni.co.uk>	<4D655459.6050806@gmail.com>	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>	<4D656817.6060900@gmail.com>	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D668A57.3000306@abpni.co.uk>
	<4D66AE68.6030406@rjl.com>
In-Reply-To: <4D66AE68.6030406@rjl.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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

On 2/24/2011 1:15 PM, Nataraj wrote:
>
> One other thing that wasn't mentioned here.... As far as I understand,
> if these are lvms on the host and the snapshots are being taken on the
> host, there is no guaranteed integrity of the filesystems unless you
> shutdown the guest while the snapshot is taken.
>
> It's too bad they don't implement a system call that could do something
> like sync filesystem and sleep until I tell you to continue.  This would
> be perfect for snapshot backups of virtual hosts.

Syncing a filesystem's OS buffers isn't really enough to ensure that 
running apps have saved their data in a consistent state.  The best you 
are going to get without shuting things down is more or less what you'd 
have if the server crashed at some point in time.

-- 
   Les Mikesell
    lesmikesell@gmail.com
