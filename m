From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvmove problem: Inappropriate ioctl for device
Message-ID: <20030709165947.B23240@sistina.com>
References: <20030709130201.GA19698@pec.upc.uniba.sk> <20030709164139.A23240@sistina.com> <20030709145450.GB31004@pec.upc.uniba.sk>
Mime-Version: 1.0
In-Reply-To: <20030709145450.GB31004@pec.upc.uniba.sk>; from samek@upc.uniba.sk on Wed, Jul 09, 2003 at 04:54:50PM +0200
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
Date: Wed Jul  9 10:01:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jul 09, 2003 at 04:54:50PM +0200, Peter Samek wrote:
> On Wed, Jul 09, 2003 at 04:41:39PM +0200, Heinz J . Mauelshagen wrote:
> > 
> > You're using a RedHat kernel which is pre-patched by RedHat IRT LVM.
> > Please contact RedHat support.
> > 
> 
> Sorry, may be I was not clear enough, I use RedHat but not a RedHat made
> kernel. It is vanilla 2.4.20 + preempt patch and some VIA KT400 patches
> (AGP).

Ah :)

The pvmove should work with the RedHat kernel *and* the RedHat LVM tools.

Or you should get 1.0.7 from our site, patch vanilla, generate kernel and
1.0.7 tools.

> 
> Peter
> -- 
>  Peter Samek
>  samek@upc.uniba.sk
>  jabber: chaeldi@jabber.sk / icq: 81758305
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
