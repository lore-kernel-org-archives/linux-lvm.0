Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9D13fr29828
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 21:03:41 -0400
Received: from mail.travailsystems.net (ns1.travailsystems.net
	[206.123.72.135])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9D13Zq5016719
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 21:03:35 -0400
Message-ID: <416C7EE3.9070401@atrixnet.com>
Date: Tue, 12 Oct 2004 20:03:31 -0500
From: Tommy Butler <tommy@atrixnet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Logical volume recover dilemma
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

OOOPS!  That's what I said the other day when I realized what I had just 
done.  I was getting ready to install linux on a hard drive that had 
previously been used as one disk in a two disk logical volume on a 
Fedora core 2 server.

I logged in and deleted everything from the filesystem on the volume 
(ext3) that I didn't need to save.  There was a lot of data that DID 
need to be kept however.  I started at / and started deleting away.  rm 
-rf /bin /etc /var /home ........etc

What I didn't realize was that LVM obviously makes use of some important 
files on it's resident filesystem in order to keep track of itself.  In 
all my deleting I must have deleted these files, because now I can't get 
any kind of rescue disk or partitioning software like partition magic to 
find the volume again.

How can I get that precious data back?  How can I mount that volume?

-- 
Tommy Butler
