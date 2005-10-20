Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9KLb2V16099
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 17:37:02 -0400
Received: from sccimhc92.asp.att.net (sccimhc92.asp.att.net [63.240.76.166])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9KLaqHp014182
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 17:36:56 -0400
Received: from randy.randyperkins.com ([192.168.0.200])
	by localhost.localdomain with esmtp (Exim 4.52) id 1ESi5Y-000540-SV
	for linux-lvm@redhat.com; Thu, 20 Oct 2005 16:36:40 -0500
Subject: Re: [linux-lvm] Reducing ext3 LV
From: Randy Perkins <randyperkins@randyperkins.com>
In-Reply-To: <43572E5D.1010803@snow.email.ne.jp>
References: <43572E5D.1010803@snow.email.ne.jp>
Date: Thu, 20 Oct 2005 16:36:46 -0500
Message-Id: <1129844206.25448.4.camel@localhost.localdomain>
Mime-Version: 1.0
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

On Thu, 2005-10-20 at 14:42 +0900, Mark Sargent wrote:
> Hi All,
> 
> new here. I'm using ext3 LVM and want to resize a 75GB LV to 20GB. How 
> is this done.? Current data = 5GB. Cheers.
> 
> Mark Sargent.

i asked a similar question a couple weeks ago but got no response.
this is how i did it

umount /dev/path/to/lv
e2fsadm -L 20G /dev/path/to/lv

additionally i wanted to remove a disk from the LV so:

pvmove /dev/hdx
vgreduce /dev/hdx

i am by no means an lvm expert.  i joined the list to get help with my
situation, and have been hanging out. maybe this will get you pointed in
the right direction.

good luck

randy
