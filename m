Return-Path: <rasmus@jaquet.dk>
Date: Tue, 5 Jun 2001 16:05:32 +0200
From: Rasmus Andersen <rasmus@jaquet.dk>
Subject: Re: [linux-lvm] Problems with 0.9.1b7 and 2.2.20-2
Message-ID: <20010605160532.B1384@jaquet.dk>
References: <20010605092436.B856@jaquet.dk> <20010605123417.A23541@sistina.com> <20010605154656.A1384@jaquet.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010605154656.A1384@jaquet.dk>; from rasmus@jaquet.dk on Tue, Jun 05, 2001 at 03:46:57PM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 05, 2001 at 03:46:57PM +0200, Rasmus Andersen wrote:
> On Tue, Jun 05, 2001 at 12:34:17PM +0200, Heinz J. Mauelshagen wrote:
> > 
> > This sounds like a well known ext2 problem.
> > Did you run fsck successfully? And if so, didn't it work again?
> 

Forgot to state that before the panic->reboot fsck could not complete.
It ran up against a short read with the kernel log entry as reported.
This was (of course) on /dev/vg1/lvol4, not mounted.
-- 
        Rasmus(rasmus@jaquet.dk)

It's a recession when your neighbour loses his job; it's a depression 
when you lose yours. -- Harry S. Truman 
