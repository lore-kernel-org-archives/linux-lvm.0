Date: Tue, 19 Mar 2013 11:23:47 -0400
From: David Teigland <teigland@redhat.com>
Message-ID: <20130319152347.GA986@redhat.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<1363699970-10002-2-git-send-email-bubble@hoster-ok.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1363699970-10002-2-git-send-email-bubble@hoster-ok.com>
Subject: Re: [linux-lvm] [PATCH 01/10] lvchange: Allow cluster lock
	conversion
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladislav Bogdanov <bubble@hoster-ok.com>
Cc: linux-lvm@redhat.com

On Tue, Mar 19, 2013 at 01:32:41PM +0000, Vladislav Bogdanov wrote:
> Allow clvm locks to be converted shared <-> exclusive with corosync/dlm.
> 
> Without this it is impossible to alow both
> * VM migration (shared lock is required)
> * host-side snapshots of VM disks (exlusive lock is required)
> 
> Locks are only converted if --force parameter passed to lvchange.
> 
> Internally LKF_CONVERT flag is passed to dlm, so that is a real lock
> conversion.
> 
> Also deny release of an exclusive lock on a remote note without --force
> flag to lvchange -an.

I'm trying to figure out why the code doesn't already use CONVERT when
possible; I would have expected it to.  (It has to be combined with
NOQUEUE to avoid deadlocks.)  What happens now without this force/CONVERT
patch? a new lock created/requested?
