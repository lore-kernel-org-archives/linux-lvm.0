From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Kernel-2.4.15pre6
Message-ID: <20011119083610.B755@tykepenguin.com>
References: <20011117231937.D12510@auctionwatch.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011117231937.D12510@auctionwatch.com>
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
Date: Mon Nov 19 02:34:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Nov 17, 2001 at 11:19:37PM -0800, Petro wrote:
> Is it known which version of LVM is in this kernel, and which version of
> the lvm tools go best with it? 

It's almost 1.0.1rc4. There is some difference between that and CVS but it's
quite decent to use. The 1.0.1rc4 tools are recommended.
 
> As well, am I missing something, or do I still need to apply the VFS
> patch? 

If you want to do snapshots of reiserfs (and, I think, ext3) then you will
still need the VFS lock patch yes.

patrick
