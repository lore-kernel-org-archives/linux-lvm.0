Date: Wed, 28 Nov 2007 18:50:24 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Function clone_bio
Message-ID: <20071128185024.GA22843@agk.fab.redhat.com>
References: <474D8885.4090108@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <474D8885.4090108@gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Narayan <sumnaray@gmail.com>
Cc: linux-lvm@redhat.com

On Wed, Nov 28, 2007 at 10:25:57AM -0500, Sumit Narayan wrote:
> There is a possibility of NULL being returned from bio_alloc_bioset. 
> Although unlikely, it could crash the kernel.
 
If that function can ever return NULL, then it's a bug in the function.

If there's not enough memory available immediately, it's supposed to delay
returning until there is.

Alasdair
-- 
agk@redhat.com
