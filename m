Message-Id: <200401191729.i0JHTJo24262@mail.osdl.org>
From: markw@osdl.org
In-Reply-To: <16395.42887.514077.642497@laputa.namesys.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: linux-2.6.0 + reiser4 oops
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
Date: Mon Jan 19 12:30:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita@Namesys.COM
Cc: reiserfs-list@Namesys.COM, linux-lvm@sistina.com

On 19 Jan, Nikita Danilov wrote:
> markw@osdl.org writes:
>  > I was testing our DBT-2 workload on linux-2.6.0 with LVM2 and reiser4
>  > and got the following oops when I attempted to create a database with
>  > PostgreSQL.  Let me know if I can provide any additional information:
>  > 
>  > Unable to handle kernel NULL pointer dereference at virtual address 00000000
>  >  printing eip:                                                       
>  > c014c607      
>  > *pde = 00104001
>  > *pte = 00000000
>  > Oops: 0000 [#1]
> 
> This looks much like another bug report we had for
> reiser4-on-top-of-raid0. A fix (tentative) for that was to use
> bio_add_page() while constructing bios, and it will be included into
> next reiser4 snapshot (that, I hope, will be released
> to-day---2004.01.19).

Hi Nikita,

I ran the 2004.01.19 snapshot against 2.6.1 and now I get the following
error when I attempt to mount the reiser4 parition:

reiser4[mount(17176)]: _init_read_super (fs/reiser4/init_super.c:166)[nikita-2608]:
WARNING: Wrong master super block magic.

Thanks,
Mark
