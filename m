From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] inconsistent metadata
Message-ID: <20031010194212.J6588@uk.sistina.com>
References: <200310092100.11002.mike@gaima.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200310092100.11002.mike@gaima.co.uk>; from mike@gaima.co.uk on Thu, Oct 09, 2003 at 09:00:10PM +0100
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
Date: Fri Oct 10 13:43:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Williams <mike@gaima.co.uk>
Cc: linux-lvm@sistina.com

On Thu, Oct 09, 2003 at 09:00:10PM +0100, Mike Williams wrote:
> Can someone suggest a course of action to get at my data, please?

Something strange must have happened during that long sequence of
operations - perhaps adding disks containing an exported volume
group with the same name as one already on the machine, which makes
LVM2 confused, it seems?

You can look at the metadata history in /etc/lvm/archive to try to
work out the sequence of events and at what point things started
going wrong.  [If you'd like me to take a look, send me a tarball
of /etc/lvm.]

Filters in the config file can be used to hide the 2 devices that say 
they're exported while you rename the real VG.

Alasdair
-- 
agk@uk.sistina.com
