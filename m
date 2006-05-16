Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4GJAqQd010550
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 15:10:52 -0400
Received: from zcars04f.nortel.com (zcars04f.nortel.com [47.129.242.57])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4GJAdGo003372
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 15:10:40 -0400
Message-ID: <446A239D.6060602@dogpad.net>
Date: Tue, 16 May 2006 14:10:21 -0500
From: Joe Harvell <jharvell@dogpad.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't mount logical volume - super block error
References: <e5146c2a050302230579216b77@mail.gmail.com>
In-Reply-To: <e5146c2a050302230579216b77@mail.gmail.com>
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
To: Sasha Z <kleptophobiac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Sasha:

The symptoms you are describing sound similar to the problem I am 
having.  Refer to my recent post in linux-lvm entitled: "LVM2 
tools<-->library<-->driver compatibility".

Sasha Z wrote:
> I had a functioning lvm using four hard discs, but found it necessary
> to rebuild my operating system. Since then, while the vg and lv come
> online are read available, I can't actually mount the filesystem or do
> anything with it. It says it cannot read the superblock at locations 2
> and 16.
>
> does anybody have any thoughts on this?
>
> I've tried 2.00.25 and 2.00.33.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>   
