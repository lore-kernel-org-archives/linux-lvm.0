From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Patching Kernel 2.4.16.
Message-ID: <20011213010814.GC13832@auctionwatch.com>
References: <20011213002345.GA13832@auctionwatch.com> <20011213004917.GB13832@auctionwatch.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011213004917.GB13832@auctionwatch.com>
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
Date: Wed Dec 12 19:06:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Dec 12, 2001 at 04:49:17PM -0800, Petro wrote:
> On Wed, Dec 12, 2001 at 04:23:45PM -0800, Petro wrote:
> >     I'm trying to build a kernel with the 1.0.1 stuff, I run the
> >     Makefile in the PATCHES file generating lvm-1.0.1-2.4.16.patch
> >     and apply this to the kernel souce (patch -p1 < ../...) cleanly.
> >     Run make oldconfig, make dep, make bzImage > output and I get a
> >     whole bunch of errors starting with: 
> 
>    Interesting. I tried it again building LVM as a module and it
>    workeded. 

    So I built LVM as a module, it's in there: 
    Module                  Size  Used by
    nfs                    71536  11  (autoclean)
    lockd                  47152   1  (autoclean) [nfs]
    sunrpc                 63648   1  (autoclean) [nfs lockd]
    lvm-mod                47488   3 
    acenic                235584   1 
    
    Wait a minute. 

    I still need to apply the VFS Lock Patch, right? 

-- 
Share and Enjoy. 
