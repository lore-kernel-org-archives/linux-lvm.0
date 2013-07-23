Date: Mon, 22 Jul 2013 20:52:37 -0400
From: Kumar amit mehta <gmate.amit@gmail.com>
Message-ID: <20130723005237.GA4977@gmail.com>
References: <20130722051502.GA5685@gmail.com> <51ED2268.7030702@redhat.com>
	<20130722105712.GA1570@gmail.com> <20130722112348.GB1570@gmail.com>
	<51ED93A8.6040303@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51ED93A8.6040303@redhat.com>
Subject: Re: [linux-lvm] lvcreate --thin gives "unknown segment type" error
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@redhat.com

On Mon, Jul 22, 2013 at 10:18:48PM +0200, Zdenek Kabelac wrote:
> It's your backend device used for thinpool data  which doesn't
> support discard. So it fallbacks to  nopassdown behaviour (discard
> is processed only at pool level).

So, it seems that my backend device(of which I've no idea!!) does not 
support discard.
> 
> >I'm invoking these commands on a VM. I do not know, from where these
> >storage were mapped to my VM(were done my some storage admin). However
> 
> Important piece of puzzle - if you want to see TRIM command hits your storage,
> your storage needs to support it ;)
> 
> BTW it's perfectly ok to use thin pool only with nopassdown.
> 
> Zdenek
> 
> 
> NOTE: issue_discard in lvm.conf is not related in any way with
> --discards option for thin pool creation.

Hmm.

Thank you for your time and answering my queries.

!!amit
