Message-ID: <20020715124035.GA4609@fib011235813.fsnet.co.uk>
References: <3D2F6464.60908@us.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3D2F6464.60908@us.ibm.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] Re: [Announce] device-mapper beta3 (fast snapshots)
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
Date: Mon Jul 15 07:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Theurer <habanero@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-lvm@sistina.com

Andrew,

On Fri, Jul 12, 2002 at 06:21:08PM -0500, Andrew Theurer wrote:
> Thanks for the results.  I tried the same thing, but with the latest 
> release (beta 4) and I am not observing the same behavior.

I've just read through the evms 1.1-pre4 code.

You (or Kevin Corry rather) have obviously looked at the
device-mapper snapshot code and tried to reimplement it.  I think it
might have been better if you'd actually used the relevent files from
device-mapper such as the kcopyd daemon.

Also I have serious concerns about the correctness of your
implementation, for example:

i) It is possible for the exception table to be updated *before* the
   copy on write of the data actually occurs.  This means that briefly
   the on disk state of the snapshot is inconsistent.  Users of EVMS
   that experience a machine failure will therefor have no option but to
   delete all snapshots.

ii) The exception table is only written out every
    (EVMS_VSECTOR_SIZE/sizeof(u_int64_t)) exceptions.  Surely I've misread
    the code here ?  This would mean I could have a machine that
    triggers 1 fewer exceptions than this, then does nothing to this
    volume, at no point would the exception table get written to disk?
    Or do you periodically flush the exception table as well ?
    Again if the machine crashed the snapshot would be useless.

iii) EVMS is writing the exception table data to the cow device
     asynchronously, you *cannot* do this without risking deadlocks with
     the VM system.

- Joe
