From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] VG dissappeared without a trace?
Message-Id: <20020106152433.Q12868@lynx.no>
References: <1010309724.3c381a5ce8cbe@www.snappymail.ca>
    <1010343969.3c38a0214056f@www.snappymail.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1010343969.3c38a0214056f@www.snappymail.ca>; from
    ipso@snappymail.ca on Sun, Jan 06, 2002 at 11:06:09AM -0800
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
Date: Sun Jan  6 16:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Jan 06, 2002  11:06 -0800, IpSo wrote:
> A follow up to this, I downloaded uuid_fixer to see if it would help, here's
> what I tried:
> 
> [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6
> Error: number of PVs passed in does not match number of PVs in /dev/hda6's VG
>        1 PVs were passed in and 2 were expected.
> 
> 
> [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdb6
> Error: number of PVs passed in does not match number of PVs in /dev/hdb6's VG
>        2 PVs were passed in and 3 were expected.
> 
> Hrmm, so it must be looking for the partition I deleted on /dev/hdc. :( I
> re-created the partition just to see:
> 
> [root@ipso uuid_fixer]# ./uuid_fixer /dev/hda6 /dev/hdb6 /dev/hdc1
> Error: number of PVs passed in does not match number of PVs in /dev/hda6's VG
>        3 PVs were passed in and 2 were expected.

Try hda6 and hdc, since this is what you had in the VG before you shut down.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
