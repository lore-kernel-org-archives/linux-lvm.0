Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2AGUB803487
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 11:30:11 -0500
Received: from waldorf.cs.uni-dortmund.de (waldorf.cs.uni-dortmund.de [129.217.4.42])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2AGU907001674
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 11:30:09 -0500
Received: from postamt.cs.uni-dortmund.de (postamt [129.217.4.40])
        by waldorf.cs.uni-dortmund.de  with ESMTP id i2AGU38n010014
        for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 17:30:03 +0100 (MET)
Received: from brown (brown [129.217.24.134])
	by postamt.cs.uni-dortmund.de (8.12.5/8.12.5) with ESMTP id i2AGU20k022323
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 17:30:03 +0100 (MET)
From: Christoph Pleger <Christoph.Pleger@uni-dortmund.de>
Message-Id: <20040310173002.75ca7590.Christoph.Pleger@uni-dortmund.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2-Snapshot
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
Date: Wed Mar 10 11:28:44 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello,

I have problems when I try to create a snapshot of a logical volume
under LVM2 (Kernel 2.6.3). I get the following messages after using
"lvcreate -s -l 227 -n snap /dev/vg1/lv1":

device_mapper ioctl cmd 9 failed: Invalid argument
Couldn't load device 'vg1-snap'.
Problem reactivating origin lv1


How can I solve that?

Using google, I found that snapshots under LVM2 and Kernel 2.6 generally
do not work. I hope that that is no longer true, is it? 

Christoph
