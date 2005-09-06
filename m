Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j86G0kV11230
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 12:00:46 -0400
Received: from mtagate2.de.ibm.com (mtagate2.de.ibm.com [195.212.29.151])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j86G0gEI009153
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 12:00:42 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate2.de.ibm.com (8.12.10/8.12.10) with ESMTP id j86G0Vd7030914
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 16:00:31 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP
	id j86G0VWA181798
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 18:00:31 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11/8.13.3) with ESMTP id
	j86G0V9x001702
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 18:00:31 +0200
Received: from d12ml402.megacenter.de.ibm.com (d12ml402.megacenter.de.ibm.com
	[9.149.166.155])
	by d12av04.megacenter.de.ibm.com (8.12.11/8.12.11) with ESMTP id
	j86G0V4c001698
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 18:00:31 +0200
Message-ID: <431DA10F.8020804@ngi.it>
Date: Tue, 06 Sep 2005 16:00:47 +0200
From: Bob Alexander <bob@ngi.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Please help with lvextend problems
References: <431C5034.6040604@ngi.it>	<20050905201509.GA15141@agk.surrey.redhat.com>
	<431C54A0.7090004@ngi.it>
In-Reply-To: <431C54A0.7090004@ngi.it>
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

Bob Alexander wrote:
> bob@t40:~$ sudo lvm version
>   LVM version:     2.01.12 (2005-06-14)
>   Library version: 1.01.03 (2005-06-13)
>   Driver version:  4.4.0

FWIW after backing up data I tried to be brave :-)

Booted off a 2005.1 Gentoo LiveCD and used the lvm of this distro 
(version 2.91.05 2005-04-04) to resize the LV and it worked just fine.

I therefore still believe version 2.01.12 (at least, cannot say for the 
more recent ones) has a buglet.

Thank you
Bob
