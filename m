Received: from [172.16.59.2] (dogpound.rdu.redhat.com [172.16.59.2])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id jA24T95E020647
	for <linux-lvm@redhat.com>; Tue, 1 Nov 2005 23:29:10 -0500
Message-ID: <43683E70.9080400@redhat.com>
Date: Tue, 01 Nov 2005 23:20:00 -0500
From: Josef Whiter <jwhiter@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] aborted pvmove; how to remove locked LV "pvmove0"
References: <43683CA4.4090406@svs.gsfc.nasa.gov>
In-Reply-To: <43683CA4.4090406@svs.gsfc.nasa.gov>
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

Randall A. Jones wrote:

>
> I started a pvmove that was interrupted before it was finished. 
> lvdisplay reports that the pvmove0 LV is still there.  Looking in 
> /etc/lvm/backup/vg0 shows that pvmove0 is locked.  If I try to use 
> lvremove pvmove0, it fails stating that it is locked.
>
> Is there a way to unlock a locked LV?  Or is there a way to tell LVM 
> that the pvmove operation is no longer needed so it will clean up?
>
> Thank you,
> Randall

pvmove --abort should do what you are looking for.

Josef

-- 
Josef Whiter, RHCE
Global Support Services
Red Hat, Inc.
919-754-3700 x44429
