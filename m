Message-ID: <3D6E44DB.7090202@dotcom.pl>
From: myciel <myciel@dotcom.pl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mounting reiserfs snaphost fails
References: <3D6DD029.1010905@dotcom.pl> <20020829130219.A32269@sistina.com>
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
Date: Thu Aug 29 10:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

thanks, this helped ofcourse

rafal

Heinz J . Mauelshagen wrote:
> Did you put the VFS lock patch in?
> You need that to be able to mount snapshots of *journaled* filesystems.
> 
> On Thu, Aug 29, 2002 at 09:41:29AM +0200, myciel wrote:
> 
>>Hi All
>>
>>I can't mount reisefs snapshot:
>>
>>mount: block device /dev/interia/intbackup is write-protected, mounting 
>>read-only
>>mount: wrong fs type, bad option, bad superblock on /dev/interia/intbackup,
>>        or too many mounted file systems
>>
>>
>>linux kernel 2.4.19 and lvm utils version 1.05.
>>
>>any hints?
>>
>>thanks
>>
>>rafal
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> 
