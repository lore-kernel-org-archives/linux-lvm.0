Subject: Re: [linux-lvm] Is it possible to change the PE size on a live volume?
Message-ID: <20021021202127.GA3129@fib011235813.fsnet.co.uk>
References: <BDEMIPDEGABMNEFIHCPDIEHGEBAA.bill+f.9sfuw6uo@tao-group.com> <200210212044.12544.tdickenson@geminidataloggers.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200210212044.12544.tdickenson@geminidataloggers.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Mon Oct 21 15:22:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 21, 2002 at 08:43:56PM +0100, Toby Dickenson wrote:
> On Monday 21 Oct 2002 7:22 pm, William Blunn wrote:
> > > Greetings. My volume is 225 GB in size and getting too small.
> > > Unfortunately, I used the default PE size when creating the volume
> > > group. Is there any way I can overcome the 256 GB limit ...
> >
> > In the LVM 1.0.x series,
> >
> > Given the sizes of modern hard disk arrays,
> > maybe the default PE/LE size should be changed from 4 MiB to 16 MiB,
> > in the LVM 1.0.x series.
> >
> > My feeling is that more people's needs would fit into 1 TiB than fit
> > into 256 GiB.
> 
> doesnt LE size affect snapshot performance too?

Not really, no.  Maybe you're getting confused with the snapshot chunk
size.

- Joe
