From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Re: [PATCH] lvm in 2.4.15.pre3
Message-ID: <20011112143250.A580@tykepenguin.com>
References: <20011112130101.A11020@tykepenguin.com> <E163GzN-0005po-00@the-village.bc.nu> <20011112162337.J26218@niksula.cs.hut.fi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011112162337.J26218@niksula.cs.hut.fi>; from vherva@niksula.hut.fi on Mon, Nov 12, 2001 at 04:23:37PM +0200
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
Date: Mon Nov 12 08:31:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 12, 2001 at 04:23:37PM +0200, Ville Herva wrote:
> On Mon, Nov 12, 2001 at 01:19:01PM +0000, you [Alan Cox] claimed:
> > > Please apply the following patch to LVM in 2.4.13pre3.
> > > 
> > > It looks like the LVM patch that came from Alan calls alloc/free_kiovec_sz()
> > > functions which only exist in his tree.
> > 
> > Just sent Linus the same thing 8)
> 
> Sorry if this is a FAQ, but I see the LVM in .15pre3 is 0.9.1beta2. Are there
> plans to merge something newer like 1.0.1pre4? 

I think you've misread the patch:

lvm.h:#define LVM_RELEASE_NAME "1.0.1-rc4(ish)"


patrick
