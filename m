Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0DEsE114626
	for <linux-lvm@redhat.com>; Fri, 13 Jan 2006 09:54:14 -0500
Received: from will.fastenal.com (will.fastenal.com [205.243.112.23])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0DEsBKo030672
	for <linux-lvm@redhat.com>; Fri, 13 Jan 2006 09:54:11 -0500
Received: from [172.17.4.44] (unknown [172.17.4.44])
	by will.fastenal.com (Postfix) with ESMTP id D030834021
	for <linux-lvm@redhat.com>; Fri, 13 Jan 2006 08:54:01 -0600 (CST)
Message-ID: <43C7BF09.3000003@fastenal.com>
Date: Fri, 13 Jan 2006 08:54:01 -0600
From: Kelly Sauke <ksauke@fastenal.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] And  another hdd to my LVM
References: <BAY103-F154BBF27416921A9C1ACBAD2260@phx.gbl>
In-Reply-To: <BAY103-F154BBF27416921A9C1ACBAD2260@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Use lvextend to extend the logical volume.  Then use ext2online (assuming you 
are using the ext2 or ext3 filesystem) to extend the filesystem.

Crazyguy78 Anderton wrote:
> When I Frist install fedora 4 I made a Lvm on  one of my harddrive 
> /dev/sdb5 and mount it to /video  and now I want to  add another hdd. 
> well now I got to where I set up the drive in Logical volume Management 
> and show both drive under Volgroup00. But I cannot figure out how to get 
> the other drive Show up to /video mount so I can Have more space.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
