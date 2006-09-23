Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8N8uP4l015221
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 04:56:25 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8N8uInm030479
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 04:56:19 -0400
Date: Sat, 23 Sep 2006 10:56:17 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM partition and lvm commands in initrd
Message-ID: <20060923085617.GA32294@percy.comedia.it>
References: <dac45060609230102k2d3e6c7fq512f27d265e24b8@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dac45060609230102k2d3e6c7fq512f27d265e24b8@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Sep 23, 2006 at 11:02:02AM +0300, Mark Ryden wrote:
>The point which I want to understand is this:
>Is existence of LVM partition is a MUST so that this script
>will run and not cause panic on boot ?
>Suppose I would NOT have an LVM partition.
>(change its type with fdisk for example).
Please try to explain exactly what you are trying to do.

LVM is much more than a partition type, actually changing the partition
type with fdisk will not affect lvm at all.

>Will the calls to "lvm vgscan" and
>  "lvm vgchange" and "mkdmnod" and insmoding the dm* modules will not
>cause panic ?

lvm commands won't cause panics, only being unable to mount your root
file system will.

if you want to get completely rid of lvm you will need to backup and
reinstall your system without lvm.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
