Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k27FMf124559
	for <linux-lvm@redhat.com>; Tue, 7 Mar 2006 10:22:41 -0500
Received: from gulfport.carmen.se (gatekeeper.carmen.se [193.12.210.250])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k27FMdX7021960
	for <linux-lvm@redhat.com>; Tue, 7 Mar 2006 10:22:39 -0500
Received: from postville.carmen.se (postville.carmen.se [192.168.100.38])
	by gulfport.carmen.se (Postfix) with ESMTP id C0EB1C01F
	for <linux-lvm@redhat.com>; Tue,  7 Mar 2006 16:22:30 +0100 (CET)
Received: from portmoller.carmen.se (portmoller.carmen.se [192.168.98.14])
	by postville.carmen.se (Postfix) with ESMTP id 8C6E09FB02
	for <linux-lvm@redhat.com>; Tue,  7 Mar 2006 16:22:30 +0100 (CET)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by portmoller.carmen.se (8.12.11/8.12.11) with ESMTP id k27FMU2u017430
	for <linux-lvm@redhat.com>; Tue, 7 Mar 2006 16:22:30 +0100
Message-ID: <440DA536.9030706@carmen.se>
Date: Tue, 07 Mar 2006 16:22:30 +0100
From: Olle Liljenzin <olle@carmen.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cleaning archive directory
References: <4406CDB1.1050000@carmen.se>
	<20060306174353.GD25317@agk.surrey.redhat.com>
In-Reply-To: <20060306174353.GD25317@agk.surrey.redhat.com>
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

Hi,

Thanks for the answer.

Then I think the clean up is broken in RHEL4.

I have filed a bugzilla for it if someone wants to fix it some day.

/Olle

Alasdair G Kergon wrote:
> On Thu, Mar 02, 2006 at 11:49:21AM +0100, Olle Liljenzin wrote:
> 
>>Is the directory /etc/lvm/archive supposed to be cleaned up manually or 
>>should it be done by some tool?
> 
>  
> 
>>I find parameters like 'retain_min' and 'retain_days' in the file 
>>/etc/lvm.conf, which I thought was indicating some kind of automatic 
>>cleaning tool or process. 
> 
> 
> They should normally get cleaned up automatically.
> 
> The parameters apply to each VG separately, and the checks are made
> whenever a new archive file is written for that VG.
> (So backups of old VGs won't be deleted.)
> 
> Default keeps backups for at least 30 days and won't delete any unless 
> that leaves at least 10 backups of that VG.
> 
> Alasdair
