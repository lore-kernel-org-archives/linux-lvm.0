Message-ID: <3E6FC1C0.9040204@cox.net>
From: "Kevin P. Fleming" <kpfleming@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid system.
References: <20030312195217.GC18876@auctionwatch.com> <20030312221320.GA15196@gw.silicide.dk> <3E6FB34E.30003@cox.net> <20030312224940.GA15229@gw.silicide.dk> <3E6FBBED.1000101@cox.net> <20030312231627.GA15246@gw.silicide.dk>
In-Reply-To: <20030312231627.GA15246@gw.silicide.dk>
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
Date: Wed Mar 12 17:25:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

jon+lvm@silicide.dk wrote:
> On Wed, Mar 12, 2003 at 03:59:57PM -0700, Kevin P. Fleming wrote:
> 
>>jon+lvm@silicide.dk wrote:
>>
>>>you're talking about raid0. You dont rebuild raid0. Not in hardware, not
>>>in software.
>>
>>OK, I missed that extremely important and very obvious point :-)
> 
> 
> thought so. Anyway, why would it take longer time to rebuild the
> array using software rather than hardware raid? It's still the
> same ammount of data needed to be copied.
> 

Right, but a kernel oops doesn't cause an array rebuild to be necessary if 
you're using a 3ware or similar RAID card. The only thing that would cause a 
rebuild would be a drive failure or a power failure (which is of course easy to 
protect against).

The software code (which I've been using for quite a while) needs to rebuild any 
time the array is not shut down cleanly, which can happen for a number of reasons.
