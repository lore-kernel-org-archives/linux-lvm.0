Date: Thu, 6 Sep 2001 13:55:02 +0100
Subject: Re: [linux-lvm] Will LVM stay GPL?
Message-ID: <20010906135502.B638@btconnect.com>
References: <200109061207.f86C79N7021746@pcrz175.HRZ.Uni-Marburg.DE>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200109061207.f86C79N7021746@pcrz175.HRZ.Uni-Marburg.DE>; from gebhardt@HRZ.Uni-Marburg.DE on Thu, Sep 06, 2001 at 02:07:08PM +0200
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

On Thu, Sep 06, 2001 at 02:07:08PM +0200, Thomas Gebhardt wrote:
> Hi,
> 
> after the GFS switch to the non-free SPL: can we hope/trust that
> LVM will remain GPL'd ?
> 
> The SPL FAQ does not address this point. It however, mentions that 
> there will be several closed source LVM related utilities this
> fall. What about LVM itself?

Mike Declerck has already addressed this issue on the mailing list,
but I'll reiterate.  The LVM kernel driver is GPL, the LVM userland
tools are GPL.  We have no intention to change this, and even if we
wanted to we couldn't since lots of people outside Sistina have
contributed.

If it makes people feel happier I will accept patches that add their
names to the copyright notices (assuming they've made significant
contributions).

- Joe
