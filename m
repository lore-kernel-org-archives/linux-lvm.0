From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] pvcreate problem
Message-Id: <20020102094855.A12546@colombina.comedia.it>
References: <25E4CA13D679FF48BC307694202209710164DE23@nd1-clusa.local.bunnings.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25E4CA13D679FF48BC307694202209710164DE23@nd1-clusa.local.bunnings.com.au>;
    from CCoe@bunnings.com.au on Wed, Jan 02, 2002 at 04:09:44PM +0800
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
Date: Wed Jan  2 02:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Wed, Jan 02, 2002 at 04:09:44PM +0800, Colin Coe wrote:
> 
> Hi all, when I try and 'pvcreate /dev/md0' I get the error: "pvcreate --
> device '/dev/md0' has a partition table".  I have tried using the -f and
> --force options without success.
> 
> /dev/md0 used to have an XFS partition on it.
> 
> Any ideas?

I believe you are running an older version of the tools
either upgrade your tools to the latest version or
scan the list archives for a patch for this.

L.
P.S. latest version is 1.0.1

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
