Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k468Psk4030560
	for <linux-lvm@redhat.com>; Sat, 6 May 2006 04:25:54 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k468PqH8027556
	for <linux-lvm@redhat.com>; Sat, 6 May 2006 04:25:53 -0400
Date: Sat, 6 May 2006 10:25:51 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Two Plorilant servers (Redhat) trying to access a HP
	MSA1000
Message-ID: <20060506082551.GA10926@percy.comedia.it>
References: <1146768607.10908.21.camel@ip6-localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1146768607.10908.21.camel@ip6-localhost>
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

On Thu, May 04, 2006 at 01:50:06PM -0500, Edgar Luna wrote:
>I have two servers with RedHat EL3 connected to an HP MSA1000. What I
>want with this servers write/read the disks from the MSA1000.
>
>I know that LVM is unaware of simultaneous access to one device, so I
>tried to divide the storage of MSA1000 in two units (created via the ACU
>application), that are seen by the RedHat servers as /dev/sda
>and /dev/sdb. Then I created a Physical Volume for each one a Logical
>Group and finally a Logical Volume for each of this.

could you clarify what your problem is?

>I want an advice about this.
>What would you do in my situation?
>This works? I mean with this I can workaround the LVM 'problem' of
>unaware of simultaneous access?

could you clarify what your problem is?

>Is possible to access the Hard Drives in the MSA1000 directly from Linux
>so I can make the LVM directly on disks?
no, you cannot, besides that, why did you buy an intellignet storage if
you only wanted a disk shelf?

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
