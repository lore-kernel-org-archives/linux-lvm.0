Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3LG0cHT025664
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2009 12:00:38 -0400
Received: from mail.brunson.com (www.brunson.com [72.249.20.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3LFwsBJ013143
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2009 11:59:52 -0400
Received: from [172.20.11.71] (unknown [12.109.229.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.brunson.com (Postfix) with ESMTP id 0632C6C37B
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2009 09:58:52 -0600 (MDT)
Message-ID: <49EDED3C.4060608@brunson.com>
Date: Tue, 21 Apr 2009 09:58:52 -0600
From: Eric Brunson <brunson@brunson.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] re-activate lv after reboot ?
References: <49EDEA93.1090406@sivell.com>
In-Reply-To: <49EDEA93.1090406@sivell.com>
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

On 04/21/2009 09:47 AM, vu pham wrote:
> My server uses iscsiadm to access a remote iscsi device. VG and LV are 
> created on that device and can be accessed just fine.
> The problem is after reboot, the LVs are in inactive mode and I have 
> to run vgchange -a y to activate the VG on the iscsi device or to put 
> that command /etc/rcd./rc.local.

In RH and Fedora you need to updated your initrd image to have the 
drivers for the disk access available before the real filesystems are 
mounted.  You don't mention what distro you're using, so I'll avoid 
boring you with details that may not be pertinent to your situation.

>
> Is there any way to automatically to activate those LVs/VGs when the 
> iscsi device starts ?
>
> Thanks,
> Vu
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
