From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] lvmcreate_initrd failing...not sure why
Message-ID: <626880000.1041460788@[192.168.200.4]>
In-Reply-To: <se1313e0.064@thpmail.tyndale.com>
References: <se1313e0.064@thpmail.tyndale.com>
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
Date: Wed Jan  1 16:31:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> Well, I have read that this is usually the best case before.  But it is
> more just something I would like to do, not that I feel I need to.  It
> *is* possible, right?  My system isn't mission critical and LVM is
> something I have never messed with before, so I figured why not go all
> the way and just use all my disks as PVs.
>
> Your recommendation would be to keep root and swap out of LVM, and just
> mount /usr /var /home as LVs?

I normally leave / on a partition, maybe /scratch, maybe
primary swap (most systems today don't swap enough to make
it worth the diffrernce). My sandbox area is mounted under
/sandbox, which is also on LVM, along with any database
areas.

Only point is to keep the root volume small enough that it
doesn't need to grow, which means it can conviently be put
onto a partition.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 8773 252 1080
