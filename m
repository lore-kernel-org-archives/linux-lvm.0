From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lilo wrote to an lvm disk
Message-ID: <20030402072605.GC27228@percy.comedia.it>
References: <1049253225.1486.7.camel@jb>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049253225.1486.7.camel@jb>
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
Date: Wed Apr  2 01:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Apr 01, 2003 at 09:13:45PM -0600, Justin Bauer wrote:
>Hi,
>
>I was having trouble earlier with lilo, and while configuring it, I
>wrote it to the mbr on a disk I had lvm on.  The only place I found that
>mentioned this problem was in an email to this list in march 2001, over
>two years ago.  It basically said that the lvm disk would be hosed.  Is
>there anyway to get the data off the disk? or repair it?

if you have a recent metadata backup you can try using vgcfgrestore to
put the metadata back on the disk.

other options depend on what was the disk layout:
was it the only disk you had in the volume group?
are there lv sharing more than one pv?
do you recall the LV layout?

>Also, in the future, could I use the mbr if the pv was a partition
>rather than the whole disk?

that would be a good idea.
as much as i hate partition tables i found that just too much code in
linux applications depend on having a partition table, so wasting
512bytes for a partition table entry is easier than fixing everything
that breaks.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
