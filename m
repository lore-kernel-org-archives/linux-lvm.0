Message-Id: <200308190000.h7J00Fo31973@mail.osdl.org>
From: markw@osdl.org
Subject: Re: [linux-lvm] lvcreate with a 52 drive volume
In-Reply-To: <20030818222002.E29420@uk.sistina.com>
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
Date: Mon Aug 18 19:01:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 18 Aug, Alasdair G Kergon wrote:
> On Mon, Aug 18, 2003 at 02:09:18PM -0700, markw@osdl.org wrote:
>> Ok, I increased the size of argv to 2048 in the dm-table.c file that's
> 
> 2048 is probably too big for the kernel stack.
> 
> Set it only as big as you need it.
> 
> We're working on a proper fix.
> 
> Alasdair

Yeah, I got greedy, 1024 worked for me. :)

Thanks again,
Mark
