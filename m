From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid
 system.
Message-ID: <140770000.1047758399@[192.168.200.4]>
In-Reply-To: <3E704492.DF386E61@silicide.dk>
References: <20030312195217.GC18876@auctionwatch.com>
 <20030312221320.GA15196@gw.silicide.dk>
 <20030312234520.GA19335@auctionwatch.com> <3E704492.DF386E61@silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Sat Mar 15 13:50:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Jon Bendtsen <jon+lvm@silicide.dk>

>> > that depends. You can stripe the lvm, but then you cant resize it.
>> > if you made a LV, then it would proberly just allokate all on one
>> > "disk", aka sda, and then on sdb.
>>
>>     I'm using 100% of the VG for the same LV.
>>
>>     I'm fine with not being able to resize it. Do I need the MD stuff to
>>     stripe it?
>
> No. You can stripe using the LV system. But i would think that
> if you can shutdown the LV, then you might as well stop the VG,
> and do it on the raw device. (except this isnt as future proof
> as a LVM system is).

Nor as flexable: with LVM you can easily grow the LV's, with
out LVM you are stuck with fixed partitions.




--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 888 359 3508
