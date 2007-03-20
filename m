Received: from [10.34.32.13] (mazyland.brq.redhat.com [10.34.32.13])
	by pobox.stuttgart.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l2K9d0Lv016087
	for <linux-lvm@redhat.com>; Tue, 20 Mar 2007 10:39:00 +0100
Message-ID: <45FFABB4.5010806@redhat.com>
Date: Tue, 20 Mar 2007 10:39:00 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] device(disk) sleep on lvcreate
References: <da32294e0703200017u4b443169g6402a29a3979cf54@mail.gmail.com>
	<da32294e0703200129i2f26bd98w800a034f87f15a36@mail.gmail.com>
In-Reply-To: <da32294e0703200129i2f26bd98w800a034f87f15a36@mail.gmail.com>
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

francism wrote:
> Hi All,
> 
> Im new to this mail list, does anyone experience an lvcreate lockup
> with -s(snapshot).I had check the process and it seems the disk goes
> to sleep, and cause
> lvcreate to lockup.

Hi,
please check syslog messages and  run lvm command with debug messages
enabled - add -vvvv paramaters (lvcreate -vvvv -s ...) to find out
where is the problem.

If "disk goes to sleep" means disk powerdown then it is a hardware issue.

Milan
--
mbroz@redhat.com
