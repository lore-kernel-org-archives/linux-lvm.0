Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m056a3LX010488
	for <linux-lvm@redhat.com>; Sat, 5 Jan 2008 01:36:03 -0500
Received: from fmailhost02.isp.att.net (fmailhost02.isp.att.net
	[207.115.11.52])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m056ZWGk013718
	for <linux-lvm@redhat.com>; Sat, 5 Jan 2008 01:35:33 -0500
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id B879917F361
	for <linux-lvm@redhat.com>; Sat,  5 Jan 2008 01:35:26 -0500 (EST)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 04787-05 for <linux-lvm@redhat.com>;
	Sat,  5 Jan 2008 01:35:26 -0500 (EST)
Date: Sat, 5 Jan 2008 01:35:26 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [LINUX-LVM] shrinking a volume inside an LVM
Message-ID: <20080105063526.GA19245@bdmcc-us.com>
References: <20080104193819.GA2021@bdmcc-us.com>
	<F61B3F3722111146AF452DF29FDCCF5F038D1BD8@xchg03.bolivar.k12.mo.us>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F61B3F3722111146AF452DF29FDCCF5F038D1BD8@xchg03.bolivar.k12.mo.us>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jan 04, 2008 at 02:50:00PM -0600, Kemp, Levi wrote:
> Most of this makes sense. Especially the part about using a live CD. But if you don't mind I'm gonna pick your brain on the other parts because I like to understand a command before I use it, so I can blame myself when I mess up ;-) 
> Actually the only part I'm unsure about is 9-11. resize2fs will resize my ext2/3 file system which will clear up more room in my lvm to create another lv correct? Or do you have to shrink the file system then the lv to have the space back? I'm going to back up anything that I need to be safe, but I'd like to avoid a total reinstall right now(that's for May). Thanks again. I think you've got me on track. One more quick one, on 9 you said "amount occupied + some" wouldn't it be minus some?

Stuart answered at least as well as I could, but for the last, "occupied
+ some" is what I meant.  By "occupied" I am talking about the amount of
data that actually exists in your "/" volume.  Then, since you need a
little room to grow, add some to that value, so that you have a bit of
free space in that volume. ( As well as Stuart's explanation, to leave
room for errors. )


Brian
