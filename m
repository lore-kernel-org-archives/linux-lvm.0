Return-Path: <plamb_98@yahoo.com>
Message-ID: <20010211200335.4505.qmail@web213.mail.yahoo.com>
Date: Sun, 11 Feb 2001 12:03:35 -0800 (PST)
From: Pete lamb <plamb_98@yahoo.com>
Subject: Re: [linux-lvm] (no subject)
In-Reply-To: <3A86EBFD.1401E7A8@wrkhors.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

That was my orginal options too. I was hoping some had
an "in place" way of doing it.

Thanks


--- Steven Lembark <lembark@wrkhors.com> wrote:
>  
> > Is there a utility to convert an existing ext2fs
> to a
> > lvm or do I have to due a complete new install???
> 
> if you aren't re-using the same acerage, just create
> the
> new LVM and cpio -p the data from old to new.  if
> you want
> to re-use the disk space then you'll have to back it
> up,
> make the LVM's and restore the contents.
> 
> -- 
>  Steven Lembark                                  
> 2930 W. Palmer St.
>                                                 
> Chicago, IL  60647
>  lembark@wrkhors.com                                
>   800-762-1582
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm


__________________________________________________
Do You Yahoo!?
Get personalized email addresses from Yahoo! Mail - only $35 
a year!  http://personal.mail.yahoo.com/
