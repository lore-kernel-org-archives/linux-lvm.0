Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i241lC802459
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 20:47:12 -0500
Received: from mail.goldenhope.com.cn ([220.249.10.10])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i241lAb07790
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 20:47:11 -0500
Received: from lepton.goldenhope.com.cn (lepton.goldenhope.com.cn [192.168.1.138])
	by mail.goldenhope.com.cn (Postfix) with ESMTP id E66BBDCAB
	for <linux-lvm@redhat.com>; Thu,  4 Mar 2004 09:46:54 +0800 (HKT)
From: lepton <lepton@mail.goldenhope.com.cn>
Subject: Re: [linux-lvm] Why can't I extend a LV after many times extends?
Message-ID: <20040304014657.GA19419@lepton.goldenhope.com.cn>
References: <20040303174600.18834.10882.Mailman@listman.back-rdu.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040303174600.18834.10882.Mailman@listman.back-rdu.redhat.com>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar  3 20:45:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Thanks for your help.

I have seen someone mentioned there is some limits when using strip.

like this:
http://linux.msede.com/lvm_mlist/archive/2002/11/0235.htm

It saids: 
"Once you create a striped lv, you cannot extend it by adding
more disks. Current lvm version anyway."

Is there any limits in current lvm2 code about strip ?


> From: Alasdair G Kergon <agk@redhat.com>
> To: linux-lvm@redhat.com
> Subject: Re: [linux-lvm] Why can't I extend a LV after many times extends?
> Reply-To: linux-lvm@redhat.com
> 
> On Tue, Mar 02, 2004 at 11:34:51PM +0800, lepton wrote:
> > For making my data can balance on all of my three scsi disk, I use such
> > methods to create my LV:
> >   lvcreate -l 32 -n test vg /dev/sda1
> >   lvextend -l +32 /dev/vg/test /dev/sdb1
> >   lvextend -l +32 /dev/vg/test /dev/sdc1
> >   lvextend -l +32 /dev/vg/test /dev/sda1
> >   ......
>  
> Why not use LVM striping directly?
> (lvcreate -i 3)
> 
> Alasdair
> -- 
> agk@redhat.com
> 
> 
> --__--__--
