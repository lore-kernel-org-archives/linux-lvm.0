From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM/RAID again
Message-Id: <20020307001623.GC8933@colombina.comedia.it>
References: <20020306203532.GA622@human.galaxy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020306203532.GA622@human.galaxy>
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
Date: Wed Mar  6 18:16:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Mar 06, 2002 at 09:35:32PM +0100, Frank Lenaerts wrote:
> take snapshot backups etc.. The problem I currently face however, is
> the fact that both nodes autodetect the metadevices and start syncing
> the mirrors, independently of each other (I do not have the LVM and
...
> - do not use LVM at all, just use the physical disks instead
this is not an lvm problem but an md one
list is linux-raid@vger.kernel.org

> - have two separate raidtab files where each of them is only "owned"
>   by a single node (to prevent syncing problems) and only start the
>   raid for a certain metadevice when a logical volume is imported on a
>   node
get rid of raidstart and raidtab and use
mdctl from neil brown
http://www.cse.unsw.edu.au/~neilb/source/mdctl/
also be sure you are not using raid autodetection


L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
