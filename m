Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m38BFIRa004265
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:15:18 -0400
Received: from yw-out-2324.google.com (yw-out-2324.google.com [74.125.46.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m38BF3DN005780
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:15:03 -0400
Received: by yw-out-2324.google.com with SMTP id 3so285300ywj.81
	for <linux-lvm@redhat.com>; Tue, 08 Apr 2008 04:14:59 -0700 (PDT)
Message-ID: <69649d440804080414qba1bb21waa98de61c11876f8@mail.gmail.com>
Date: Tue, 8 Apr 2008 12:14:58 +0100
From: "Jess Bromley" <j.bromley@bristol.ac.uk>
Sender: jess.bromley@googlemail.com
Subject: Re: [linux-lvm] LVM mirroring questions...
In-Reply-To: <E1JjBZs-00017j-E9@odzwierny0.comarch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <69649d440804080214v706eedf3m50e443182a1827ae@mail.gmail.com>
	<E1JjBZs-00017j-E9@odzwierny0.comarch.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks Karl and Marcin, I hadn't realised software RAID worked on a
per partition basis.  I'm looking into it now.

If mirroring on LVM is stable though, it might still be preferrable as
then I only have to use one set of tools instead of two --- can anyone
comment on how stable they've found mirroring under LVM.

Also does the fact that software RAID doesn't use a disk log mean that
LVM is actually better/faster than RAID at correctly recovering from
crashes that leave the mirrored disks out of sync?

>  The amount of log data is small - on my test setup for creating 1GB mirrored
>  LV log fit into single 16MB PE - don't know how much of it was left freee
>  though.

Were you able to specify which PV the log was created on?

Thanks,
Jess
