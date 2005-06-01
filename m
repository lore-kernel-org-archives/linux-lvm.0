Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j51506O28010
	for <linux-lvm@redhat.com>; Wed, 1 Jun 2005 01:00:06 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.192])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j51501Gu026057
	for <linux-lvm@redhat.com>; Wed, 1 Jun 2005 01:00:01 -0400
Received: by wproxy.gmail.com with SMTP id 69so3082839wri
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 22:00:01 -0700 (PDT)
Message-ID: <9411d45b05053122007204d7c4@mail.gmail.com>
Date: Wed, 1 Jun 2005 01:00:00 -0400
From: pedro pedrinson <pedrinson@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How do I configure ownership of an LVM volume?
Reply-To: pedro pedrinson <pedrinson@gmail.com>,
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
To: linux-lvm@redhat.com

How do I configure ownership of the device for an LVM volume. Is this
LVM's job or udev's job?

This is on RHEL4 systems.

Please don't tell me I have to stick a bunch of chowns in an init script...
