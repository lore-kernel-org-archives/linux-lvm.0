Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3OFCL1R022316
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 11:12:22 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.239])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3OFCHvR001264
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 11:12:17 -0400
Received: by wx-out-0506.google.com with SMTP id s11so2243145wxc
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 08:12:16 -0700 (PDT)
Message-ID: <f64d94760704240812i65b8399aw9a348ed8daf7caf1@mail.gmail.com>
Date: Tue, 24 Apr 2007 11:12:16 -0400
From: "Gordon McLellan" <gordonthree@gmail.com>
Subject: Re: [linux-lvm] lvm over iscsi
In-Reply-To: <20070424143336.9lp8booi04c04oss@webmail.aic.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20070424143336.9lp8booi04c04oss@webmail.aic.fr>
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

Hello,

I'm guessing, from my own experiences with lvm, you'll have to either
export the bottom (the PV), or the top (the LV).   Trying to export
the middle puts it out of context.  A logical volume can't be detected
unless its physical volume is detected first (by the kernel?).

I wonder what pvcreate thinks of iscsi volumes.  could you create a pv
on an iscsi volume which is just an exported lv off another server?

Gordon


On 4/24/07, jmfaidy@aic.fr <jmfaidy@aic.fr> wrote:
> Hi,
> I asked this question in icsci mailing list, with no answer, so I try here.
> I'm using fc6 2.6.20 as target and 2.18fc6-xen as initiator, my goal
> is to export a volume group from the target, in order to be abale to
> make a lvscan on the initiator, but i don't succeed.
>
>   iscsiadm --mode node --targetname iqn.2007-05.fr.aic:jimiscsi
> --portal 10.0.22.133:3260 --login
>
> -> end with no error, but i have nothing in /proc/scsi/scsi and no
> volume are detected by lvscan.
>
> is it possible to export volume group instead of logical ?
>
> Thx for any answer or clue...
>
> JiM
>
> ----------------------------------------------------------------
> This message was sent using IMP, the Internet Messaging Program.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
