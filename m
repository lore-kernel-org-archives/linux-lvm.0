Received: from ns3.rdu.redhat.com (ns3.rdu.redhat.com [10.11.255.199])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8CJwS41030143
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 15:58:28 -0400
Received: from leguan.localdomain (vpn-4-112.str.redhat.com [10.32.4.112])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m8CJwRpv031546
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 15:58:28 -0400
Message-ID: <48CAC9E3.5010803@redhat.com>
Date: Fri, 12 Sep 2008 21:58:27 +0200
From: Jaroslav Stava <jstava@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Recovering LVM partition after OS reinstallation
References: <3d847d110809120248r796de032u29b08d41278c6299@mail.gmail.com>	<48CA9D5F.8090502@redhat.com>
	<3d847d110809121151r611783cet8d9b24f6534aaeff@mail.gmail.com>
In-Reply-To: <3d847d110809121151r611783cet8d9b24f6534aaeff@mail.gmail.com>
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

hanocri napsal(a):
> Sorry, I made a terrible mistake!
> After your suggestions I've dumped (using dd) some first sectors of
> /dev/dm-6 to check what is in header and I noticed LUKS label.
>   
At least my my post did help in some way :-)
> I totally forgot that whole partition was encrypted (it used to be
> unlocked by external keyfile). So I unlocked partition first and after
> that activated LVM.
> All volumes are here, healthy and intact.
>   
Congratulations. (Not a terrible mistake after all)
> About "lvroot" volume - it was never in use. I planned to install
> other distribution here, but I never did.
> Root filesystem is on non-lvm partition.
>
> Again sorry for this stupid mistake and thank you for your help.
>
>   
You are welcome

Jaroslav Stava
