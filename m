Date: Tue, 9 Oct 2001 16:12:20 +0100
Subject: Re: [linux-lvm] LVM seems to be causing SCSI errors.
Message-ID: <20011009161220.C745@btconnect.com>
References: <134865292.1002635774089.JavaMail.root@boots>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <134865292.1002635774089.JavaMail.root@boots>; from rmvzj001@sneakemail.com on Tue, Oct 09, 2001 at 06:55:54AM -0700
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

On Tue, Oct 09, 2001 at 06:55:54AM -0700, Karl wrote:
> > > When I ran an fsck on the file system with the errors (I did not re-do
> > > this experiment recently) it found bad blocks on the files system, but
> > > no inconsistencies on the file system itself.
> > 
> > Strange, running out of ideas here.
> > We don't have similar reports, do we?
> 
> I did not see anything when checking the archives. Any thing else I can
> do to provide info on this problem?
> 
> Could the SCSI ID have anything to do with it? Size of drives? Phase of
> the moon? :-)
> 
> It is odd that this is only lvol2 that has the problem. My lvol1 and
> lvol3 have been working perfectly. Maybe I should add an lvol2 and lvol4
> in and see if the even numbers have problems...

Have you tried running md across these disks ?

- Joe
