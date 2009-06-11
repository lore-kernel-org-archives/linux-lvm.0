From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <BAY107-W44C53C48AE344523D4396A8F420@phx.gbl>
References: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>
	<b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>
	<68c491a60902120038g6cede40ckaa5ae58600f5ff21@mail.gmail.com>
	<jwv3aej76uf.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<499483E1.3020509@redhat.com>
	<jwvvdrf5pbn.fsf-monnier+gmane.linux.lvm.general@gnu.org>
	<499541F1.3080501@redhat.com>
	<BAY107-W44C53C48AE344523D4396A8F420@phx.gbl>
Date: Thu, 11 Jun 2009 11:27:01 +0100
Message-Id: <1244716021.18101.338.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: SCSI error: return code = 0x00070000 -
	device-mapper: multipath
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mark Reardon <markreardon4@hotmail.com>
Cc: linux-lvm@redhat.com

On Thu, 2009-06-11 at 11:00 +0100, Mark Reardon wrote:
> 
> Hi All,
> 
> Has anybody every come across this error?  Does anybody know what it
> meens?

That's not really enough information to diagnose the problem. The error
you're seeing comes from the SCSI layer. It's got the value 0x07
(DID_ERROR) in the host byte which is set by the low level driver.

Were any other scsi messages logged around the time of this?

It'd also help to know the kernel and multipath-tools versions that you
are running as there have been changes in how the kernel deals with
transient errors in a multipath configuration over time.

Regards,
Bryn.
