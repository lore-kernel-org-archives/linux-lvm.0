From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] Volume groups not found
Message-Id: <20020301150033.D22608@lynx.adilger.int>
References: <BC9564600E40C541983FCD6BEAF814FE03C94EC0@xch-knt-15.nw.nos.boeing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BC9564600E40C541983FCD6BEAF814FE03C94EC0@xch-knt-15.nw.nos.boeing.com>;
    from gordon.w.wolfe@boeing.com on Fri, Mar 01, 2002 at 12:25:03PM -0800
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
Date: Fri Mar  1 16:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mar 01, 2002  12:25 -0800, Wolfe, Gordon W wrote:
> We are in the process of upgrading to SuSE Linux/390 with the 2.4.7 kernel,
> supplied with LVM 0.9.1-beta-32.

Sadly, this LVM is quite old.  A lot of fixes have been made since this time.

> One server is running as a Samba print and file server for a department.
> The /home directory is an ext2 logical volume consisting of ten real 3390-3
> volumes.  This arrangement has been working fine for about six months.
> 
> This should have found all ten volumes of the volume group and logical
> volumes and rebuilt the information to remount the /home logical volume.
> Instead I get the messages that a) it's scanning all disk devices and b) no
> logical volumes were found.

Can you please send the output of "vgscan -v -d" and "pvdata -avP" for each
disk?  Please send that to both myself and Heinz (mge@sistina.com), as I
don't know if I have the time to look at it.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
