Message-Id: <200308192012.h7JKCvo00429@mail.osdl.org>
From: markw@osdl.org
Subject: Re: [linux-lvm] lvcreate with a 52 drive volume
In-Reply-To: <20030819163419.H29420@uk.sistina.com>
MIME-Version: 1.0
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
Date: Tue Aug 19 15:14:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, agk@uk.sistina.com
Cc: dm-devel@sistina.com

On 19 Aug, Alasdair G Kergon wrote:
> On Mon, Aug 18, 2003 at 05:00:12PM -0700, markw@osdl.org wrote:
>> On 18 Aug, Alasdair G Kergon wrote:
>> > On Mon, Aug 18, 2003 at 02:09:18PM -0700, markw@osdl.org wrote:
>> >> Ok, I increased the size of argv to 2048 in the dm-table.c file that's
>> > 2048 is probably too big for the kernel stack.
>> > Set it only as big as you need it.
>> Yeah, I got greedy, 1024 worked for me. :)
>  
> Here's a patch to try that removes the hard-coded limit of 32.
> 
> (Plus one to fix the error message if you give a linear
> target more than 2 arguments.)

I've applied it to 2.6.0-test3-mm3 and it works.

Thanks,
Mark
