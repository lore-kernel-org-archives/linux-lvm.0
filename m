Message-ID: <3EF7A4CF.5060302@cox.net>
From: "Kevin P. Fleming" <kpfleming@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] read-only media in a LVM?
References: <C42D120999B1CC4C886B6BB2832F356019BF90@hermes.genomatica.com>
In-Reply-To: <C42D120999B1CC4C886B6BB2832F356019BF90@hermes.genomatica.com>
Content-Transfer-Encoding: 7bit
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
Date: Mon Jun 23 20:10:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Sean P. Kane wrote:
> I'd love to have a unionfs, but my understanding is that no such beast
> exists for Linux 2.4 currently and won't likely appear until after the
> 2.6 release. If this is not the case, I would love to hear about it. Is
> there some decent (although maybe beta) support for a unionfs in the 2.5
> kernels? I am using the LVM2 backport to 2.4 currently to test the
> device-mapper approach out in the meantime, but if there is a better way
> to do it, I'd love to hear about it.
> 

No, this won't appear for 2.4 kernels at any time, I'd wager. However 
2.4 kernels support mount --bind just fine, so that may be an option 
for you if the writable directories in your filesystem can be 
predetermined.
