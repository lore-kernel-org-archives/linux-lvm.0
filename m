Subject: Re: [linux-lvm] pvmove with Bad bocks
Message-ID: <20011021155622.A9367@btconnect.com>
References: <55159047260.20011020155124@gmx.de> <20011021140746.B15468@vestdata.no>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20011021140746.B15468@vestdata.no>; from lvm@ragnark.vestdata.no on Sun, Oct 21, 2001 at 02:07:46PM +0200
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
Date: Sun Oct 21 09:55:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sun, Oct 21, 2001 at 02:07:46PM +0200, Ragnar Kjxrstad wrote:
> On Sat, Oct 20, 2001 at 03:51:24PM +0200, Stonki wrote:
> > Hello list, Hello Heinz,
> > 
> > on Tuesday you explained me the function of moving data from one
> > hard disc to another.
> > Well, regarding to Murphies Law... pvmove complains about read errors
> > and stops before moving all data.
> > 
> > Error reading input physical volume /dev/hdf1 still 393216 bytes to
> > read).
> 
> If you browse the archive for the last month you will find a couple of
> threads on the subject.
> 
> I've posted a cruel patch to make pvmove ignore read-errors, and update
> the meta-data even if the sector is bad. (The extent will be moved to
> the other disk, but contain garbage). With this patch the behaviour is
> undefined when moving more than one PE. Other than that, I think it
> should work.
> 
> Others posted suggestions and possible some patches too - allthough
> there was no complete perfect solution, I think you should be able to
> make it work from the different tips submitted in the thread.

The first thing I would try is shrinking the filesystem and pv by one
extent.  If this works the pv move should now work ok.

- Joe
