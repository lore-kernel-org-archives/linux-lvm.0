Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5TFLe027258
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2004 11:21:40 -0400
Received: from office.bgservice.net (office.bgservice.net [217.30.208.179])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i5TFLbe1032375
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2004 11:21:38 -0400
Message-ID: <40E188FA.6020508@bofh.bg>
Date: Tue, 29 Jun 2004 18:21:30 +0300
From: Dimitar Katerinski <train@bofh.bg>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem creating lvm2 snapshot volume
References: <40E185C7.8060606@parc.com>
In-Reply-To: <40E185C7.8060606@parc.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

John Uhlig wrote:
> Hi.
> 
> We are trying to install lvm2 volumes on our fedora core 2 (kernel 
> 2.6.6-1.435smp)
> Dell 2650 poweredge fileservers. Following the instructions at:
>    http://tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html
> ...do not work and the following error occurs:

Hello,

You are using lvm2, and you should read in that howto, that lvm2 does not
support snapshots yet. Sorry about that.


Regards,
Dimitar

-- 
"The only thing necessary for the triumph of evil is for good men to do nothing."
                                                   --Edmund Burke.
