Subject: Re: re[2]: [linux-lvm] System Suggestions
From: Steven Critchfield <critch@dtsam.com>
In-Reply-To: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>
References: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>
Content-Transfer-Encoding: 7bit
Message-Id: <1015450169.3240.80.camel@Steven>
MIME-Version: 1.0
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
Date: Wed Mar  6 15:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 2002-03-06 at 14:59, Greg Freemyer wrote:
> Anthony,
> 
> I'd be careful with the IDE Raid controller.
> 
> We just built a lab machine with a Promise IDE Raid controller and the assumption that we could get it and XFS to co-exist.
> 
> I'm not doing the work, but the engineer that is tells me that the Promise Patch Kit only works with a very limited number of stock Redhat Kernels, and that we are NOT free to add the XFS patch.  Even worse, promise does not supply their patch in source, so we are not free to tweak it ourselves.
> 
> I'm not sure I really believe that, but that is what I'm told.
> 
> If you do get the 3Ware IDE RAID controller to work with XFS, please let me know.

Although my first thought is to write RH and remind them how much we
hate it when they build things in a non standard way and therefore cause
other standard systems to break. I have several peices of hardware that
are only supported with a RH kernel. I may be braver than some in the
fact that I have removed the RH kernel and used in to build other
distros with it. RH should provide a source version of the kernel in
which you can attempt to put XFS into, then compile, and should still be
able to load the promise driver into that new kernel. It will take some
effort, but should be usable. Of course you could return it as
essentially broken and buy the 3ware card that has better support.

Steven
