Return-Path: <thornber@btconnect.com>
Date: Wed, 23 May 2001 09:08:06 +0100
Subject: Re: [linux-lvm] LVM Snapshots & journal recovery
Message-ID: <20010523090805.A540@66bassett.freeserve.co.uk>
References: <Pine.LNX.4.33.0105221531320.2330-100000@lustre.us.mvd>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0105221531320.2330-100000@lustre.us.mvd>; from braam@mountainviewdata.com on Tue, May 22, 2001 at 03:32:19PM -0600
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
Cc: braam@mountainviewdata.com

On Tue, May 22, 2001 at 03:32:19PM -0600, Peter J. Braam wrote:
<snip>
> 
> But during recovery, LVM cannot possibly know if the whole process of
> copying out the data from the current to the snapshot area completed
> during the previous run. Yes, LVM updates the redirection table first and
> then copies, but, still, you don't know _where exactly_ the writes stopped
> happening and in particular you don't know if the block was copied already
> or not.
>

The snapshot metadata (redirection table) is written *after* the copy.
Data will not hit the origin device until after the copy on write has
completed successfully.

- Joe
