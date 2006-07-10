Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6AJtDEb025581
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 15:55:13 -0400
Received: from smtp.vzavenue.net (smtp.vzavenue.net [66.171.59.140])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6AJtB2q025958
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 15:55:12 -0400
Message-ID: <012401c6a45a$c53bcb80$2901a8c0@robbie>
From: "Robbie Coss" <robbie@vzavenue.net>
Date: Mon, 10 Jul 2006 14:55:18 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 maximum logical volume size help
Reply-To: Robbie Coss <robbie@vzavenue.net>,
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-lvm@redhat.com

Hi,

I am currently running RHEL4 update 3  (kernel 2.6.9-34.0.2.EL), and
using LVM2 and the ext3 filesystem.

I need to know what is the maximum logical volume size I can create. From
the LVM2 Howto, the max size is stated to be 8 exebytes. However, the
Red Hat doc says that the max filesystem size for ext3 is 8 TB.

I am guessing that means I am limited to 8 TB if I want to use ext3 ???

If so, then are there other filesystems I can use to overcome this limit. I 
want
to be able to create volumes at least up to 100TB. Is there anything 
included
with the Red Hat release that would be a good choice? Or anything free not
included with Red Hat? Or anything commercial?

Thanks in advance for any help or opinions.
Robbie
