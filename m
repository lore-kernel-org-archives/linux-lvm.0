From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] Whats wrong with this picture?
In-Reply-To: <20020121193613.J4014@lynx.turbolabs.com>
Message-Id: <Pine.LNX.4.10.10201220916130.22189-100000@pzat.meep.org>
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
Date: Tue Jan 22 03:22:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

On Mon, 21 Jan 2002, Andreas Dilger wrote:

> Because the Sistina folks changed it in a recent tools release to have
> a _full_ empty PE available for future expansion.  IMHO that is a bit
> of a waste, especially if you have large PEs.  I would much rather that
> it reserve some minimum amount of free space (e.g. 4MB or whatever) and
> then it doesn't need to waste so much.
> 
> Cheers, Andreas

Thats ok I guess, I kind of agree with you, They should have reserved a
finite amount of space. After all someone might have a pe of 512k which
could prove to be not enough and land them in trouble. If they have
reserved one PE the output of pvdisplay should say (1 PE reserved) cos its
not unusable, they have reserved it!

James
