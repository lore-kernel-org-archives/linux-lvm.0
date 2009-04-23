Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3N3l2qC028421
	for <linux-lvm@redhat.com>; Wed, 22 Apr 2009 23:47:02 -0400
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3N3kmOp011379
	for <linux-lvm@redhat.com>; Wed, 22 Apr 2009 23:46:49 -0400
Received: by yx-out-2324.google.com with SMTP id 8so211980yxg.81
	for <linux-lvm@redhat.com>; Wed, 22 Apr 2009 20:46:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49EDEA93.1090406@sivell.com>
References: <49EDEA93.1090406@sivell.com>
Date: Thu, 23 Apr 2009 11:46:48 +0800
Message-ID: <4e3a31b90904222046h5419f7ceo95988fd68e749fa0@mail.gmail.com>
Subject: Re: [linux-lvm] re-activate lv after reboot ?
From: Edward Choi <edward@os.sg>
Content-Transfer-Encoding: 7bit
Reply-To: e@os.sg,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Tue, Apr 21, 2009 at 11:47 PM, vu pham <vu@sivell.com> wrote:
> My server uses iscsiadm to access a remote iscsi device. VG and LV are
> created on that device and can be accessed just fine.
> The problem is after reboot, the LVs are in inactive mode and I have to run
> vgchange -a y to activate the VG on the iscsi device or to put that command
> /etc/rcd./rc.local.
>
> Is there any way to automatically to activate those LVs/VGs when the iscsi
> device starts ?
>

First make sure node.startup is set to automatic in /etc/iscsi/iscsi.conf. Then
you can edit /etc/fstab and mount your lv using _netdev.

--
Regards,
Edward Choi.
