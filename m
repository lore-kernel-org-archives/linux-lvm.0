From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Fwd: invalidate: busy buffer also on hppa
Message-ID: <20011207113329.GB792@tykepenguin.com>
References: <1007662439.3c0fb5679a6f5@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1007662439.3c0fb5679a6f5@webmail.tiscalinet.be>
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
Date: Fri Dec  7 05:31:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 06, 2001 at 07:13:59PM +0100, joel.soete@freebel.net wrote:
> Hi all,
> 
> I just try lvm-1.0.1 with the last linux kernel cvs for hppa (2.4.16-pa16).
> 
> Kernel boot well and vgscan now works (-O0 at compile time id fine for gcc-3.0)
> but  message "invalidate: busy buffer" appear on system console.
> 
> In your mailing list I read well some mail mentioning the problem but no final
> conclusion about the impact on LVM structure.
> 

It's harmless - if annoying.

patrick
