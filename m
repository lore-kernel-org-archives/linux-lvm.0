Date: Fri, 10 Nov 2006 23:02:31 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [parted-devel] Re: [linux-lvm] Proposal for the libLVM project
Message-ID: <20061110230231.GW30653@agk.surrey.redhat.com>
References: <455431FB.3070701@kix.in>
	<20061109211804.GL30653@agk.surrey.redhat.com>
	<87hcx7o5k3.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87hcx7o5k3.fsf@neumann.lab.ossystems.com.br>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>, parted-devel@lists.alioth.debian.org

On Fri, Nov 10, 2006 at 10:21:48AM -0200, Otavio Salvador wrote:
> Alasdair G Kergon <agk@redhat.com> writes:
> > The only library supported for external applications at present is
> > liblvm2cmd and this is basically a wrapper around the command line.

> Right. Is this library being still maintained?
 
Yes.

> > The first job is to sketch out possible interfaces for some examples
> > like that - 'create a PV', 'create/extend a VG' - based on what the tools
> > do today.
> Indeed. How do you wish to coordenate this? Should we propose those to
> mailing list? Or should us use something like a wiki?
 
Mailing list is probably easiest, or wiki for editing with mailing list
posts every so often for people not wanting to watch every individual
wiki edit.

Alasdair
-- 
agk@redhat.com
