From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] lvcreate with a 52 drive volume
Message-ID: <20030818222002.E29420@uk.sistina.com>
References: <20030818185934.D29420@uk.sistina.com> <200308182109.h7IL9Lo27219@mail.osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200308182109.h7IL9Lo27219@mail.osdl.org>; from markw@osdl.org on Mon, Aug 18, 2003 at 02:09:18PM -0700
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
Date: Mon Aug 18 16:21:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 18, 2003 at 02:09:18PM -0700, markw@osdl.org wrote:
> Ok, I increased the size of argv to 2048 in the dm-table.c file that's

2048 is probably too big for the kernel stack.

Set it only as big as you need it.

We're working on a proper fix.

Alasdair
-- 
agk@uk.sistina.com
