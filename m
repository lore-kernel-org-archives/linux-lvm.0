Received: from [172.16.44.152] (friday.brisbane.redhat.com [172.16.44.152])
	by pobox.brisbane.redhat.com (8.13.1/8.13.1) with ESMTP id
	l4U2twHf011483
	for <linux-lvm@redhat.com>; Wed, 30 May 2007 12:55:58 +1000
Message-ID: <465CE7BE.90106@gmail.com>
Date: Wed, 30 May 2007 12:55:58 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] about rhel5 lvm
References: <465CCE4B.439404.22055@m12-13.163.com>
In-Reply-To: <465CCE4B.439404.22055@m12-13.163.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

iamboy_2000 wrote:
> dear all:
> 
>    when in rhel4,the command ext2online can extend the filesystem,but in rhel5,the ext2online is't exist,then what command can do this?
> 

Slightly OT but, but resize2fs can resize mounted filesystems in RHEL5
(resize2fs and ext2online were merged).

Regards,
Dave
