Message-ID: <20021113140426.80016.qmail@web40706.mail.yahoo.com>
From: Pierre Lamb <plamb_98@yahoo.com>
Subject: Re: [linux-lvm] LVM ext3 and lvreduce
In-Reply-To: <1037195718.3126.4.camel@corr11.doc.state.vt.us>
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
Date: Wed Nov 13 08:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Sounds like you changed the lv size but didin't extend
the file system. try the resize2fs after you changed
the lv size

Pierre
--- Joseph Kezar <jkezar@doc.state.vt.us> wrote:
> 
> 
> I have LVM working, and I have created all my
> logical volumes for my
> environment.  All of my logical volumes have been
> mkfs.ext3'd. 
> Everything works, except for when I try to change
> the size with lvreduce
> or lvextend.  These tools are happy to work, but
> when I remount my
> logvols and type: mount I see that in fact the size
> that is reported to
> the OS has not changed.
> 
> Is there any incompatabilities with LVM and Ext3?  
> Is there a comparable tool for ext3 like e2fsadm?
> Is it possible to resize an ext3 partition while it
> is online?
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://tldp.org/HOWTO/LVM-HOWTO/


__________________________________________________
Do you Yahoo!?
U2 on LAUNCH - Exclusive greatest hits videos
http://launch.yahoo.com/u2
