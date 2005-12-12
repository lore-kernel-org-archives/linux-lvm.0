Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBCHlp104341
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 12:47:51 -0500
Received: from hotmail.com (bay102-f21.bay102.hotmail.com [64.4.61.31])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBCHllZQ021561
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 12:47:47 -0500
Message-ID: <BAY102-F216F122F1A873B76E363F9EF460@phx.gbl>
In-Reply-To: <20051212171353.GC25866@agk.surrey.redhat.com>
From: "Christopher Probst" <probst_christopher@hotmail.com>
Subject: Re: [linux-lvm] cannot compile LVM2
Date: Mon, 12 Dec 2005 17:47:40 +0000
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hello Alasdair,

Thank you and it solved the pbm. I have another question that again may 
sound really trivial. I am fairly new to Makefiles and Linux. Does the make 
install of LVM2 build the
"example_cmdlib.c" program. If yes where does it put the executable, if no 
how do I compile that program.

Thank you for your help
Christo

>From: Alasdair G Kergon <agk@redhat.com>
>Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
>To: LVM general discussion and development <linux-lvm@redhat.com>
>Subject: Re: [linux-lvm] cannot compile LVM2
>Date: Mon, 12 Dec 2005 17:13:53 +0000
>
>On Mon, Dec 12, 2005 at 05:06:06PM +0000, Christopher Probst wrote:
> > cache/lvmcache.c:178: error: `dm_hash_iterate_fn' undeclared (first use 
>in
> > this function)
>
> > What am I doing wrong?
>
>make install device-mapper 1.02.01 first
>
>Alasdair
>--
>agk@redhat.com
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
