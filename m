From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] A way to bypass LVM and extract the raw data off?
Message-Id: <20020109124025.O769@lynx.adilger.int>
References: <1010309724.3c381a5ce8cbe@www.snappymail.ca>
    <1010343969.3c38a0214056f@www.snappymail.ca>
    <20020106152433.Q12868@lynx.no>
    <1010359883.3c38de4b3692f@www.snappymail.ca>
    <1010543196.3c3baa5c40c49@www.snappymail.ca>
    <20020109023404.GC1096@auctionwatch.com>
    <1010545378.3c3bb2e2a4dec@www.snappymail.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1010545378.3c3bb2e2a4dec@www.snappymail.ca>; from
    ipso@snappymail.ca on Tue, Jan 08, 2002 at 07:02:58PM -0800
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
Date: Wed Jan  9 13:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: IpSo <ipso@snappymail.ca>
Cc: linux-lvm@sistina.com

On Jan 08, 2002  19:02 -0800, IpSo wrote:
> Yup! I'm confident everything as far as the reiser filesystem is fine,
> just LVM is very confused. 
> 
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hda1   *         1       507    255496+  82  Linux swap
> /dev/hda2           508     39813  19810224    5  Extended
> /dev/hda5           508      4633   2079472+  83  Linux
> /dev/hda6          4634     39813  17730688+  8e  Linux LVM
> 
>  
> >     If you have the HD space, you could try dd if=/dev/hda6 of=/some/file
> > 
> >     Then mount -o loop /some/file /mnt/point -t reiserfs. 
> > 
> >     I don't think this would do any more damage. 
>
> I'll give it a shot I guess, won't this loopback file contain the extra LVM
> information and cause problems when trying to mount it though? Does the LVM
> information take up the first 2mb or something that I could set the offset as,
> so it doesn't carry over to the loopback file?

No, it uses a variable amount of space.

What you could do is try

od -Ad -a /dev/hda6 | grep "R   e   I   s   E   r   2   F   s"

and start your dd 65584 bytes before the address at the line this is
found on (it should align to an even block boundary).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
