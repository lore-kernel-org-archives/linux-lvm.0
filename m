From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] lvm snapshot fails
Message-Id: <20020109163009.A769@lynx.adilger.int>
References: <20020109224112.GG30764@electricrain.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020109224112.GG30764@electricrain.com>; from
    daniel@electricrain.com on Wed, Jan 09, 2002 at 02:41:12PM -0800
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
Date: Wed Jan  9 17:31:15 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Sully <daniel@electricrain.com>
Cc: linux-lvm@sistina.com

On Jan 09, 2002  14:41 -0800, Daniel Sully wrote:
> I'm attempting to create a snapshot volume for a 50GB partition, however
> the lvcreate fails with the following error:
> 
> $ lvcreate -L1G -s -n wwwsnap /dev/vg00/www
> lvcreate -- WARNING: the snapshot will be automatically disabled once it gets full
> lvcreate -- INFO: using default snapshot chunk size of 64.00 KB for "/dev/vg00/wwwsnap"
> File size limit exceeded
> 
> strace shows it's getting a EFBIG error -

This is a kernel problem, added since 2.4.10, and fixed in 2.4.18-pre1.
You need to log into this system directly as root (no "su" or "sudo")
because it seems you are trying to set a ulimit somewhere, and the
kernel also prevents you from setting a real ulimit with glibc-2.1.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
