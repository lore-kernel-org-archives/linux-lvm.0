Message-ID: <3E2A7AE4.8080801@informatik.uni-erlangen.de>
From: Rainer.Lay@informatik.uni-erlangen.de
MIME-Version: 1.0
Subject: Re: [linux-lvm] cannot extend lv
Content-Transfer-Encoding: 7bit
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
Date: Sun Jan 19 03:15:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com
Cc: idsfa@visi.com

My idea was not to make a 4 stripe set with 4 PV, but a 2 stripe set:

stripe1: aaaaaaaaabbbbbb
stripe2: cccccccccdddddd

so if PV a and c are full, PV b and d are used.

I would create a new lv as you suggested, but drives a and c are two 
times bigger than b and d, so I thought about the above solution.

Rainer

>> I have a vg (data) with four drives /dev/sd[b-e]1
>> I created a 2 stripes lv (data1) with sd[bc]1
>                 ^^^^^^^
> 
> You cannot extend striped lvs onto new pvs. Even on the
> same physical hardware.  Once you have striped it, you are
> tied to the pvs used.
> 
> If you think about it, this makes sense, as otherwise you
> have some stripes containing more data than others.  In fact,
> as soon as the smallest pv is full, you will not be able to
> extend the lv, even if there is room in the other pvs.
> 
> If you want to have the filesystem striped over all the disks, you
> will need to create a new lv which is striped across them all,
> transfer the data to it, delete the old lv and then extend the
> new one.
> 
> Backups highly recommended.
> 
> Michael
