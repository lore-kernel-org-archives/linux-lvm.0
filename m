From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Software mirror with LVM
Message-ID: <20030908222828.GD19463@percy.comedia.it>
References: <A06B238D6FBAD1118C1F080036D2D40301241854@singwnt.igsea.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A06B238D6FBAD1118C1F080036D2D40301241854@singwnt.igsea.com>
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
Date: Mon Sep  8 17:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Sat, Sep 06, 2003 at 01:20:12PM +0800, Tan, Hong King wrote:
>Greetings,
>
>I am proposing a ML350 server with internal raid and another raid
>controller(Smart Array 5302) connected to StorageWorks Enclosure 4314.
>
>The internal raid is configured as RAID 1 across 2 drives and the external
>raid is configured as RAID 5 acroos 3 drives. 
>
>Can I use LVM to perform a software mirror between the internal raid and
>external raid volumes or I would need 3-party software like Veritas
>Foundation Suite for Linux ?
>
no you cannot use lvm to do mirroring, you can do striping with it,
or just use space from the two storage to form a single volume group.
I would not mix internal and external storage anyway if i were in you.
if you need the space on a single server buy a server with more slots...


L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
