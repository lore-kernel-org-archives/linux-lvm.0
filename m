Message-ID: <20040122205210.A12508@cs.mcgill.ca>
From: Navindra Umanee <navindra@cs.mcgill.ca>
Subject: Re: [linux-lvm] setting VG UUID
References: <20040107065801.A27995@cs.mcgill.ca> <20040122214923.GH3060@percy.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20040122214923.GH3060@percy.comedia.it>; from Luca Berra on Thu, Jan 22, 2004 at 10:49:23PM +0100
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
Date: Thu Jan 22 20:53:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: agk@redhat.com, linux-lvm@sistina.com, bluca@comedia.it

Luca Berra <bluca@comedia.it> wrote:
> >After figuring out that my all my PVs were lacking UUIDs, I used this
> >hack from Heinz to correct the situation:
> >
> >http://lists.sistina.com/pipermail/linux-lvm/2002-January/010521.html
> >
> >(Alasdair also kindly provided a patch to handle the situation in LVM2.)
> 
> is it possible to have a copy of this patch?

Up to Alasdair...  have you seen this problem too?

Remember, if your PV is lacking UUIDs, your VG probably is too and
that's going to cause problems as well.  

At least it did for me.

Cheers,
Navin.
