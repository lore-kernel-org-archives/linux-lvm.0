Message-ID: <3E6FB34E.30003@cox.net>
From: "Kevin P. Fleming" <kpfleming@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid system.
References: <20030312195217.GC18876@auctionwatch.com> <20030312221320.GA15196@gw.silicide.dk>
In-Reply-To: <20030312221320.GA15196@gw.silicide.dk>
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
Date: Wed Mar 12 16:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

jon+lvm@silicide.dk wrote:
> On Wed, Mar 12, 2003 at 11:52:17AM -0800, Petro wrote:
> 
>>I've got a couple of brand new boxes I'm trying to get LVM set up
>>properly on. 
>>
>>These machines have 6 200GiB drives attached to a 3ware controller card,
>>for a total of 1,200,000,000,000 bytes of storage. 
> 
> 
> later down you write you need speed. In that case i would suggest
> ditching the hardware raid, and use pure software raid, it is faster.
> I dont mind 3ware, i have dome myself, but my benchmarking revealed
> that software was faster.
> 

True, but I'd sure hate to wait for a software array rebuild when the system 
crashes... I've only got a pair of 160G drives but I still hate waiting when the 
kernel has a problem. If your system is very, very stable this might not be an 
issue.
