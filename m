Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5R3Pbu32744
	for <linux-lvm@redhat.com>; Sun, 26 Jun 2005 23:25:37 -0400
Received: from host1.appws.com (host1.appws.com [216.136.72.3])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5R3PRd1009857
	for <linux-lvm@redhat.com>; Sun, 26 Jun 2005 23:25:31 -0400
Received: from grandmother.littlebald.com (localhost.localdomain [127.0.0.1])
	by grandmother.littlebald.com (8.12.8/8.12.8) with ESMTP id
	j5R3PFmR018539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 26 Jun 2005 23:25:15 -0400
Received: (from david@localhost)
	by grandmother.littlebald.com (8.12.8/8.12.8/Submit) id j5R3PFeO018537
	for linux-lvm@redhat.com; Sun, 26 Jun 2005 23:25:15 -0400
Subject: Re: [linux-lvm] nbd messages
From: David Johnston <david@littlebald.com>
In-Reply-To: <20050625225609.GA13510@adren.mine.nu>
References: <20050625225609.GA13510@adren.mine.nu>
Content-Transfer-Encoding: 7bit
Message-Id: <1119842714.17343.28.camel@grandmother.littlebald.com>
Mime-Version: 1.0
Date: Sun, 26 Jun 2005 23:25:14 -0400
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

On Sat, 2005-06-25 at 18:56, Cyril Chaboisseau wrote:
> Hi,
> 
> since a couple of months I've got the following messages at boot :
> 
> nbd0: Request when not-ready
> end_request: I/O error, dev nbd0, sector 0
> Buffer I/O error on device nbd0, logical block 0
> Buffer I/O error on device nbd0, logical block 1
> Buffer I/O error on device nbd0, logical block 2

*snip*

nbd is the Network Block Device, a kernel module that allows you to
access a block device on a remote host as if it were a local block
device.

Are you using LVM over nbd?  If not, I would probably try to tell LVM to
ignore the nbd* devices (if I recall correctly, add "r/nbd*/" to the
beginning of the filter line in /etc/lvm/lvm.conf).

> 
> but appart from that, everything's fine !
> 
> 
> 
> is there any reason to worry ?
> 
> how can I stop such messages ?
-- 
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
