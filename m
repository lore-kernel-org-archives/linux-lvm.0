Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2U6qdO02470
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 01:52:39 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2U6qcvF017267
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2005 01:52:38 -0500
Date: Wed, 30 Mar 2005 08:52:36 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: Welcome to the "linux-lvm" mailing list
Message-ID: <20050330065236.GA18365@percy.comedia.it>
References: <mailman.11694.1112144246.19557.linux-lvm@redhat.com>
	<c23be1c305032917022b076064@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c23be1c305032917022b076064@mail.gmail.com>
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

On Wed, Mar 30, 2005 at 09:02:28AM +0800, Andy Sy wrote:
>Just like the kernel is now able to autodetect and
>autoenable md RAID arrays, are there plans to make
kernel autodetection of md arrays is almost always a bad idea,
it is far better to use mdadm in user space for that.

>lvm do the same?  (i.e integrate the functionality
>of vgscan / vgchange -ay,-an into the kernel)
no, it is an user space task, there is no reason to
burden the kernel with this.

a different thing my be said for kernel level manual configuration
(the md=....) commandline, but i dont' feel the need to implement
a device mapper kernel commandline to achieve this.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
