Date: Thu, 4 Oct 2001 18:30:37 +0100
Subject: Re: [linux-lvm] lvm 1.0 and kernel 2.2.19.Is rawio patch necessary ??
Message-ID: <20011004183037.A3711@btconnect.com>
References: <3BBC550E.442F190C@ti.com> <3BBC7C22.1119BF0@promofinarsa.es>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BBC7C22.1119BF0@promofinarsa.es>; from jesus_navarro@promofinarsa.es on Thu, Oct 04, 2001 at 05:11:30PM +0200
From: Joe Thornber <thornber@btconnect.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 04, 2001 at 05:11:30PM +0200, Jesus Manuel NAVARRO LOPEZ wrote:
> Hi, Christian:
> 
> christian e wrote:
> > 
> > Hi,all
> > 
> > I downloaded lvm 1.0 and kernel 2.2.19.Couldn't find a rawio for 2.2.19
> > so I thought it wasn't necessary.Is it ? The rawio patch for 2.2.19 is
> > not here:
> > 
> > ftp://ftp.kernel.org/pub/linux/kernel/people/sct/raw-io/
> > or in the PATHCES dir..
> > 
> 
> Well, I'm in same position than you, but having problems.
> I also asked about the necesity of raw-io patches (specifically for
> 2.2.19) but till the moment no answer.
> 
> > I did a ./configure and then a make in the patches dir.Applied that
> > patch without problems.After compiling the kernel and booting up again I
> 
> Well, I patched kernel with raw-io for 2.2.18, and then with the lvm
> patch provided by ./configure then make at PATCHES, but my kernel didn't
> compile (well, the kernel did, but the make modules failed).

The rawio patch is needed for snapshots.

- Joe
