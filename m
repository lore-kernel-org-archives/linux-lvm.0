Return-Path: <ralph@oro.net>
Date: Tue, 17 Jul 2001 12:23:18 -0700
From: Ralph Jennings <ralph@oro.net>
Subject: Re: [linux-lvm] FW: LVM on Linux
Message-ID: <20010717122318.A20564@d3.front>
References: <85063BBE668FD411944400D0B744267A643418@AUSMAIL> <20010717174008.A1000@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010717174008.A1000@btconnect.com>
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

On Tue, Jul 17, 2001 at 05:40:08PM +0100, Joe Thornber wrote:
[snip]
>    Here there's one % that we can't get rid of (we could also do chunk = 
>    sector - (pe_size * index)), for the simple fact that the number of
>    stripes is not a power of 2, so we can't replace with shifts and masks.
> 
>    I just had a chat with one of the EVMS guys, EVMS *does* have this
>    exact same problem.
> 
>    Should we restrict stripes sets to powers of 2 ?
[snip]

Why not just make a mod function?

Preceeding code not tested, but should work?
It's been a while since I wrote C code.

BTW, what is a u64 (unsigned 64bit integer) in C called?
Is there any uniform cross platform way to say it (like
u64 perhaps)?

u64 mod_64(u64 number, u64 modNum) {
    while (number > modNum) {
        number -= modNum;
    }
    return number;
}
