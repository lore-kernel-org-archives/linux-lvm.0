From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Kernel 2.4.12 bug?
Message-ID: <20011024090009.A577@tykepenguin.com>
References: <20011020111357.A13288@lsc.hu> <20011022094833.B557@tykepenguin.com> <20011024082146.A3130@lsc.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011024082146.A3130@lsc.hu>; from gcs@lsc.hu on Wed, Oct 24, 2001 at 08:21:46AM +0200
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
Date: Wed Oct 24 02:59:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 24, 2001 at 08:21:46AM +0200, GCS wrote:
> Hi,
> 
> On Mon, Oct 22, 2001 at 09:48:33AM +0100, Patrick Caulfield <caulfield@sistina.com> wrote:
> > Not that I've seen. I'm running 2.4.12 ATM quite happily, LVM is a module rather
> > than in the kernel though.
>  My kernel is still complaining during vgscan, see the syslog:

Are you swapping onto the LV ? It seems that swapoff -a does not remove the LV
from the list of swap partitions, so vgchange -an would either fail or pull the
rug out from underneath the paging mechanism.

patrick
