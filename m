From: "Anthony W. Marino" <anthony@AWMObjects.com>
Subject: Re: re[2]: [linux-lvm] System Suggestions
References: <Pine.BSI.4.10.10203062217030.17216-100000@xs3.xs4all.nl>
In-Reply-To: <Pine.BSI.4.10.10203062217030.17216-100000@xs3.xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <auto-000020233424@front1.mail.megapathdsl.net>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Mar  6 15:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Seth Mos <knuffie@xs4all.nl>, Greg Freemyer <freemyer@NorcrossGroup.com>
Cc: Petro <petro@auctionwatch.com>, linux-lvm@sistina.com, linux-xfs@oss.sgi.com, mysql@lists.mysql.com

>
> If you are looking into using the 3Ware controllers watch the following:
> The 64xx controllers are underpowered and should better not be used in
> raid 5 mode.
> The 74xx controllers seem to be good and should be fine with raid5 but
> note that raid5 will always have slow write speeds.
>
Is there a way to minimize the write penalty using both XFS and LVM with RAID 
5?

Thanks,
Anthony

> Software raid can be used if you need a lot of speed _and_ redundancy.
>
> Cheers
> Seth
