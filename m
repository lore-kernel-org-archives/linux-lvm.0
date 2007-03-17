Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2H3GB3F027580
	for <linux-lvm@redhat.com>; Fri, 16 Mar 2007 23:16:12 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.235])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2H3GAmu007916
	for <linux-lvm@redhat.com>; Fri, 16 Mar 2007 23:16:11 -0400
Received: by wx-out-0506.google.com with SMTP id s11so721521wxc
	for <linux-lvm@redhat.com>; Fri, 16 Mar 2007 20:16:10 -0700 (PDT)
Message-ID: <be7468bb0703162016k2eb7268fmcb4e7f983f79ad6c@mail.gmail.com>
Date: Sat, 17 Mar 2007 11:16:10 +0800
From: "roderick tapang" <retapang@gmail.com>
Subject: Re: [linux-lvm] Mounting part of a logical volume?
In-Reply-To: <8C9360FAE05563F-EA0-3661@WEBMAIL-RC11.sysops.aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8C9360FAE05563F-EA0-3661@WEBMAIL-RC11.sysops.aol.com>
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

On 3/17/07, p3tr0x@aol.com <p3tr0x@aol.com> wrote:
>
> Hi,
>
>  I have a Fedora Core 6 system with a root volume group (VolGroup00)
> spanning 2 physical drives. Through my own negligence the first drive got
> overwritten when the system was rebooted with a bootable cd in the drive.
> This effectively reformated the primary drive but left the second drive
> intact. What I would like to do is mount the second drive to see if there is
> any data worth retrieving before rebuilding the system.
>
>  I can boot onto a rescue CD so I can access the drive through lvm.
> lvdisplay reports that it cannot find all of the physical volumes which
> makes sense as the other drive was reformatted. pvscan also reports a
> missing drive.
>
>  Can anyone give me a pointer on what might be my next step?

this might help:

http://kbase.redhat.com/faq/FAQ_85_5843.shtm

>  Thanks!
>  Pete

erik
-- 
roderick e. tapang, nclp
retapang at gmail dot com

(o_.'       http://counter.li.org/
//\         ----------------------
V_/_        Linux User   #  253842
