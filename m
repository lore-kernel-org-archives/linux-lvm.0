From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.4 available at www.sistina.com
Message-ID: <20020521065251.GB1035@tykepenguin.com>
References: <20020502215808.GA492@antimony.sistina.com> <1021940894.3438.20.camel@pslgregory>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1021940894.3438.20.camel@pslgregory>
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
Date: Tue May 21 01:53:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, May 20, 2002 at 05:28:10PM -0700, Gregory Ade wrote:
> On Thu, 2002-05-02 at 14:58, AJ Lewis wrote:
> > To clarify, this is a stable release with bugfixes for 1.0.3 only.  Try LVM2
> > if you want to track the latest developments in LVM.
> > 
> > LVM 1.0.4 supports both version 1 and 2 of the metadata.
> > 
> > There's *no* need to run any metadata update tools.
> 
> 
> So, just to be sure, if I have a system that is running LVM 0.91.beta-7,
> I can install LVM 1.0.4 without worries?

Yes you can.
 
> I'm running a SuSE 7.2 install, which uses that version of LVM & their
> own SuSE-fied kernel rpm, but due to other requirements, I'm going to
> need to compile my own kernel from virgin sources.  I'm going to be
> building 2.4.18, specifically with the linux-abi (formerly known as
> iBCS) patch, and figured I'd update everything with the latest LVM code
> while I was at it.  I also remembered that I need the VFS-lock patch,
> since I want to do snapshots and we're running ReiserFS.
> 
> Anything I need to beware of, before doing this?

Yes, beware that I screwed up with the VFS lock patch and the wrong one is in
the 1.0.4 tarball - get the right one from here:
 
http://tech.sistina.com/cgi-bin/cvsweb.cgi/~checkout~/LVM/PATCHES/linux-2.4.18-VFS-lock.patch?rev=1.1


patrick
