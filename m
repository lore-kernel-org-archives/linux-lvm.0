From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] lvm and Debian
Message-Id: <20020118140005.GB22956@auctionwatch.com>
References: <E16RWI7-00083Z-00@arwen.dev33.cvf>
    <20020118104418.GA29876@balu.kawo2.rwth-aachen.de>
    <E16RWih-0000HQ-00@arwen.dev33.cvf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16RWih-0000HQ-00@arwen.dev33.cvf>
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
Date: Fri Jan 18 08:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 18, 2002 at 11:58:03AM +0100, Pierrick PONS wrote:
> > > 
> > > Am I obliged to use lvm_1.0.1-rc4 (that's the latest I found on Sistina web 
> > > site ) if I'm under a 2.4.17 kernel ?
> > 
> > The text on http://www.sistina.com/products_lvm_download.htm is not up
> > to date. There's 1.0.1 final already on the FTP server. Just follow the
> > link to 1.0.1rc4.
> > 
> > Although I did not have any problems with the 1.0.1rc4(ish) code in
> > stock kernel 2.4.17, I'd recommend using 1.0.1. 
> > 
> > Regards, Markus
> > 
> > -- 
> > Free the Fluffy Bunny.
> > 
> 
> There's a thing I don't understand : is the lvm_1.0.1rc4 patch still in the 
> 2.4.17 kernel or do I have to patch my 2.4.17 kernel to use lvm and lvm 
> commands ?

    Yes, it's still in the kernel.

    You're better off patching to 1.0.1 release, and if you want to do
    snaps, the VFS lock patch. 

> I thought that using a 2.4.17 kernel permitted to have lvm fonctionalities and 
> not to be obliged to patch the kernel.

    You don't have to. 

-- 
Share and Enjoy. 
