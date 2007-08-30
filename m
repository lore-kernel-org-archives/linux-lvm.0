Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7UAb2KR023251
	for <linux-lvm@redhat.com>; Thu, 30 Aug 2007 06:37:02 -0400
Received: from anchor-post-31.mail.demon.net (anchor-post-31.mail.demon.net
	[194.217.242.89])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7UAashe009579
	for <linux-lvm@redhat.com>; Thu, 30 Aug 2007 06:36:54 -0400
Received: from g6dzj.demon.co.uk ([80.177.30.245] helo=animal.ether-net)
	by anchor-post-31.mail.demon.net with esmtp (Exim 4.42)
	id 1IQhOJ-000KNm-4k
	for linux-lvm@redhat.com; Thu, 30 Aug 2007 10:36:49 +0000
From: Stephen Kitchener <stephen@g6dzj.demon.co.uk>
Date: Thu, 30 Aug 2007 11:35:56 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708301135.57038.stephen@g6dzj.demon.co.uk>
Subject: [linux-lvm] Moving LVM drive from fedora 5 to fedora 7
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
To: linux-lvm@redhat.com

Hi,

New to the list and I applogise if this has been asked before.

I am moving a system from fedora 5 to 7 and would like to keep and use the 
data on a data drive.

Unfortunately I get some errors when I try to make the new system aware of the 
lvm drive. It's a one drive LVM btw.

These show them selves up with I/O errors when I do a 
vgscan --mknodes
If I do mount the drive the dir list shows up like this

-rw-r--r--  1 root   root   1130244096 2006-12-17 21:54 
1086_20061217212500.mpg
-rw-rw-rw-  1 root   root        37946 2006-12-29 17:16 
1086_20061217212500.mpg.png
-?????????  ? ?      ?               ?                ? 
1086_20070102113000.mpg
-?????????  ? ?      ?               ?                ? 
1086_20070102113000.mpg.png
-rw-r--r--  1 root   root   2118948864 2007-01-02 20:48 
1086_20070102195300.mpg
-rw-rw-rw-  1 root   root        36003 2007-03-12 22:46 
1086_20070102195300.mpg.png
-rw-rw-rw-  1 root   root        33399 2007-01-08 12:30 
1086_20070108103000.mpg.png

(apologies for the wrap-around)

I have checked the drives as far as possible, they both seem to be using LVM2, 
and the drive functions correctly under the older FC5.

So, what's changed between FC5 and F7 ? , what do I need to do, to 
make/convert the drive so that it's fully working under F7 ? 

Thanks

Steve
