Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] LILO configuration for LVM "boot" filesystem
Date: Fri, 8 Jun 2001 09:36:38 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJKECCIPAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <3B1FEFB6.93B4FBF7@wrkhors.com>
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
To: linux-lvm@sistina.com

yes, exactly.
Tell me, what is wrong with having /tmp as a mount point
for a LV?
(I'd suggest he got the symlink around the wrong way!
/var/tmp and /usr/tmp would be symlinks to /tmp...)


> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Steven Lembark
> Sent: Friday, June 08, 2001 9:19 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
> 
> 
> 
> > cd / ; mv tmp tmp.old ; ln -s /var/tmp .
> > reboot
> > rm -rf /tmp.old
> > 
> >     Now you don't have to worry about root filling up at all...
> 
> until you have to boot in single user w/o /var mounted and
> the whole sysystem fries for lack of /tmp :-)
> 
> -- 
>  Steven Lembark                                   2930 W. Palmer St.
>                                                  Chicago, IL  60647
>  lembark@wrkhors.com                                   800-762-1582
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
