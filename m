From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Kernel-2.4.15pre6
Message-ID: <20011120161418.C807@tykepenguin.com>
References: <20011117231937.D12510@auctionwatch.com> <20011119083610.B755@tykepenguin.com> <20011119111218.A25684@auctionwatch.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011119111218.A25684@auctionwatch.com>
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
Date: Tue Nov 20 10:13:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 19, 2001 at 11:12:18AM -0800, Petro wrote:
> > If you want to do snapshots of reiserfs (and, I think, ext3) then you will
> > still need the VFS lock patch yes.
> 
>     Is there any indication that this patch will make it in to the
>     official kernel at some point? 

I don't know is the honest answer. It's Chris Mason's patch, we just distribute
it for convenience of LVM users, I don't know if (or how many times!) he's tried
to submit it for inclusion.

patrick
