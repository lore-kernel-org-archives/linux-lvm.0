From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] setting VG UUID
Message-ID: <20040123133558.V18942@uk.sistina.com>
References: <20040107065801.A27995@cs.mcgill.ca> <20040122214923.GH3060@percy.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040122214923.GH3060@percy.comedia.it>; from bluca@comedia.it on Thu, Jan 22, 2004 at 10:49:23PM +0100
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
Date: Fri Jan 23 08:37:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 22, 2004 at 10:49:23PM +0100, Luca Berra wrote:
> >After figuring out that my all my PVs were lacking UUIDs, I used this
> >hack from Heinz to correct the situation:
> >http://lists.sistina.com/pipermail/linux-lvm/2002-January/010521.html
> >(Alasdair also kindly provided a patch to handle the situation in LVM2.)
> is it possible to have a copy of this patch?
 
It's already in LVM2 CVS, together with patches to *change tools to let
you change the UUIDs to new random ones (not to be used while any
LVs are active).

Alasdair
-- 
agk@uk.sistina.com
