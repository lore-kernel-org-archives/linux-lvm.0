Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB7KGmr03391
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 15:16:48 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.199])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB7KGgb9020763
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 15:16:42 -0500
Received: by rproxy.gmail.com with SMTP id f1so434725rne
	for <linux-lvm@redhat.com>; Tue, 07 Dec 2004 12:16:38 -0800 (PST)
Message-ID: <b9a453c204120712167b2e9c96@mail.gmail.com>
Date: Tue, 7 Dec 2004 21:16:30 +0100
From: =?ISO-8859-1?Q?=D2scar_=C1lvarez_Vilaplana?= <grimborg@gmail.com>
Subject: Re: [linux-lvm] recovering a lvm volume group after one partition's
	deletion
In-Reply-To: <20041207195818.GE24229@agk.surrey.redhat.com>
Mime-Version: 1.0
References: <b9a453c204120710477fb9fcf7@mail.gmail.com>
	<20041207192907.GD24229@agk.surrey.redhat.com>
	<b9a453c204120711564bb852b0@mail.gmail.com>
	<20041207195818.GE24229@agk.surrey.redhat.com>
Content-Transfer-Encoding: 8bit
Reply-To: =?ISO-8859-1?Q?=D2scar_=C1lvarez_Vilaplana?= <grimborg@gmail.com>,
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks a million!! It's working now. 


On Tue, 7 Dec 2004 19:58:18 +0000, Alasdair G Kergon <agk@redhat.com> wrote:
> On Tue, Dec 07, 2004 at 08:56:14PM +0100, �scar �lvarez Vilaplana wrote:
> > Now the logical volumes appear in /dev/mygroup/, but when I try to
> > mount them I get the error "mount: special device /mount/mygroup/myvol
> > does not exist"
> 
> vgmknodes
> 
> lvchange -ay
> 
> 
> 
> Alasdair
> --
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
