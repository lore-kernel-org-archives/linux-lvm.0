From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Patching Kernel 2.4.16.
Message-ID: <20011213083846.GC14581@auctionwatch.com>
References: <20011213002345.GA13832@auctionwatch.com> <20011213004917.GB13832@auctionwatch.com> <20011213010814.GC13832@auctionwatch.com> <20011213082314.GA942@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011213082314.GA942@tykepenguin.com>
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
Date: Thu Dec 13 02:36:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 13, 2001 at 08:23:14AM +0000, Patrick Caulfield wrote:
> On Wed, Dec 12, 2001 at 05:08:14PM -0800, Petro wrote:
> >     
> >     Wait a minute. 
> > 
> >     I still need to apply the VFS Lock Patch, right? 
> 
> Only if you need snapshotting of journalled filesystems.

    Yeah, that's our primary reason for using LVM.

    I applied the patch and it works fine now. a

    Sorry about that last email, that was me thinking aloud.
-- 
Share and Enjoy. 
