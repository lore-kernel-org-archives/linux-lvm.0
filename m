Date: Fri, 22 Aug 2014 11:39:09 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20140822103909.GF26374@agk-dp.fab.redhat.com>
References: <15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F8@XCH11.scidom.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F8@XCH11.scidom.de>
Subject: Re: [linux-lvm] problem with lvcreate and redirection
	of	stdout/stderr
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
To: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Aug 22, 2014 at 11:02:32AM +0200, Lentes, Bernd wrote:
> On Thu, Aug 21, 2014 at 11:57:51AM -0500, Roger Heflin wrote:
> > I can see how with the vg suspended that might have a problem.
> > But nothing should be getting written to stderr while the device is suspended.
 
> i don't understand what you mean with "should be getting written". Does that mean "it's not possible that something is written" or "it would be better if nothing is written" ?
 
The lvm2 code does not write to stderr in that part of the code.
(If that was happening somehow it would be a bug.)

Alasdair
