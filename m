From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] LVM and swap
Message-Id: <20020305002628.GA10637@auctionwatch.com>
References: <3C840AED.7AE477E7@ardynet.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C840AED.7AE477E7@ardynet.com>
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
Date: Mon Mar  4 18:26:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 04, 2002 at 07:01:49PM -0500, R Dicaire wrote:
> I have a swap partiton on each of three disks. Is it a good idea to
> create a logical volume utilizing these three partitions, and make
> one swap volume, say even striping it across all three disks?

    No. 

    The linux kernel is already pretty smart about this. 

-- 
Share and Enjoy. 
